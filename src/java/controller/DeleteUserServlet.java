package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AdminLoginAuthenticator;
import model.DeleteUserAuthenticator;
import model.UserLoginAuthenticator;

/**
 *
 * @author Admin
 */
public class DeleteUserServlet extends HttpServlet 
{
public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
{
    String userid=request.getParameter("userid"); 
    if(userid==null)
    {
        response.sendRedirect("adminLogin.jsp"); 
    }
}
public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
{
    String uname = request.getParameter("uname");
    
    DeleteUserAuthenticator dua  = new DeleteUserAuthenticator();
    boolean result = dua.deleteUser(uname);
    
    if(result)
    {
        System.out.println("Deleted Successfully!!!");
        response.sendRedirect("adminDeleteUser.jsp");
    }
    
    else
    {
        System.out.println("Deletion Failed!!!");
        response.sendRedirect("adminDeleteUser.jsp");
    }
}
}
