/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.DBConnector;
import dto.UserDTO;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateProfileAuthenticator {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public boolean updateProfile(UserDTO udto)
    {
        
    String name = udto.getName();
    String email = udto.getEmail();
    String contact = udto.getContact();
    String username = udto.getUsername();
    
    String query = "Update users set name='"+name+"' , email='"+email+"', contact='"+contact+"' where username='"+username+"' ";
    
    try
    {
        int x = st.executeUpdate(query);
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
