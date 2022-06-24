/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.TableListDTO;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;


public class TableDAO {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public ArrayList<ArrayList<String>> showTable(String table_id)
    {
        ArrayList<ArrayList<String>> alist = new ArrayList<>();
        
        String query = "select * from "+table_id+" ";
        try
        {
            ResultSet rs = st.executeQuery(query);
            ResultSetMetaData rsMetaData = rs.getMetaData();
            int count = rsMetaData.getColumnCount();
            ArrayList<String> clist = new ArrayList<>();
            for(int i = 1; i<=count; i++) 
            {
                clist.add(rsMetaData.getColumnName(i));
            }
            alist.add(clist);
            

            while(rs.next())
            {
                ArrayList<String> rlist = new ArrayList<>();
                for(int i = 1; i<=count; i++)
                {
                    rlist.add(rs.getString(i));
                }
                alist.add(rlist);
            }
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return alist;
    }
    
    public TableListDTO viewTableData(String username , String table_id)
    {
        TableListDTO ldto = new TableListDTO();
        
        //Getting the current date and time
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now(); 
        String dt = dtf.format(now);
        
        String[] arrOfdt = dt.split(" ");
        String date = arrOfdt[0];
        String time = arrOfdt[1];
        
        String query = "select * from tabledata_"+username+" where table_id='"+table_id+"' ";
        try
        {
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                ldto.setTable_name(rs.getString("table_name"));
                ldto.setTable_desc(rs.getString("table_desc"));
                ldto.setTable_id(rs.getString("table_id"));
                ldto.setDate_accessed(rs.getString("date_accessed"));
                ldto.setTime_accessed(rs.getString("time_accessed"));
           }
            
            query = "update tabledata_"+username+" set date_accessed='"+date+"', time_accessed='"+time+"' where table_id='"+table_id+"' ";
            st.executeUpdate(query);
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return ldto;
    }
    
    
    public boolean updateTableData(ArrayList<ArrayList<String>> tlist , String table_id)
    {
        
        
        //Truncate Existing Table;
        String query = "TRUNCATE TABLE "+table_id+"";
        try
        {
            int x = st.executeUpdate(query);
            int y = 0;
            if(x>-2)
            {
                for(int i=0; i<tlist.size(); i++)
                {
                    ArrayList<String> slist= tlist.get(i);
                    String temp = "";
                    for(int j=0; j<slist.size() -1; j++)
                    {
                        temp = temp+"'"+ slist.get(j)+"', ";
                    }
                    temp = temp+"'" + slist.get(slist.size() - 1)+"'";
                    
                    
                    
                    query = "insert into "+table_id+" values( "+temp+" )";
                    y = st.executeUpdate(query);
                 }
                
                if(y>0)
                {
                    return true;
                }
                
            }
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return false;
    }
}
