<%@page import="java.util.ArrayList"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.UserDTO"%>
<%@page import="dao.AdminDAO"%>
<!doctype html>
<html lang="en">

<head>
    <title>Delete User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">





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
    ArrayList<UserDTO> list = adao.getAllUsers();
    
%>
    <div class="wrapper d-flex align-items-stretch">
        <nav id="sidebar">
            <div class="p-4 pt-5">
                <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.jpg);"></a>
                <ul class="list-unstyled components mb-5">
                    <li >
                        <a href="adminDashboard.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="adminAllUsers.jsp">View All Users</a>
                    </li>
                    <li class="active">
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
                        <i class="icon-heart" aria-hidden="true"></i> by <a href="#" target="_blank">The Trio
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
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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



            <h2 class="mb-4">User List</h2>

            <!-- Table Code Begin -->
            <div class="container">
                <div class="col-md-6 col-sm-12" padding="1%;">
                    <div class="well">
                        <form class="form" action="DeleteUserServlet" method="Post">
                            <h4>Enter User ID</h4>
                            <div class="input-group text-center">
                                <input type="text" placeholder="Enter Username To Delete" class="form-control input-lg" id="deleteuserid" name="uname">
                                <span class="input-group-btn"><button type="submit" class="btn btn-primary">Delete
                    User</button></span>
                            </div>
                        </form>
                    </div>
                </div>
                <br><br>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Email I'D</th>
                            <th>Contact No.</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Email I'D</th>
                            <th>Contact No.</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <%
                            for(int i=0; i<list.size(); i++)
                            {
                                UserDTO udto = list.get(i); %>
                                
                                <tr>
                                    <td><%=udto.getUsername()%></td>
                                    <td><%=udto.getName()%></td>
                                    <td><%=udto.getEmail()%></td>
                                    <td><%=udto.getContact()%></td>
                                </tr>
                        
                        
                            <% }
                        %>
                    </tbody>
                </table>
            </div>

            <link href="assets/bootstrap.min.css" rel="stylesheet">

            <link href="assets/datatables.bootstrap4.min.css" rel="stylesheet">

            <!-- Bootstrap core JavaScript-->
            <script src="assets/jquery.min.js"></script>

            <!-- Page level plugin JavaScript-->
            <script src="assets/jquery.datatables.min.js"></script>

            <script src="assets/datatables.bootstrap4.min.js"></script>

            <script>
                $(document).ready(function() {
                    $('#dataTable').DataTable();
                });
            </script>

            <!-- Table Code End -->



        </div>
    </div>

        <script src="assets/sidebar.min.js"></script>

</body>

</html>