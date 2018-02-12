class ParseJSON {

  constructor() { }
  
    parseDataR(out) {
        var data_R =  JSON.parse(out);
        var dataset = data_R.data;

        var n_landmarks = dataset.length;
        var dim = dataset[0].length;
        var n_specimen = dataset[0][0].length;
        
        data_R.specimens = [];

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
            
            data_R.specimens.push({ [name] : specimen});
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
        console.log(colors);
        return colors;
    }

    generateArraySpecimens(data){
        var result = [];

        for (let index = 0; index < data.length; index++) {
            const element = data[index];
            result.push(element['specimen'+index]);
        }
        console.log(JSON.stringify(result));
        return JSON.stringify(result);
    }

}

module.exports = ParseJSON;