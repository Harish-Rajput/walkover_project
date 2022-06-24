<!doctype html>
<html>
<head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Register</title>
        <link href='' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <link rel="stylesheet" href="style.css">        
        
        <style>
            .container .card
            {
                height: 400px;
            }
        </style>
        
</head>
<body>
    <%String email=(String)session.getAttribute("email");%>
    <%
        if(email==null)
        {
            response.sendRedirect("userGetOTP.jsp");
            return;
        }
    %>

<div class="container">
    <div class="card">
        <!--<div class="form">-->
          <form class="form" method="post" action="UserRegisterCheckerServlet" >
            <div class="right-side ">
                 <div class="main active">
                    <div class="manage" style="margin: 0px; padding: 0%; font-size: 10px;font-weight: bolder;">
                        <h1>Creating account is fast and easy!</h1>
                    </div>
                   
                    <div class="input_div" >
                        <div class="input_text"> <input class="written_name" type="text" name="name" require required> <label>Full Name</label> </div>
                    </div>
                   
                    
                    <div class="input_div" >
                        <div class="input_text"> <input type="number" name="contact" require required> <label>Phone No.</label> </div>
                    </div>
                    <div class="input_div">
                        <div class="input_text"> <input type="text" name="email" value="<%out.println(email);%>" disabled> <label></label> </div>
                    </div>
                    
                    
                    <div class="button step_1" style="margin:3%;"> 
                        <button class="next_btn" >Register&nbsp;
                        <i class="fa fa-arrow-circle-right" style="font-size:3vh;"></i>
                    </button>
                     </div>
                </div>
                <div class="main ">
                    <div class="manage">
                        <h3>Security</h3>
                    </div>
                    <div class="input_div">
                        <div class="input_text"> <input type="text" name="userid" id="userid" require required> <label> Create Username</label> <i class="fa fa-eye-slash password_eye"></i></div>
                    </div>
                    <span id="available">
                    </span>
                    
                   
                    
                </div>

                </div>
            </form>
        </div>
    </div>

<script src="app.js"></script>

<script>
            function removeSpaces(string) {
            return string.split(' ').join('');
           }
</script>  
<script type="text/javascript">
$(document).ready(function(){
   
    $("#userid").blur(function(){
        
        var username =$("#userid").val();
   
        if(username.length >= 3)
        {
            $.ajax({
                url:"usernameCheck.jsp",
                type:"post",
                data:"uname="+username,
                dataType:"text",
                success:function(data)
                {
                    $("#available").html(data)
                    
                } 
            });
        }
        else
        {
          $("#available").html(" ");
        }
        
   }); 
   
});    
</script>
</body>
</html>