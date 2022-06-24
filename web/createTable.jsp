<%-- 
    Document   : createTable
    Created on : 13 Jun, 2022, 12:01:57 AM
    Author     : arrag
--%>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>


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
    
    %>

    <div class="wrapper d-flex align-items-stretch">
        <nav id="sidebar">
            <div class="p-4 pt-5">
                <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.jpg);"></a>
                <ul class="list-unstyled components mb-5">
                    <li>
                        <a href="dashboard.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="updateProfile.jsp">Update Profile</a>
                    </li>
                    <li class="active">
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





            <div class="row">
                <div class="col">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Create Table</div>
                        <div class="card-body text-center">
                            <div id="rootwizard">
                                <ul class="nav nav-pills nav-justified form-wizard-header mb-3" style="display: none;">
                                    <li class="nav-item" data-target-form="#accountForm">
                                        <a href="#first" data-bs-toggle="tab" data-toggle="tab"
                                            class="nav-link rounded-0 pt-2 pb-2 active">

                                            <span class="d-none d-sm-inline">Account</span>
                                        </a>
                                    </li>
                                    <li class="nav-item" data-target-form="#profileForm">
                                        <a href="#second" data-bs-toggle="tab" data-toggle="tab"
                                            class="nav-link rounded-0 pt-2 pb-2">
                                            <i class="mdi mdi-face-profile me-1"></i>
                                            <span class="d-none d-sm-inline">Profile</span>
                                        </a>
                                    </li>

                                </ul>

                                <div class="tab-content mb-0 b-0">

                                    <div class="tab-pane active" id="first">
                                        <form id="accountForm" method="post" action="#" class="form-horizontal">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="row mb-3">
                                                        <label class="col-md-3 col-form-label" for="userName3">Table
                                                            Name</label>
                                                        <div class="col-md-9">
                                                            <input type="text" class="form-control" id="userName3"
                                                                name="userName3" required="">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <label class="col-md-3 col-form-label" for="password3"> Table
                                                            Description</label>
                                                        <div class="col-md-9">
                                                            <input type="textarea" id="password3" name="password3"
                                                                maxlength="50" data-toggle="maxlength"
                                                                class="form-control" required="">
                                                        </div>
                                                    </div>

                                                    <div class="row mb-3">
                                                        <label class="col-md-3 col-form-label" for="confirm3">No. of
                                                            Coloumns</label>
                                                        <div class="col-md-9">
                                                            <input type="text" class="form-control" name="confirm3"
                                                                data-toggle="input-mask" data-mask-format="0000"
                                                                placeholder="You can enter columns upto 9999" id="rows"
                                                                required="">


                                                        </div>
                                                    </div>
                                                </div> <!-- end col -->
                                            </div> <!-- end row -->
                                        </form>

                                        <ul class="list-inline wizard mb-0">

                                            <li style="float: right;" class="next list-inline-item float-end"><a
                                                    href="#" class="btn btn-info btn btn-primary"
                                                    onclick='createTable()'>Next</a></li>
                                        </ul>
                                    </div>

                                    <div class="tab-pane fade" id="second">
                                        <form id="profileForm" method="post" action="CreateTableServlet" class="form-horizontal">
                                            <input type="text" name="table_name" value="" id="table_name" hidden>
                                            <input type="text" name="table_desc" value="" id="table_desc" hidden>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div id="wrapper" class="table-responsive"></div>
                                                    <script type="text/javascript">
                                                        function createTable() {
                                                            document.getElementById('table_name').value =document.getElementById('userName3').value;
                                                            document.getElementById('table_desc').value = document.getElementById('password3').value;
                                                            var num_rows = document.getElementById('rows').value;
                                                            var num_cols = 4;
                                                            var theader = '<table class="table">\n';
                                                            var tbody = '';
                                                            var c = 1;
                                                            '<thead>'
                                                            '<tr>';

                                                            tbody += '<th>S.No.</th>';
                                                            tbody += '<th>Column Name</th>';
                                                            tbody += '<th>Column type</th>';
                                                            tbody += '</th>';

                                                            '</tr>\n';
                                                            for (i = 0; i < num_rows; i++) {

                                                                tbody += '<tr>';
                                                                tbody += '<td>';
                                                                tbody += i + 1;
                                                                tbody += '</td>'

                                                                for (j = num_cols - 3; j < num_cols - 2; j++) {
                                                                    tbody += '<td>';
                                                                    tbody += '<input type="text" name="column_name"  class="form-control" id="hij' + c + '" required=""/>';
                                                                    c++;
                                                                    tbody += '</td>'
                                                                }
                                                                for (k = num_cols - 2; k < num_cols - 1; k++) {
                                                                    tbody += '<td>';
                                                                    tbody += '<select name="column_type" class="form-select form-select-sm form-control" aria-label=".form-select-sm example" required="">';
                                                                    tbody += '<option disabled selected value  >Select Data Type</option>';
                                                                    tbody += '<option value="number">Number</option>';
                                                                    tbody += '<option value="string">String</option>';
                                                                    tbody += '<option value="date">Date</option>';
                                                                    tbody += '</select>';
                                                                    tbody += '</td>'
                                                                }
                                                                
                                                                tbody += '</tr>\n';
                                                            }

                                                            var tfooter = '</table>';
                                                            document.getElementById('wrapper').innerHTML = theader + tbody + tfooter;
                                                        }
                                                    </script>


                                                    <div style="float: left;" class="form-check">
                                                        <input id="myCheck" onclick="myFunction()"
                                                            class="form-check-input" type="checkbox" value="">
                                                        <label class="form-check-label" for="myCheck">
                                                            Set Primary Key
                                                        </label>
                                                    </div>
                                                    <br>

                                                    <div id="primary" class="collapse">
                                                        <select class="form-control select2" id="dheeraj" name="primary_key">
                                                            <option value="null">Choose primary key</option>
                                                        </select>
                                                    </div>


                                                    <script>
                                                        function myFunction() {
                                                            var checkBox = document.getElementById("myCheck");
                                                            var text = document.getElementById("primary");
                                                            if (checkBox.checked == true) {
                                                                text.style.display = "block";
                                                            } else {
                                                                text.style.display = "none";
                                                                $('#dheeraj').val("null");
                                                            }
                                                            
                                                            
                                                        }
                                                        $(document).ready(function () {
                                                            $("#myCheck").click(function () {
                                                                $('#dheeraj option').remove();
                                                                var num_rows = document.getElementById('rows').value;
                                                                $('#dheeraj') .append('<option value="null">Choose primary key</option>');
                                                                for (var i = 1; i <= num_rows; i++)
                                                               { if ($('#hij'+i).val() != "") {
                                                                    $('#dheeraj')
                                                                        .append('<option value="' + $('#hij'+i).val() + '">' + $('#hij'+i).val() + '</option>');}
                                                                    else{
                                                                        alert("Please enter coloumn name");
                                                                    }
                                                                }

                                                            });
                                                        });
                                                    </script>


                                                    <br>

                                                    <ul class="list-inline wizard mb-0">
                                                        <li style="float: left;"
                                                            class="previous list-inline-item disabled"><a href="#"
                                                                class="btn btn-info btn btn-primary">Back</a>
                                                        </li>
                                                        <li style="float: right;"
                                                            class="next list-inline-item float-end "><input type="submit" value="Create" class="btn btn-info btn btn-primary">
                                                        </li>
                                                    </ul>
                                                </div>
                                                <!-- end col -->
                                            </div>
                                            <!-- end row -->
                                        </form>
                                    </div>



                                </div> <!-- tab-content -->
                            </div> <!-- end #rootwizard-->

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

    <script src="assets/sidebar.min.js"></script>


    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>

    <!-- demo app -->
    <script src="assets/js/pages/demo.form-wizard.js"></script>
</body>

</html>