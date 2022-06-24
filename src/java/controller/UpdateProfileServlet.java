/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UpdateProfileAuthenticator;

/**
 *
 * @author arrag
 */
public class UpdateProfileServlet extends HttpServlet {

   public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
{
    String userid=request.getParameter("userid"); 
    if(userid==null)
    {
        response.sendRedirect("login.jsp"); 
    }
}
public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
{
    
    HttpSession session = request.getSession();
    String username = (String)session.getAttribute("userid");
    
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    
    UserDTO udto = new UserDTO();
    udto.setName(name);
    udto.setEmail(email);
    udto.setContact(contact);
    udto.setUsername(username);
    
    UpdateProfileAuthenticator upa = new UpdateProfileAuthenticator();
    boolean chk = upa.updateProfile(udto);
    
    if(chk)
    {
        response.sendRedirect("dashboard.jsp");
    }
    
    else
    {
        response.sendRedirect("updateProfile.jsp");
    }
}
}
