<%@page import="dao.UserDAO"%>
<%
   
    if(request.getParameter("uname")!=null) //get "uname" jQuery & Ajax part this line 'data:"uname="+username' from index.jsp file check not null
    {
        String user_name=request.getParameter("uname"); //getable "uname" store in new "user_name variable"
        
        try
        {
            UserDAO dao = new UserDAO();
            boolean check= dao.checkUsername(user_name);
            if(!check)               
            {  
                %>
                <span class="text-danger" style="color: red;">Sorry, <%=user_name%> Already Exists ! </span>
                <%
            }
            else
            {
                %>
                <span class="text-success" style="color: green;">Username is available</span>
                <div class="input_div">

                        <div class="input_text"> <input class="confirm_pass_type" name="password" type="password" require required> <label>Create Password</label> <i class="fa fa-eye-slash con_eye"></i> </div>
                    </div>
                                    <div class="button step_2 step_4"><button class="next_btn">Submit&nbsp;<i class="fa fa-send" style="font-size: 3.5vh;"></i></button> </div>

                <%
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
%>