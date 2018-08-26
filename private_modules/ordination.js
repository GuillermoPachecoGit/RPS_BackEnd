var bd=require('../routes/db_connect/db');
var R = require("r-script")
var pdfBuilder = require('./PDFBuilder');
var builder = new pdfBuilder();
var plotly = require('./PlotlyGenerator');
var plotlyGenerator = new plotly();

process.on('message', (msg) => {
    req = msg;
    var distance_id = req.distance_id;
    var algorithm = req.algorithm_selected;
    var data;
    var user_id = req.user_id;
    var params = {};
    console.log('Run -> Ordination Analize');
   
    //obtengo dataset
    bd.query('SELECT * FROM distance where distance_id = $1',[distance_id],function(err, result){
      if(err){
          process.send({ "error": "Error in request." });
      }
        else
      {
        data = result.rows[0];
        var out;
        var prefix = '';
        var dimention = 2;
  
        params.distance_name = data['distance_name'];
        switch(algorithm){
          case 1:
            out = R("r_scripts/univMDSeucl.R")
            .data({ "data": JSON.stringify(data['data']), dim : dimention })
            .callSync();
            prefix = 'lsUMDS_';
            params.algorithm = 'Least-Squeares UMDS'
          break;
  
          case 2:
            out = R("r_scripts/univMDSrobust.R")
            .data({"data": JSON.stringify(data['data']), dim : dimention })
            .callSync();
            prefix = 'rUMDS_';
            params.algorithm = 'Resistant UMDS'
          break;
        }
  
        var dataR  = JSON.parse(out);
        dataR.dataset_id = data['dataset_id_ref'];
        dataR.objects_name = data['objects_name'];
        params.specimen_name = data['objects_name'];
        
        bd.query('SELECT colors FROM dataset where dataset_id = $1',[dataR.dataset_id],function(err, result){
          if(err){
              process.send({ "error": "Error in request of specimen colors." });
          }
          else
          {
              dataR.colors = result.rows[0].colors;
              params.data = dataR.data;
              bd.query('INSERT INTO ordination values(DEFAULT,$1,$2,$3,$4,$5,$6,0,NULL) RETURNING ordination_id,ordination_name',[data['dataset_id_ref'],data['distance_id'],prefix+data['distance_name'],JSON.stringify(dataR.data),JSON.stringify(data['objects_name']), JSON.stringify(dataR.colors)], function(err, result){
                    if(err){
                      console.log(err);
                      process.send( { "error": "Error in the connection with database." });
                    }
                    else{
                      dataR.ordination_name = req.ordination_name+'_'+result.rows[0].ordination_id;
                      dataR.name = req.ordination_name;
                      dataR.ordination_id = result.rows[0].ordination_id;
                      params.name = dataR.ordination_name;
                      //PDF
                      var pdf = builder.generatePDF_Ordination(params);
                      console.log(pdf);
                      console.log(result.rows[0].ordination_id);
                      dataR.node_tree = req.node_tree;
                      bd.query('UPDATE ordination SET ordination_name = $1, pdf = $3 WHERE ordination_id = $2',[prefix+data['distance_name']+'_'+result.rows[0].ordination_id,result.rows[0].ordination_id,JSON.stringify(pdf) ], function(){
                        if(JSON.stringify(dataR.specimen_name) === JSON.stringify({})){
                          dataR.objects_name = [];
                          for (let index = 0; index < dataR.dimention; index++) {
                            dataR.objects_name.push('trace'+index);
                          }
                        }
                        dataR.data_plotly =  plotlyGenerator.generateOrdinationGraphic(dataR);
                      dataR.layout = plotlyGenerator.getLayoutPlotlyOrdination2D(algorithm,dataR.ordination_name);
                      process.send(dataR);  
                      console.log('Finished -> Ordination Analize'); 
                      });
                        
                    }
                  });
          }
        });
      }
    });
});