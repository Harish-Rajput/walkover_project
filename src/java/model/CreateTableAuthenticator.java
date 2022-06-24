/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.TableDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.StringTokenizer;

/**
 *
 * @author arrag
 */
public class CreateTableAuthenticator {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public String createTable(TableDTO tdto)
    {
        String table_id=null;
        String username = tdto.getUsername();
        String table_name = tdto.getTable_name();
        String table_desc = tdto.getTable_desc();
        String primary_key = tdto.getPrimary_key();
        ArrayList<String>col_name = tdto.getCol_name();
        ArrayList<String>col_type = tdto.getCol_type();
        
        int tempindex = 0;
        for(int o = 0; o<col_name.size(); o++)
        {
            if(col_name.get(o).equals(primary_key))
            {
                tempindex = o;
            }
        }
        
        col_type.set(tempindex,"varchar(500)");
        
        
        //Getting the current date and time
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now(); 
        String dt = dtf.format(now);
        
        String[] arrOfdt = dt.split(" ");
        String date = arrOfdt[0];
        String time = arrOfdt[1];
        
       String query = "select * from tabledata_"+username+"";
       try
       {
           ResultSet rs = st.executeQuery(query);
           while(rs.next())
           {
               table_id = rs.getString("table_id");
           }
       }
       
       catch(SQLException e)
       {
           System.out.println(e);
       }
       
       
      
      int i=0;
       
       if(table_id==null)
       {
           i = 1;
       }
       
       else
       {
            String[] arrOfStr = table_id.split("_");
            i = Integer.parseInt(arrOfStr[1]);
       i++;
       }
           
       table_id=username+"_"+i;
       
       String temp = "";
       for(int j=0; j<col_name.size() -1; j++)
       {
           temp = temp + col_name.get(j)+" "+col_type.get(j)+",";
       }
       
       temp = temp + col_name.get(col_name.size()-1)+" "+col_type.get(col_type.size()-1);
        System.out.println("Temp : "+temp);
        System.out.println("Primary_Key : "+primary_key);
       
        if((primary_key!=null) && (!primary_key.equals("null")))
        {
            query = "create table "+table_id+" ( "+temp+", primary key ("+primary_key+") ) ";
        }
        
        else
        {
            query = "create table "+table_id+" ( "+temp+" ) ";
        }
        
       
       try
       {
           int k = st.executeUpdate(query);
           if(k>=0)
           {
               
               query = "insert into tabledata_"+username+" values ('"+table_name+"','"+table_desc+"','"+table_id+"','"+date+"','"+time+"')";
               k = st.executeUpdate(query);
               if(k>0)
               {
                   return table_id;
               }
           }
       }
       
       catch(SQLException e)
       {
           System.out.println(e);
       }
        return null;
    }
}
