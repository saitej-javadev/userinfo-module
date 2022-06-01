<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<%--
    <script>
        <%@include file="/resources/css/bootstrap.min.css" %>
    </script>
    <script>
        <%@include file="/resources/js/jquery-3.4.1.min.js" %>
    </script>
    <script>
        <%@include file="/resources/js/bootstrap.min.js" %>
    </script>--%>
    <style type="text/css">
        body {
            color: #566787;
            background: #ebebeb;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            margin: 30px 0;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #299be4;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn {
            color: #566787;
            float: right;
            font-size: 13px;
            background: #fff;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn:hover, .table-title .btn:focus {
            color: #566787;
            background: #f2f2f2;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.settings {
            color: #2196F3;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .status {
            font-size: 30px;
            margin: 2px 2px 0 0;
            display: inline-block;
            vertical-align: middle;
            line-height: 10px;
        }

        .text-success {
            color: #10c469;
        }

        .text-info {
            color: #62c9e8;
        }

        .text-warning {
            color: #FFC107;
        }

        .text-danger {
            color: #ff5b5b;
        }

    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

        $(document).on("click", ".set-userid", function () {
            var selectedUserId = $(this).data('tempid');
            $(".modal-footer #userId").val(selectedUserId);
        });


        $('.alert').show();
        setTimeout(function(){ $('.alert').hide(); }, 3500);


    </script>

</head>
<body>

<!-- Delete Modal HTML -->
<div id="deleteModal" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Are you sure?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Do you really want to delete these user? This process cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <form action="delete" method="post">
                    <input type="hidden" name="userId" id="userId" value=""/>
                    <input type="submit" class="btn btn-danger" value="Delete"/>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- NAVBAR -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">UserInfo-Module</a>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav w-100">
            <li class="nav-item dropdown ml-auto">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Account
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="./">Home</a>
                    <a class="dropdown-item" href="logout">Logout</a>
                </div>
            </li>
        </ul>

    </div>
</nav>
<br/><br/><br/>

<!-- Main Container HTML -->
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2>User Management</h2>
                </div>
                <div class="col-sm-7">
                    <a href="new" class="btn btn-primary"><i class="material-icons">add</i>
                        <span>Add New User</span></a>
                    <a href="list" class="btn btn-primary"><i class="material-icons">refresh</i> <span></span></a>
                    <a href="download" class="btn btn-primary"><i class="material-icons">download</i> <span></span></a>
                    <a href="list" class="btn btn-primary"><i class="material-icons">search</i> <span></span></a>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                       <i class="material-icons">upload</i>
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 style="color:black" class="modal-title" id="exampleModalLabel">Upload File</h3>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="upload"  enctype="multipart/form-data" method="post">
                                <div class="modal-body">
                                    <input type="file" name="file" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-danger">upload</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.role}"/></td>
                    <td><c:out value="${user.status}"/></td>
                    <td>
                        <a href="edit?id=<c:out value='${user.id}' />" class="settings" title="Settings"
                           data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
                        <a href="#deleteModal" data-tempid="<c:out value='${user.id}' />"
                           class="delete trigger-btn set-userid" title="Delete" data-toggle="modal"><i
                                class="material-icons">&#xE5C9;</i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${isUploadSuccess}">
            <div class="alert alert-warning" role="alert">
                <strong>File Uploaded Successfully </strong> Please check!
            </div>
        </c:if>

        <div class="clearfix">
            <div class="hint-text">Showing <c:out value="${fn:length(listUser)}"/> entries</div>
        </div>
    </div>
</div>

<!--
	<div id="vue-test">
	  <div v-for="item in items" :key="item.id">    
	    <p>Item id={{item.id}}, jobItemStatus = {{item.jobItemStatus}}</p>  
	  </div>
	</div>
	<script src="https://unpkg.com/vue/dist/vue.js"></script>
	
	<script>    
	var vueItems = new Vue({
	    el: '#vue-test',
	    data: {
	        items : []
	    },
	    mounted: function(){
	        <c:forEach items="${listUser}" var="item" varStatus="status"> 
	            this.items = this.items.concat({
	                id: ${item.id}, 
	                receptionDate : "${item.id}", 
	                deliveryDate : "${item.name}", 
	                jobItemStatus : "${item.email}"
	                });             
	        </c:forEach>
	    }
	});
	</script> -->


</body>
</html>
