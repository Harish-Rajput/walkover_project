<%-- 
    Document   : dashboard
    Created on : 13 Jun, 2022, 12:02:11 AM
    Author     : arrag
--%>

<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@page import="dto.TableListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TableListDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>Dashboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">


    <style>
        .col-xl-4 {
            padding-bottom: 12px;
        }
    </style>

</head>

<body>

    <%
        
            String username = (String)session.getAttribute("userid");
            if(session.getAttribute("userid")==null)
            {
                response.sendRedirect("login.jsp");
                return;
            }
            
            //Getting User Details
            UserDAO udao = new UserDAO();
            UserDTO udto = udao.userDetails(username);
            
    %>
    
    <div class="wrapper d-flex align-items-stretch">
        <nav id="sidebar">
            <div class="p-4 pt-5">
                <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.jpg);"></a>
                <ul class="list-unstyled components mb-5">
                    <li class="active">
                        <a href="dashboard.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="updateProfile.jsp">Update Profile</a>
                    </li>
                    <li>
                        <a href="createTable.jsp">Create Table</a>
                    </li>
                    <li>
                        <a href="viewHistory.jsp">View History</a>
                    </li>
                    <li>
                        <a href="viewAllTables.jsp">View All Tables</a>
                    </li>
                    <li>
                        <a href="LogOutCheckerServlet">Logout</a>
                    </li>
                </ul>

               <div class="footer">
                    <p>
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script> All Rights Reserved
                        <i class="icon-heart" aria-hidden="true"></i> by <a href="#"
                            target="_blank">The Trio
                            Official ✨</a>
                    </p>
                </div>

            </div>
        </nav>

        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle Menu</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>

                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="LogOutCheckerServlet">Logout</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>

        <div class="col-xl-14">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <form action="UpdateProfileServlet" method="Post">
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Username </label>
                            <input class="form-control" name="username" id="inputUsername" type="text" placeholder="Enter your username" value="<%=username%>" disabled>
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputFirstName">Full Name</label>
                                <input class="form-control" id="inputFirstName" name="name" type="text" placeholder="Enter your first name" value="<%=udto.getName()%>">
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLastName">Phone Number</label>
                                <input class="form-control" id="inputLastName" name="contact" type="text" placeholder="Enter Your Contact No." value="<%=udto.getContact()%>">
                            </div>
                        </div>
                        
                        <!-- Form Group (email address)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputEmailAddress">Email address</label>
                            <input class="form-control" id="inputEmailAddress" name="email" type="email" placeholder="Enter your email address" value="<%=udto.getEmail()%>" hidden>
                            <input class="form-control" id="inputEmailAddress" name="email" type="email" placeholder="Enter your email address" value="<%=udto.getEmail()%>" disabled>
                        </div>
                        
                        <!-- Save changes button-->
                        <button class="btn btn-primary" type="submit">Save changes</button>
                    </form>
                </div>
            </div>
        </div>


        </div>
    </div>
    <link href="assets/bootstrap.min.css" rel="stylesheet">

    <link href="assets/datatables.bootstrap4.min.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
    <script src="assets/jquery.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="assets/jquery.datatables.min.js"></script>

    <script src="assets/datatables.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>

    <script src="assets/sidebar.min.js"></script>


    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>

    <!-- demo app -->
    <script src="assets/js/pages/demo.form-wizard.js"></script>
</body>

</html>