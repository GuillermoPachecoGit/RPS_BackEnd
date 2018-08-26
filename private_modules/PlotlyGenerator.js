class PlotlyGenerator {
    constructor() {
        
     }

     generateGraphicsPlotly3D(params,name){
        let data = [];
        let specimens = params['data'];
        let colors = params['colors'];
        let names = params['objects_name'];

        for (let index = 0; index < specimens.data.length; index++) {
          const element = specimens.data[index]['specimen' + index];

         let resultArray = this.generateArrayPlot(element, params.dimention);

          var trace = {
            x: resultArray[0],
            y: resultArray[1],
            z: resultArray[2],
            mode: 'markers',
            marker: {
              size: 4,
              line: {
              color: colors[index],
              width: 0.5},
              opacity: 0.8},
            type: 'scatter3d',
            name: names[index],
            text: this.namesLandmaks(params)
          };
          data.push(trace);
        }
        return data;
      }

      getLayoutPlotly3D(algorithm,name){
        var aux = "";
        if(algorithm == 1)
            aux = "Generalizaded Least-Squares Procrustes Superimposition" 
        if(algorithm == 2)
            aux = "Generalizaded Resistant Procrustes Superimposition"
        if(algorithm == 3)
            aux = "Dataset"        

        aux += ": "+name;
        var layout = {
            margin: 10,
            xaxis: { nticks: 10, showline: false} ,
            yaxis: { scaleanchor: "x", showline: false},
            zaxis: { scaleanchor: "x", showline: false},
            title: aux
          };
          return layout;
      }

     getLayoutPlotly2D(algorithm,name){
      var aux = "";
        if(algorithm == 1)
            aux = "Generalizaded Least-Squares Procrustes Superimposition" 
        if(algorithm == 2)
            aux = "Generalizaded Resistant Procrustes Superimposition"
        if(algorithm == 3)
            aux = "Dataset"  
      
      aux = aux+ ": "+name;
      var layout = {
        margin: 2,
        xaxis: { nticks: 10 , showline: false} ,
        yaxis: { scaleanchor: "x" , showline: false},
        title: aux
      };
      return layout;
    }

  generateArrayPlot(specimen, dim) {
        let result = [[], [], []];
        for (let index = 0; index < specimen.length; index++) {
          const element = specimen[index];
              result[0].push(element[0]);
              result[1].push(element[1]);
              if (dim === 3) {
                result[2].push(element[2]);
              } 
              else 
              {
                result[2].push(0);
              }
        }
        return result;
  }
    
  generateGraphicsPlotly2D(params){
    let data = [];
    let specimens = params['data'];
    let colors = params['colors'];
    let names = params['objects_name'];
    for (let index = 0; index < specimens.data.length; index++) {
      const element = specimens.data[index]['specimen' + index];

     let resultArray = this.generateArrayPlot(element, params.dimention);
      var trace = {
        x: resultArray[0],
        y: resultArray[1],
        mode: 'markers',
        marker: {
          size: 4,
          line: {
          color: colors[index]}
        },
        type: 'scattergl',
        name: names[index],
        text: this.namesLandmaks(params)
      };
      data.push(trace);
    }
    return data;
  }

  namesLandmaks(params){
    var result = [];
    for (let index = 0; index < params.data.root_number_landmarks; index++) {
      if(!params.data.excluded_land.includes(index.toString())){
          result.push('LM_'+(index+1).toString());
      }
    }
    return result;
  }

  generateOrdinationGraphic(params){
    let colors = params['colors'];
    var names = params['objects_name'];
    var data = params['data'];
    var dataResult = [];
    for (let index = 0; index < data.length; index++) {
      const element = data[index];
      var trace = {
        x: [element[0]],
        y: [element[1]],
        mode: 'markers',
        type: 'scatter',
        name: names[index],
        textposition: 'top center',
        textfont: {
          family:  'Raleway, sans-serif'
        },
        marker: { 
          size: 6,
          color: colors[index]
        }
      };
      dataResult.push(trace);
    }
    return dataResult;
  }

  getLayoutPlotlyOrdination2D(algorithm,name){
    var aux = "";
    if(algorithm == 1)
        aux = "Least-Squares Universal MDS";
    if(algorithm == 2)
        aux = "Resistant Universal MDS";

    aux += ": "+name;
    var layout = {
      margin: 5,
      gridwidth: 0,
      xaxis: { nticks: 10} ,
      yaxis: { scaleanchor: "x"},
      title: aux
    };
    return layout;
  }

}
  
module.exports = PlotlyGenerator;