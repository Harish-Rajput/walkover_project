/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.TableDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CreateTableAuthenticator;


public class CreateTableServlet extends HttpServlet {

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
        
        HttpSession session=request.getSession(true);
        String userid=(String)session.getAttribute("userid");
        
        String table_name = request.getParameter("table_name");
        String table_desc = request.getParameter("table_desc");
        String primary_key = request.getParameter("primary_key");
        String [] column_name = request.getParameterValues("column_name");
        String [] column_type = request.getParameterValues("column_type");
        
        ArrayList<String> col_list = new ArrayList(Arrays.asList(column_name));
        ArrayList<String> col_type = new ArrayList<>();
        
        for(String i : column_type)
        {
            if(!i.equals("date"))
            {
                col_type.add("text");
            }
            else
            {
                col_type.add("date");
            }
        }
        
        TableDTO tdto = new TableDTO();
        tdto.setCol_name(col_list);
        tdto.setCol_type(col_type);
        tdto.setPrimary_key(primary_key);
        tdto.setTable_name(table_name);
        tdto.setTable_desc(table_desc);
        tdto.setUsername(userid);
        
        CreateTableAuthenticator cta = new CreateTableAuthenticator();
        String table_id = cta.createTable(tdto);
        
        if(table_id!=null)
        {
            response.sendRedirect("table.jsp?table_id="+table_id+"");
        }
        else
        {
            response.sendRedirect("createTable.jsp");
        }
         
    }
}
