class ParseJSON {

  constructor() { }
  
    parseDataR(out,show_consensus,algorithm) {
        var data_R =  JSON.parse(out);
        var dataset = data_R.data;

        var n_landmarks = dataset.length;
        var dim = dataset[0].length;
        var n_specimen = dataset[0][0].length;
        
        data_R.specimens = { data:[], excluded_land: [], excluded_spec: [], numbers_of_landmarks:0, numbers_of_specimens: 0, root_number_landmarks: 0, root_number_specimens: 0 };
        data_R.specimen_name = [];

        var specimen;
        for (let i_spec = 0; i_spec < n_specimen; i_spec++) {
            specimen = [];
            for(let i_land = 0; i_land < n_landmarks; i_land++){
                switch (dim) {
                    case 2:
                        specimen.push([ dataset[i_land][0][i_spec],dataset[i_land][1][i_spec] ]);
                        break;
                
                    default:
                        specimen.push([ dataset[i_land][0][i_spec],dataset[i_land][1][i_spec], dataset[i_land][2][i_spec]]);
                        break;
                } 
            }
            var name = "specimen".concat(i_spec);
            data_R.specimens.data.push({ [name] : specimen});
            
            
            if(algorithm != 1 &&  (i_spec == (n_specimen-1)) && show_consensus){
                data_R.specimen_name.push("Consensus");
            }else{
                data_R.specimen_name.push("Object_".concat(i_spec));
            }
            
            
        }

        delete data_R.data;
        data_R.colors = this.generateArrayColors(n_specimen);
        return data_R;
    }


    OnlyParseDataR(out) {
        var data_R =  JSON.parse(out);
        var dataset = data_R.data;

        var n_landmarks = dataset.length;
        var dim = dataset[0].length;
        var n_specimen = dataset[0][0].length;
        
        data_R.specimens = { data:[], excluded_land: [], excluded_spec: [], numbers_of_landmarks:0, numbers_of_specimens: 0 , root_number_landmarks: 0 , root_number_specimens: 0 };
   
        var addName = false;
        console.log('specimen_name: '+JSON.stringify(data_R));
        if(JSON.stringify(data_R.specimen_name) === JSON.stringify({})){
            addName = true;
            data_R.specimen_name = [];
        }

        var specimen;
        for (let i_spec = 0; i_spec < n_specimen; i_spec++) {
            specimen = [];
            for(let i_land = 0; i_land < n_landmarks; i_land++){
                switch (dim) {
                    case 2:
                        specimen.push([ dataset[i_land][0][i_spec],dataset[i_land][1][i_spec] ]);
                        break;
                
                    default:
                        specimen.push([ dataset[i_land][0][i_spec],dataset[i_land][1][i_spec], dataset[i_land][2][i_spec]]);
                        break;
                } 
            }
            var name = "specimen".concat(i_spec);
            data_R.specimens.data.push({ [name] : specimen});      
            if(addName){
                data_R.specimen_name.push("Object_".concat(i_spec));
            }
        }

        delete data_R.data;
        data_R.colors = this.generateArrayColors(n_specimen);
        return data_R;
    }

    generateArrayColors(length) {
        var colors = [];
        while (colors.length < length) {
            do {
                var color = Math.floor((Math.random()*1000000)+1);
            } while (colors.indexOf(color) >= 0);
            colors.push("#" + ("000000" + color.toString(16)).slice(-6));
        }
        return colors;
    }

    generateArraySpecimens(data){
        var result = [];

        for (let index = 0; index < data.length; index++) {
            const element = data[index];
            result.push(element['specimen'+index]);
        }
        return JSON.stringify(result);
    }

    generateArraySpecimensAnalize(data,excluded_spec, excluded_land){
        var result = [];
        console.log("DESDE LA BASE: "+ JSON.stringify(data));
        for (let index = 0; index < data['data'].length; index++) {
            if(!excluded_spec.includes(index.toString())){
                const element = data['data'][index];
                result.push(this.cleanLandmarks(element['specimen'+index],excluded_land));
            }           
        }
        console.log('cantidad de specimen: '+result.length);
        return JSON.stringify(result);
    }

    cleanLandmarks(data,excluded_land){
        var result = [];
        for (let index = 0; index < data.length; index++) {
            if(!excluded_land.includes(index.toString())){
                result.push(data[index]);
            }  

        }
        console.log('cantidad de land: '+result.length);
        return result;
    }
}

module.exports = ParseJSON;