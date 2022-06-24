package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FinalServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session=request.getSession(true);
        String userid=(String)session.getAttribute("userid");
        if(userid==null)
        {
            response.sendRedirect("userLogin.jsp");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String otp = request.getParameter("otp");
        String userotp = request.getParameter("userotp");
        
        String page=request.getParameter("page");
        
        if(page.equals("getotp"))
        {
        if(otp.equals(userotp))
        {
            System.out.println("OTP Matched Successfully!!!!!");
            response.sendRedirect("register.jsp");
        }
        else
        {
            System.out.println("OTP Didn't Match!!!!!!");
            response.sendRedirect("userGetOTP.jsp");
        }
        }
        
       
    }
}
