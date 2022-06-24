/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AdminLoginAuthenticator 
{
  public String isLogin(UserDTO user)
  {
    DBConnector db=new DBConnector();
    Statement st=db.getStatement();
    
    String userid=user.getUsername();
    String password=user.getPassword();       
    
    String query="";
    String tablepassword="";
    
    query ="select password from admin where username='"+userid+"'";
      System.out.println(query);
   
    try
    {
        ResultSet rs=st.executeQuery(query);
        
        if(rs.next())
        {
            tablepassword=rs.getString("password"); 
            if(userid!=null && password!=null && !userid.equals("")&& password.equals(tablepassword))
            {
              return userid;
            }
        }
    }
    catch(SQLException e)
    {
        System.out.println(e);
    }
    
  return "false";
  }
}

