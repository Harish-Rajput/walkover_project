<%-- 
    Document   : table
    Created on : 13 Jun, 2022, 12:03:55 AM
    Author     : arrag
--%>

<%@page import="dto.TableListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TableDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>Table Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  
        

        


    <style>
        .col-xl-4 {
            padding-bottom: 12px;
        }
        .table-wrapper {
    width: 1100px;
    margin: 15px auto;
    background: #fff;
    padding: 10px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
}
.table-title .add-new i {
    margin-right: 4px;
}
table.table {
    table-layout: fixed;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 100px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #f50000;
}
table.table td .add {
    display: none;
}
        
    </style>








<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


        <!-- App css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    

    
</head>

<body>
    
    <%
            String username = (String)session.getAttribute("userid");
            if(session.getAttribute("userid")==null)
            {
                response.sendRedirect("login.jsp");
                return;
            }
            
            
            
            String table_id = request.getParameter("table_id");
            TableDAO tdao = new TableDAO();
            TableListDTO tdata = tdao.viewTableData(username, table_id);
            ArrayList<ArrayList<String>> tlist = tdao.showTable(table_id);
     %>
     <input type="text" id="table_id" value="<%=table_id%>" hidden>

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

            

            <div style="margin-top: 20px;" class="row">
                <div class="col-xl-12">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header"><%=tdata.getTable_name()%>
                            <button style="float:right;" class="btn btn-danger" type="button" onclick="location.href = 'DeleteTableServlet?table_id=<%=table_id%>';">Delete Table</button>

                        </div>
                        <div class="card-body text-center">
                            
                            <div class="container-lg">
                                <div class="table-responsive">
                                    <div class="table-wrapper">
                                        <div class="table-title">
                                            <div class="row">
                                                <div class="col-sm-3" style="float: left;">
                                                    <form class="form-inline d-flex justify-content-center md-form form-sm">
                                                        <i class="fa fa-search" aria-hidden="true" style="color:#ee8a74;"></i>
                                                        <input class="form-control form-control-sm ml-3 w-75" type="text" placeholder="Search"
                                                          aria-label="Search" id="mySearch" onkeyup="mySearchbar()" style="height: 6vh;">
                                                      </form>
                                                      <script>
                                                        function mySearchbar() {
                                                          var input, filter, table, tr, td, i, txtValue;
                                                          input = document.getElementById("mySearch");
                                                          filter = input.value.toUpperCase();
                                                          table = document.getElementById("mytable");
                                                          tr = table.getElementsByTagName("tr");
                                                          for (i = 0; i < tr.length; i++) {
                                                            td = tr[i].getElementsByTagName("td")[0];
                                                            if (td) {
                                                              txtValue = td.textContent || td.innerText;
                                                              if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                                tr[i].style.display = "";
                                                              } else {
                                                                tr[i].style.display = "none";
                                                              }
                                                            }   
                                                            
                                                          }
                                                        }
                                                        </script>
                                                    </div>
                                                <div class="col-sm-6">
                                                    <h2><%=tdata.getTable_desc()%></h2>
                                                </div>
                                                <div class="col-sm-2">
                                                    <button type="button" class="btn btn-info add-new"><i
                                                            class="fa fa-plus"></i> Add New</button>
                                                     
                                                     
                                                    
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <table class="table table-bordered sortable myTable" id="mytable">
                                            <thead>
                                               
                                                <tr>
                                                    <%
                                                        ArrayList<String> clist = tlist.get(0);
                                                        
                                                        for(int i=0; i<clist.size(); i++)
                                                        {%>
                                                            <th><%=clist.get(i)%></th>
                                                        <%}
                                                        %>
                                            <input type="text" value="<%=clist.size()%>" id="column_number" hidden>
                                                            <th>Actions</th> 
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for(int i=1; i<tlist.size(); i++)
                                                    {
                                                           ArrayList<String> rlist = tlist.get(i);
                                                           
                                                    %>
                                                    <tr>
                                                            <%
                                                                    for(int j=0; j<rlist.size(); j++)
                                                                    {%>
                                                                        <td><%=rlist.get(j)%></td>
                                                                    <%}
                                                            %>
                                                            <td>
                                                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                                        <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                                    </td>
                                                    </tr>
                                                    <%}
                                                %>
                                                
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>   
                            
                                                <button class="btn btn-danger" type="button" onclick="location.href = 'dashboard.jsp';">Discard Changes</button>
                            <button class="btn btn-primary" type="button" id='Get' onClick= "readval();return false ">Save Changes</button>
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


    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<script>



function readval(){
    var table_id = document.getElementById('table_id').value;
    var list = [];
    var col_length = 0;
var number = document.getElementById('column_number').value;
console.log(number);
for(var i=1; i<=number; i++)
{
    var arr = $('#mytable tr').find('td:nth-child('+i+')').map(function(){
        return $(this).text();
        }).get();
        
        col_length = arr.length;
        list.push(arr);
        
}
let jsonObject = JSON.parse(JSON.stringify(list));

console.log(jsonObject);

    $.ajax({
       
     url: '/Project_Walkover/UpdateTableServlet',
     type: 'POST', 
     dataType: 'json',
     data: "sData="+jsonObject+ "&col_length="+col_length+ "&table_id="+table_id,
     success:function (data, textStatus, xhr) {
        console.log("Saved Successefully");
        alert("Saved Successfully!!!!");
    },
    error:function (xhr, textStatus, errorThrown) {
        console.log('Error in Operation');
    }
     
});

            alert("Saved Successfully!!!");

}





        

</script>
    <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
            var actions = $("table td:last-child").html();
            // Append table with add row form on add new button click
            $(".add-new").click(function(){
                $(this).attr("disabled", "disabled");
                var index = $("table tbody tr:last-child").index();
                var row = '<tr>' +
                       <%
                           for(int i=0; i<clist.size();i++)
                           {%>
                               '<td><input type="text" class="form-control" name="<%=clist.get(i)%>" id="<%=clist.get(i)%>"></td>' +
                           <%}
                       %> 
                    '<td><a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a><a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a><a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a></td>' +
                    
                '</tr>';
                $("table").append(row);		
                $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                $('[data-toggle="tooltip"]').tooltip();
            });
            // Add row on add button click
            $(document).on("click", ".add", function(){
                var empty = false;
                var input = $(this).parents("tr").find('input[type="text"]');
                input.each(function(){
                    if(!$(this).val()){
                        $(this).addClass("error");
                        empty = true;
                    } else{
                        $(this).removeClass("error");
                    }
                });
                $(this).parents("tr").find(".error").first().focus();
                if(!empty){
                    input.each(function(){
                        $(this).parent("td").html($(this).val());
                    });			
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").removeAttr("disabled");
                }		
            });
            // Edit row on edit button click
            $(document).on("click", ".edit", function(){		
                $(this).parents("tr").find("td:not(:last-child)").each(function(){
                    $(this).html('<input type="text"  class="form-control" value="' + $(this).text() + '">');
                });		
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").attr("disabled", "disabled");
            });
            // Delete row on delete button click
            $(document).on("click", ".delete", function(){
                $(this).parents("tr").remove();
                $(".add-new").removeAttr("disabled");
            });
        });
        </script>



<script src="http://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</body>

</html>