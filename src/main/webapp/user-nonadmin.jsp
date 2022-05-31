<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>User Management Application</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style><%@include file="/resources/css/bootstrap.min.css"%></style>
	<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
	<script><%@include file="/resources/js/bootstrap.min.js" %></script>
	
	<style type="text/css">
		.home-main{
			background: #5812c5;
			color:#fff;
			padding: 13%;
			text-align: center;
		}
		.blinker{
			animation: blinker 1.5s linear infinite;
		}
		@keyframes blinker {
		  50% {
			opacity: 0;
		  }
		}
		.home-main button{
			background: #fff;
			color: #5812c5;
			border-radius: 0;
			font-weight: 700;
			width: 16%;
			height: 50px;
			top: 4%;
			margin-top: 3%;
		}
		.home-main button:hover{
			transition: 1s ease;
			color:#5812c5;
			width: 19%;
		}
		.content1-left{
			padding:9%;
		}
		.content1-right{
			padding:9%;
			background:#e4e4e4;
		}
		.home-content2{
			background: #adb5bd;
			padding: 1.4%;
			text-align: center;	
		}
		.home-content2 p{
			font-size: 18px;
			line-height: 50px;
		}
		.home-content2 p span{
			font-weight: 500;
		}
	</style>
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav w-100">
	      <li class="nav-item dropdown ml-auto">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Account
	        </a>
	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="./">Home</a>
	          <a class="dropdown-item" href="#editModal" data-toggle="modal">Edit User</a>
	          <a class="dropdown-item" href="logout">Logout</a>
	        </div>
	      </li>
	    </ul>  
	  </div>
	</nav>

	<!-- Edit Modal HTML -->
	<div id="editModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Edit User</h4>	
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="update" class="form-horizontal" role="form" method="post">
	                  <div class="form-group">
	                    <label  class="col-sm-2 control-label">Name</label>
	                    <div class="col-sm-12">
	                        <input type="name" class="form-control" name="name" value="${user.name}" />
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label class="col-sm-2 control-label">Password</label>
	                    <div class="col-sm-12">
	                        <input type="password" class="form-control" name="password" value="${user.password}" />
	                    </div>
	                  </div>
	                  
	                  <input type="hidden" name="id" value="${user.id}"/>
	                  <input type="hidden" name="email" value="${user.email}"/>
	                  <input type="hidden" name="role" value="${user.role}"/>
	                  <input type="hidden" name="status" value="${user.status}"/>
	                  
	                  <div class="form-group">
	                    <div class="col-sm-12">
	                      <input type="submit" class="btn btn-success" value="Update" />
	                    </div>
	                  </div>
	                </form>
           	 	</div>
           	 </div>
		</div>
	</div>
	
  	<div class="container-fluid home-main">
		<h2><c:out value="${user.name}" /> <span class="blinker">.</span></h2>
		<form action="edit">
			<input type="hidden" name="id" value="${user.id}"/>
			<a href="#editModal" class="btn btn-primary trigger-btn" title="Edit" data-toggle="modal"><i class="material-icons">settings</i>  Edit User</a>
		</form>
	</div>
	<div class="container-fluid home-content1">
		<div class="row">
			<div class="col-md-6 content1-left">
				<h3>Extra credit task 1 <span class="blinker">?</span></h3>
				<p>A user can have many roles (e.g. Administrator, Sales, Marketing)
					Administrators can do anything
					Non administrators can only view, the only thing a non Administrator can edit/write is their own name and password.</p>
				<!-- <div class="content1-left"></div> -->
			</div>
			<div class="col-md-6 content1-right">
				<p>If we want this web application to be Highly Available, what would you do? Separate the core functions and try to run independently in each machine.</p>
			</div>
		</div>
	</div>
	<footer class="page-footer font-small" style="background-color: #f5f5f5;">
		<div class="footer-copyright text-center py-4" style="align-items: center;">
			© 2019 <a
				href="https://in.linkedin.com/in/saiteja-galipelli-071245b7">
				Saiteja Galipelli LinkedIn </a>
		</div>
	</footer>
</body>
</html>
