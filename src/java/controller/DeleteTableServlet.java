/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DeleteTableAuthenticator;
import model.DeleteUserAuthenticator;

/**
 *
 * @author arrag
 */
public class DeleteTableServlet extends HttpServlet {

   public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException
{
    
    HttpSession session = request.getSession(true);
    String userid=(String)session.getAttribute("userid"); 
    System.out.println(userid);
    if(userid==null)
    {
        response.sendRedirect("login.jsp"); 
    }
    
     
    String table_id = request.getParameter("table_id");
    
    DeleteTableAuthenticator dua  = new DeleteTableAuthenticator();
    boolean result = dua.deleteTable(table_id , userid);
    
    if(result)
    {
        System.out.println("Deleted Successfully!!!");
        response.sendRedirect("dashboard.jsp");
    }
    
    else
    {
        System.out.println("Deletion Failed!!!");
        response.sendRedirect("table.jsp?table_id="+table_id+"");
    }
    
}

}
