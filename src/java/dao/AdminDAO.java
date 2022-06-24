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
import java.util.ArrayList;

/**
 *
 * @author arrag
 */
public class AdminDAO {
    
    DBConnector db = new DBConnector();
    Statement st = db.getStatement();
    
    public UserDTO showAdminDetails(String username)
    {
        UserDTO udto = new UserDTO();
        
        String query = "select * from admin where username='"+username+"' ";
        try
        {
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                udto.setEmail(rs.getString("email"));
                udto.setName(rs.getString("name"));
                udto.setContact(rs.getString("contact"));
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return udto;
    }
    
    public ArrayList<UserDTO> getAllUsers()
    {
        ArrayList<UserDTO> list = new ArrayList<>();
        
        String query = "select * from users";
        try
        {
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                UserDTO udto = new UserDTO();
                udto.setName(rs.getString("name"));
                udto.setEmail(rs.getString("email"));
                udto.setUsername(rs.getString("username"));
                udto.setContact(rs.getString("contact"));
                
                list.add(udto);
            }
            
            return list;
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return list;
    }
}
