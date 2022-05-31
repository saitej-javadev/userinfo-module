<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	body {
		color: #fff;
		background: #344a71;
		font-family: 'Roboto', sans-serif;
	}
	.form-control {		
		min-height: 41px;
		box-shadow: none;
		border-color: #e1e4e5;
	}
	.form-control:focus {
		border-color: #49c1a2;
	}
	.form-control, .btn {        
        border-radius: 3px;
    }
	.layout-form {
		width: 400px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.layout-form form {
		color: #9ba5a8;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.layout-form h2 {
		color: #333;
		font-weight: bold;
        margin-top: 0;
    }
    .layout-form hr {
        margin: 0 -30px 20px;
    }    
	.layout-form .form-group {
		margin-bottom: 20px;
	}
	.layout-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.layout-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #49c1a2;
		border: none;
		min-width: 140px;
    }
	.layout-form .btn:hover, .signup-form .btn:focus {
		background: #3cb094;
        outline: none !important;
	}
	.layout-form a {
		color: #fff;
		text-decoration: underline;
	}
	.layout-form a:hover {
		text-decoration: none;
	}
	.layout-form form a {
		color: #49c1a2;
		text-decoration: none;
	}	
	.layout-form form a:hover {
		text-decoration: underline;
	}
	</style>
</head>
<body>

	<!-- NAVBAR -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav w-100">
	      <li class="nav-item dropdown ml-auto">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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

	<!-- MAIN BODY -->
	<div class="layout-form">
	    <c:if test="${user != null}">
		  <form action="update" method="post">
			<h2>Update User</h2>
			<p>Change your data to update the user.</p>
	    </c:if>
	    <c:if test="${user == null}">
		  <form action="insert" method="post">
			<h2>Insert User</h2>
			<p>Fill all data and submit to create new user.</p>
	    </c:if>
		    <c:if test="${user != null}">
	        	<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
	        </c:if>  
			<hr>
	        <div class="form-group">
				<label>Username</label>
	        	<input type="text" class="form-control" name="name" required="required" value="<c:out value='${user.name}' />">
	        </div>
	        <div class="form-group">
				<label>Email Address</label>
	        	<input type="email" class="form-control" name="email" required="required" value="<c:out value='${user.email}' />">
	        </div>
			<div class="form-group">
				<label>Password</label>
	            <input type="password" class="form-control" name="password" required="required" value="<c:out value='${user.password}' />">
	        </div>
			<div class="form-group">
				<label>Role</label>
	        	<select class="browser-default custom-select" name="role" required="required">
					<c:if test="${user == null}">
						<option value="Administrator">Administrator</option>
						<option value="Sales">Sales</option>
						<option value="Marketing">Marketing</option>
						<option value="General User">General User</option>
					</c:if>
					<c:if test="${user != null}">
						<option value="Administrator">Administrator</option>
						<option value="Sales">Sales</option>
						<option value="Marketing">Marketing</option>
						<option value="General User">General User</option>
						
						<c:if test="${user.role == 'Administrator'}">
							<option value="Administrator" selected hidden>Administrator</option>
						</c:if>
						<c:if test="${user.role == 'Sales'}">
							<option value="Sales" selected hidden>Sales</option>
						</c:if>
						<c:if test="${user.role == 'Marketing'}">
							<option value="Marketing" selected hidden>Marketing</option>
						</c:if>
						<c:if test="${user.role == 'General User'}">
							<option value="General User" selected hidden>General User</option>
						</c:if>
					</c:if>
				</select>
	        </div>
	        <div class="form-group">
				<label>Status</label>
	            <select class="browser-default custom-select" name="status" required="required">
					<c:if test="${user == null}">
						<option value="Inactive">Inactive</option>
						<option value="Active">Active</option>
					</c:if>
					<c:if test="${user != null}">
						<option value="Inactive">Inactive</option>
						<option value="Active">Active</option>
						
						<c:if test="${user.status == 'Inactive'}">
							<option value="Inactive" selected hidden>Inactive</option>
						</c:if>
						<c:if test="${user.status == 'Active'}">
							<option value="Active" selected hidden>Active</option>
						</c:if>
					</c:if>
				</select>
	        </div>
	        <br/>
			<div class="form-group">
				<c:if test="${user == null}">
	            	<button type="submit" class="btn btn-primary btn-block btn-lg">Create new user</button>
	            </c:if>  
	            <c:if test="${user != null}">
	            	<button type="submit" class="btn btn-primary btn-block btn-lg">Update user</button>
	            </c:if>
	        </div>
	    </form>
		<div class="text-center">See your user list <a href="list">here</a></div>
	</div>
		
</body>
</html>
