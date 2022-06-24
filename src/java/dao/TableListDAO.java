/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.TableListDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TableListDAO {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public ArrayList<TableListDTO> viewHistory(String username)
    {
        ArrayList<TableListDTO> tlist = new ArrayList<>();
        
        String query = "select * from tabledata_"+username+" order by date_accessed desc, time_accessed desc";
        try
        {
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                TableListDTO ldto = new TableListDTO();
                ldto.setTable_name(rs.getString("table_name"));
                ldto.setTable_desc(rs.getString("table_desc"));
                ldto.setTable_id(rs.getString("table_id"));
                ldto.setDate_accessed(rs.getString("date_accessed"));
                ldto.setTime_accessed(rs.getString("time_accessed"));
                tlist.add(ldto);
           }
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return tlist;
    }
    
    public ArrayList<TableListDTO> viewAllTable(String username)
    {
        ArrayList<TableListDTO> tlist = new ArrayList<>();
        
        String query = "select * from tabledata_"+username+" order by table_name";
        try
        {
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                TableListDTO ldto = new TableListDTO();
                ldto.setTable_name(rs.getString("table_name"));
                ldto.setTable_desc(rs.getString("table_desc"));
                ldto.setTable_id(rs.getString("table_id"));
                ldto.setDate_accessed(rs.getString("date_accessed"));
                ldto.setTime_accessed(rs.getString("time_accessed"));
                tlist.add(ldto);
           }
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return tlist;
    }
    
}
