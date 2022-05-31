<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Error</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style><%@include file="/resources/css/bootstrap.min.css"%></style>
	<script><%@include file="/resources/js/jquery-3.4.1.min.js" %></script>
	<script><%@include file="/resources/js/bootstrap.min.js" %></script>
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
	          <c:if test="${not empty sessionScope.uemail}">
	          <a class="dropdown-item" href="logout">Logout</a>
	          </c:if>
	        </div>
	      </li>
	    </ul>  
	  </div>
	</nav>
	<br/><br/><br/>

	<div class="page-wrap d-flex flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 text-center">
                <span class="display-1 d-block">error</span>
                <div class="mb-4 lead">reason: <%=exception.getMessage() %></div>
                <br/>
                <div class="mb-4 lead">The page you are looking for was not processed.</div>
                <a href="./" class="btn btn-link">Back to Home</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>