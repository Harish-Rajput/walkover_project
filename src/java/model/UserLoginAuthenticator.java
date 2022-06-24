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

public class UserLoginAuthenticator 
{
  public String isLogin(UserDTO user)
  {
    DBConnector db=new DBConnector();
    Statement st=db.getStatement();
    
    String userid=user.getUsername();
    String password=user.getPassword();
    String mode=user.getMode();           
    
    String query="";
    String tablepassword="";
    
    if(mode.equals("email"))
    {
        query ="select password from users where email='"+userid+"'";
    }
    else
    {
        query ="select password from users where username='"+userid+"'";
    }
      System.out.println(query);
    try
    {
        ResultSet rs=st.executeQuery(query);
        
        if(rs.next())
        {
            tablepassword=rs.getString("password"); 
            if(userid!=null && password!=null && !userid.equals("")&& password.equals(tablepassword))
            {
                if(mode.equals("email"))
                {
                    query ="select username from users where email='"+userid.trim()+"'";
                    
                    rs=st.executeQuery(query);
                    if(rs.next())
                    {
                        return rs.getString("username");
                    }
                }
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

