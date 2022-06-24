<%@page import="dto.UserDTO"%>
<%@page import="dao.AdminDAO"%>
<!doctype html>
<html lang="en">

<head>
    <title>Admin Dashboard</title>
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
    String userid = (String) session.getAttribute("userid");
    if(userid==null)
    {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
    
    AdminDAO adao = new AdminDAO(); 
    UserDTO udto = adao.showAdminDetails(userid);
    
%>
    <div class="wrapper d-flex align-items-stretch">
        <nav id="sidebar">
            <div class="p-4 pt-5">
                <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.jpg);"></a>
                <ul class="list-unstyled components mb-5">
                    <li class="active">
                        <a href="adminDashboard.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="adminAllUsers.jsp">View All Users</a>
                    </li>
                    <li>
                        <a href="adminDeleteUser.jsp">Delete User</a>
                    </li>
                    <li>
                        <a href="AdminLogoutCheckerServlet">Logout</a>
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
                            Official </a>
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
                                <a class="nav-link" href="AdminLogoutCheckerServlet">Logout</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>

            <div style="margin-top: 20px;" class="row">
                <div class="col-xl-12">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Admin Profile</div>
                        <div class="card-body text-center">
                            <br>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary"><%=udto.getName()%></div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Username</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary"><%=userid%></div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary"> <%=udto.getEmail()%></div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Mobile</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary"><%=udto.getContact()%></div>
                                </div>
                                <hr>
                                <br>
                                
                        </div>
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



    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>

    <!-- demo app -->
    <script src="assets/js/pages/demo.form-wizard.js"></script>
        <script src="assets/sidebar.min.js"></script>
</body>

</html>