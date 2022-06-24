package model;

import db.DBConnector;
import dto.UserDTO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class UserRegisterAuthenticator 
{
    
    DBConnector db=new DBConnector();
    Statement st=db.getStatement();
    Connection con = db.getConnection();


public boolean isRegister(UserDTO user) throws IOException
{

    String name=user.getName();
    String contact=user.getContact();
    String userid=user.getUsername();
    String email=user.getEmail();
    String password=user.getPassword();


    String query="insert into users values(?,?,?,?,?)";
    try
    {
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1,email);
        ps.setString(2,password);
        ps.setString(3,name);
        ps.setString(4,contact);
        ps.setString(5, userid);
        int x = ps.executeUpdate();
        
        if(x>0)
        {
            query = "create table tabledata_"+userid+" ( table_name varchar(100), table_desc varchar(500), table_id varchar(60), date_accessed date, time_accessed time )";
            x = st.executeUpdate(query);
            if(x>=0)
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
