
package model;

import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author arrag
 */
public class DeleteTableAuthenticator {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public boolean deleteTable(String table_id , String uname)
    {
        ArrayList<String> list = new ArrayList<>();
        String query1 = "Delete from tabledata_"+uname+" where table_id='"+table_id+"' ";
        String query2 = "Drop table "+table_id+" ";
        
        int x = 0;
        try
        {
            
            x = st.executeUpdate(query1);
            if(x>0)
            {
                st.executeUpdate(query2);
                return true;
            }
            
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        
        return false;
    }
    
}
