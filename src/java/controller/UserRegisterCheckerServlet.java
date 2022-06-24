package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.UserRegisterAuthenticator;

public class UserRegisterCheckerServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
    {
        String username=request.getParameter("username"); 
        if(username==null)
        {
            response.sendRedirect("register.jsp"); 
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException
    {
        String name=request.getParameter("name");
        String contact=request.getParameter("contact");
        String password=request.getParameter("password");
        String userid=request.getParameter("userid");
        
        HttpSession session=request.getSession(true);
        String email=(String)session.getAttribute("email");
        
        
        UserDTO user=new UserDTO();
        user.setName(name);
        user.setContact(contact);
        user.setPassword(password);
        user.setEmail(email);
        user.setUsername(userid);
        

        
        UserRegisterAuthenticator auth = new UserRegisterAuthenticator();
        boolean register = false;
       
        register = auth.isRegister(user);
        
        if(register)
        {
            session.setAttribute("userid",userid);
            response.sendRedirect("requireotp.html");
        }
        else
        {
            response.sendRedirect("userGetOTP.jsp");
        }
    }
}