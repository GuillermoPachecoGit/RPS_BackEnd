var db = require('../routes/db_connect/db');
class PostgreSQL_DB {
    constructor() {
        
     }

     select(table,values){

     }

     update(table,fields,values){

     }

     delete(table,fields,values){
        var script = 'UPDATE '+table+' WHERE ' + generateListCondition(fields,values)+';';
        db.execute(script,values);
     }

     generateListCondition(fields,values){
        var list = '';
        for (let index = 0; index < fields.length; index++) {
             list += values+'= ?';
             if(index != fields.length-1){
                list +=  ' AND ';
             }
        }
        return list;
     }

     insert(table,values){
        var script = 'INSERT INTO'+table+' VALUES (' + generateList(values)+');';
        try {
            db.execute(script);
            return true;
        } catch (error) {
            return false;
        }
     }

     generateList(values){
        var list = 'DEFAULT';
        for (let index = 0; index < values.length; index++) {
            const element = array[index];
            
        }
        return list;
     }
}
  
export default PostgreSQL_DB;