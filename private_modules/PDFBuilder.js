




class PDFBuilder {
    constructor() {
        
     }

     arrayToString(table,header){
        var string_table = [header];
        for (let index = 0; index < table.length; index++) {
            const element = table[index];
            string_table.push(element.map(String));
        }
        return string_table;
     }


     generateTableDistance(params,header,pdf){
        var table_pdf = {
            style: 'tableExample',
            table: {
                headerRows: 1,
                body: 
                    []
                
            },
            layout: {
                hLineWidth: function (i, node) {
                    return (i === 0 || i === node.table.body.length) ? 2 : 1;
                },
                vLineWidth: function (i, node) {
                    return (i === 0 || i === node.table.widths.length) ? 2 : 1;
                },
                hLineColor: function (i, node) {
                    return (i === 0 || i === node.table.body.length) ? 'black' : 'gray';
                },
                vLineColor: function (i, node) {
                    return (i === 0 || i === node.table.widths.length) ? 'black' : 'gray';
                }
            }
        }
        table_pdf.table.body.push(header);
        for (let index = 0; index < params.data.length; index++) {
            const element = params.data[index];
            
            var table = [{text: params.specimen_name[index], bold: true }];
            var table_string = element.map(String);
            for (let index = 0; index < table_string.length; index++) {
                table.push(table_string[index]);
                
            }
            table_pdf.table.body.push(
                table
            );
        }
        pdf.content.push(table_pdf);
        return pdf;
     }

     generateTableOrdination(params,pdf){
        for (let index = 0; index < params.data.length; index++) {
            const element = params.data[index];
            var coord = element.map(String);
            pdf.content.push({text: params.specimen_name[index]+' -->  ('+coord[0]+','+coord[1]+')', bold:true});
        }
        return pdf;
     }

     generateTable(params,header,dd){
        for (let index = 0; index < params.data.length; index++) {
            const element = params.data[index];
            var table = this.arrayToString(element['specimen'+index],header);
            dd.content.push({text: params.objects_name[index]});
            dd.content.push(
                {
                    style: 'tableExample',
                    table: {
                        headerRows: 1,
                        body: 
                            table
                        
                    },
                    layout: {
                        hLineWidth: function (i, node) {
                            return (i === 0 || i === node.table.body.length) ? 2 : 1;
                        },
                        vLineWidth: function (i, node) {
                            return (i === 0 || i === node.table.widths.length) ? 2 : 1;
                        },
                        hLineColor: function (i, node) {
                            return (i === 0 || i === node.table.body.length) ? 'black' : 'gray';
                        },
                        vLineColor: function (i, node) {
                            return (i === 0 || i === node.table.widths.length) ? 'black' : 'gray';
                        }
                    }
                }
            );
        }
        return dd;
    }
     
     generatePDF_Dataset(params){
        var header = [];
        if(params.dimention === 3){
            header.push('X','Y','Z');
        }else{
            header.push('X','Y');
        }

        
       
        var pdf = {
            content: [ 
                {text: 'Procrustes Superimposition Report', style: 'header'},
                {text: 'Type of Superimposition: '+params.algorithm},
                {text: 'Data Dimension: '+params.dimention+'D'},
                {text: 'Dataset Name: '+params.name},
                {text: 'Source Dataset: '+params.original_name},
                {text: 'Number of Objects: '+params.number_of_objects },  
                {text: 'Number of Landmarks: '+params.number_of_landmarks }
            ],
            styles: {
                header: {
                    fontSize: 18,
                    bold: true,
                    margin: [0, 0, 0, 10]
                },
                subheader: {
                    fontSize: 14,
                    bold: true,
                    margin: [0, 10, 0, 5]
                },
                tableExample: {
                    margin: [0, 5, 0, 15]
                },
                tableHeader: {
                    bold: true,
                    fontSize: 13,
                    color: 'black'
                }
            },
            defaultStyle: {
                // alignment: 'justify'
            },
            pageSize: 'A4'
        }

        
        if(params.excluded_land.length > 0){
            pdf.content.push({text: 'Excluded Landmarks: '});
            for (let index = 0; index < params.excluded_land.length; index++) {
                const element = params.excluded_land[index];
                pdf.content.push({text: 'LM_'+(parseInt(element)+1)});
            }
        }else{
            pdf.content.push({text: 'Excluded Landmarks: N/A'});
        }
        
        if(params.excluded_spec.length > 0){
            pdf.content.push({text: 'Excluded Objects: '});
            for (let index = 0; index < params.excluded_spec.length; index++) {
                const element = params.excluded_spec[index];
                pdf.content.push({text: params.objects_name[element]});
            }
        }else{
            pdf.content.push({text: 'Excluded Objects: N/A'});
        }
        

        pdf.content.push({text: 'Objects: ', style: 'header'});


        return this.generateTable(params,header,pdf);
     }

     generatePDF_Distance(params){

        var header = [];
        header.push({ text: ' ', bold: true });
        for (let index = 0; index < params.specimen_name.length; index++) {
            const element = params.specimen_name[index]; 
            header.push({ text: element, bold: true });       
        }

        var pdf = {
            content: [
                
                {text: 'Distance Matrix Report', style: 'header'},
                {text: 'Type of Distance: '+params.algorithm},
                {text: 'Output Name: '+params.name},
                {text: 'Source Dataset: '+params.original_name},
                {text: 'Number of Objects: '+params.numbers_of_specimen }
            ],
            styles: {
                header: {
                    fontSize: 18,
                    bold: true,
                    margin: [0, 0, 0, 10]
                },
                subheader: {
                    fontSize: 14,
                    bold: true,
                    margin: [0, 10, 0, 5]
                },
                tableExample: {
                    margin: [0, 5, 0, 15]
                },
                tableHeader: {
                    bold: true,
                    fontSize: 13,
                    color: 'black'
                }
            },
            defaultStyle: {
                fontSize: 11
            },
            pageSize: 'A4'
        }

        return this.generateTableDistance(params,header,pdf);
     }

     generatePDF_Ordination(params){

        var pdf = {
            content: [       
                {text: 'Ordination Report', style: 'header'},
                {text: 'Type of Universal MDS: '+params.algorithm},
                {text: 'Output Name: '+params.name},
                {text: 'Source Distance Matrix: '+params.distance_name},
                {text: 'Cartesian Coordinates: ', style: 'subheader'}
            ],
            styles: {
                header: {
                    fontSize: 18,
                    bold: true,
                    margin: [0, 0, 0, 10]
                },
                subheader: {
                    fontSize: 14,
                    bold: true,
                    margin: [0, 10, 0, 5]
                },
                tableExample: {
                    margin: [0, 5, 0, 15]
                },
                tableHeader: {
                    bold: true,
                    fontSize: 13,
                    color: 'black'
                }
            },
            defaultStyle: {
                // alignment: 'justify'
            },
            pageSize: 'A4'
        }

        return this.generateTableOrdination(params,pdf);
     }
        

}
  
module.exports = PDFBuilder;