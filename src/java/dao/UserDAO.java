/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.UserDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author arrag
 */
public class UserDAO {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public UserDTO userDetails(String username)
    {
        UserDTO udto = new UserDTO();
        String query = "select * from users where username='"+username+"' ";
        
        try
        {
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                udto.setName(rs.getString("name"));
                udto.setEmail(rs.getString("email"));
                udto.setContact(rs.getString("contact"));
            }
                
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return udto;
    }
    
     public boolean checkEmail(String email)
    {
        String query="select * from users where email='"+email+"'";
        
        try
        {
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
            {
                return false;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return true;
    }
     
      public boolean checkUsername(String uname)
    {
        String query="select * from users where username='"+uname+"'";
        
        try
        {
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
            {
                return false;
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return true;
    }
}
