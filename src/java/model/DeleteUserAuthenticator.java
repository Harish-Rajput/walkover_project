/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class DeleteUserAuthenticator {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public boolean deleteUser(String uname)
    {
        ArrayList<String> list = new ArrayList<>();
        String query1 = "Delete from users where username='"+uname+"' ";
        String query2 = "Select table_id from tabledata_"+uname+" ";
        String query3 = "Drop table tabledata_"+uname+" ";
        
        int x = 0;
        try
        {
            ResultSet rs = st.executeQuery(query2);
            while(rs.next())
            {
                list.add(rs.getString(1));
            }
            
            for(int i=0; i<list.size(); i++)
            {
                String query = "DROP TABLE "+list.get(i)+"";
                st.executeUpdate(query);
            }
            
            st.executeUpdate(query3);
            
            x = st.executeUpdate(query1);
            if(x>0)
            {
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
