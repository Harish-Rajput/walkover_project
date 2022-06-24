/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.TableDAO;
import dto.TableDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author arrag
 */
public class UpdateTableServlet extends HttpServlet {

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
    
   
    String arr = request.getParameter("sData");
    int col_length = Integer.parseInt(request.getParameter("col_length"));
    String table_id = request.getParameter("table_id");
    
    ArrayList<String> str = new ArrayList<>();
    ArrayList<ArrayList<String>> tlist = new ArrayList<>();
    StringTokenizer st = new StringTokenizer(arr,",");  
     while (st.hasMoreTokens()) {  
         str.add(st.nextToken());  
     }  
     
     int total_col = str.size()/col_length;
     int k=0;
     for(int i=0; i<col_length; i++)
     {
         ArrayList<String> rlist = new ArrayList<>();
         for(int j=0; j<total_col; j++)
         {
             rlist.add(str.get(k));
             k=k+col_length;
         }
         tlist.add(rlist);
         k=i+1;
     }
     
     TableDTO tdto = new TableDTO();
     tdto.setTable_id(table_id);
     tdto.setTlist(tlist);
     
     
     TableDAO tdao = new TableDAO();
     
     boolean result = tdao.updateTableData(tlist, table_id);
     System.out.println(result);
     
     if(result)
     {
         response.getWriter().println("Success");
     }
     
    
}
}
