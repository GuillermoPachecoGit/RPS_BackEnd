var bd=require('../routes/db_connect/db');
var R = require("r-script")
var parseJSON = require('./parseR/parseJSON');
var parser = new parseJSON();
var pdfBuilder = require('./PDFBuilder');
var builder = new pdfBuilder();

process.on('message', (msg) => {
        req =  msg;
        var project_id = req.project_id;
        var dataset_id = req.dataset_id;
        var algorithm = req.algorithm_selected;
        var data;
        console.log('Run -> Distance analyze');
        var params = {}
        //obtengo dataset
        bd.query('SELECT * FROM dataset_json where project_id = $1 and dataset_id = $2',[project_id,dataset_id],function(err, result){
        if(err){
            res.status(200).json({ "error": "Error in request." });
            }
            else{
            data = result.rows[0];
            //corro el algoritmo
            params.original_name = data['dataset_name'];
            params.numbers_of_specimen  = data['numbers_of_specimen'];
            var out;
            var prefix = '';
            switch(algorithm){
            case 2:
                out = R("r_scripts/RobustDistance.R")
                .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']['data']) })
                .callSync();
                prefix = 'rD_';
                params.algorithm = 'Resistant Distance'
            break;
            case 1:
                out = R("r_scripts/CMDistance.R")
                .data({"num_specimen" : data['numbers_of_specimen'],"num_landmark": data['numbers_of_landmark'] ,"dim": data['dimention'] , "data": parser.generateArraySpecimens(data['specimens']['data']) })
                .callSync();
                prefix = 'lsD_';
                params.algorithm = 'Least-Squares Distance';
            break;
            } 
            var dataR  = JSON.parse(out);
            dataR.specimen_name = data['specimen_name'];
            dataR.name = req.distance_name;
            bd.query('INSERT INTO distance values(DEFAULT,$1,$2,$3,$4,$5,$6,0) RETURNING distance_id',[data['dataset_id'],data['project_id'],prefix+data['file_name'],JSON.stringify(dataR.data),JSON.stringify(dataR.specimen_name),data['dimention']], function(err, result){
                if(err){
                    process.send( { "error": "Error in the connection with database." });
                }
                else{
                    dataR.distance_name = req.distance_name+'_'+result.rows[0]['distance_id'];
                    dataR.distance_id = result.rows[0].distance_id;
                    dataR.project_id_ref = data['project_id'];
                    dataR.dataset_id_ref = data['dataset_id'];
                    
                    if(JSON.stringify(dataR.specimen_name) === JSON.stringify({})){
                        dataR.specimen_name = [];
                        for (let index = 0; index < dataR.dimention; index++) {
                        dataR.specimen_name.push('trace'+index);
                        }
                    }
                    params.name = dataR.distance_name;
                    params.specimen_name = dataR.specimen_name;
                    params.data = dataR.data;
                    var pdf_aux = builder.generatePDF_Distance(params);
                    dataR.pdf = pdf_aux;
                    dataR.node_tree = req.node_tree;
                    bd.query('UPDATE distance SET distance_name = $1, pdf = $3 WHERE distance_id = $2',[prefix+data['dataset_name']+'_'+result.rows[0].distance_id, dataR.distance_id, JSON.stringify(pdf_aux)], function(){ 
                        if(error){
                            process.send({ "error": "Error in the connection with database." });
                        }
                     }); 
                     
                    process.send(dataR);
                    console.log('Finished -> Distance Analize');  
                }
                });
        }
        });
});