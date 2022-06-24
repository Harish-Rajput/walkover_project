<%-- 
    Document   : viewHistory
    Created on : 13 Jun, 2022, 12:02:29 AM
    Author     : arrag
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.TableListDTO"%>
<%@page import="dao.TableListDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>viewHistory</title>
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
            
            //Getting Table List 
            TableListDAO tldao = new TableListDAO();
            ArrayList<TableListDTO> tlist = tldao.viewHistory(username);
            
           
            
    %>

    <div class="wrapper d-flex align-items-stretch">
        <nav id="sidebar">
            <div class="p-4 pt-5">
                <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.jpg);"></a>
                <ul class="list-unstyled components mb-5">
                    <li >
                        <a href="dashboard.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="updateProfile.jsp">Update Profile</a>
                    </li>
                    <li>
                        <a href="createTable.jsp">Create Table</a>
                    </li>
                    <li class="active">
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

            <div class="card mb-4 mb-xl-0" style="padding: 12px;">



                <div style="padding-bottom: 12px;">Your Work</div>
                <div class="row">

                    <%
                            TableListDTO tdto;
                            for(int i=0; i<tlist.size(); i++)
                            {
                               tdto = tlist.get(i);
                              %> 
                              
                               <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header"><%=tdto.getTable_name()%></div>
                            <div class="card-body text-center">
                                <!-- Profile picture help block-->
                                <div class="small font-italic text-muted mb-4"><%=tdto.getTable_desc()%></div>
                                <!-- Profile picture upload button-->
                                <button class="btn btn-primary" type="button"><a href="table.jsp?table_id=<%=tdto.getTable_id()%>" style="color: white;"> View Table</a></button>
                            </div>
                        </div>
                    </div>
                              
                           <% }
                    %>
                   

                    
                </div>

                

<!--          <div class="text-center">
                      <button style="background-color: rgba(0, 0, 0, 0.779);" class="btn btn-primary" type="button">View More</button>
                </div>-->
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

</body>

</html>