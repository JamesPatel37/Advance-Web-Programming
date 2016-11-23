<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Registration</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
   		<div class="page-header">
    		<h2> Graduate Application Program <small>CS 520</small> </h2>
    		<h3>Registraion Form</h3>
    	</div>	
    	
    <div id="formsContent">
    
	<form:form name="myForm" method="post" modelAttribute="student" class="form-horizontal" role="form">
	Last Name: <form:input path="lastName" class="form-control" role="form" /> <form:errors path="lastName" /> <br/> <br/>
	First Name: <form:input path="firstName" class="form-control" role="form" /> <form:errors path="firstName"/> <br/> <br/>
	Email: <form:input path="email" type="email" name="email" class="form-control" role="form" /> <form:errors path="email"/> <form:errors path="Email"/> <br/> <br/>
	Password: <form:input path="password" class="form-control" role="form"  /> <form:errors path="password"/> <br/> <br/>
	<form:hidden path="type" value="student" /> 
		
	<input type="submit"  value="Register" class="btn btn-success"/>		
	
	</form:form>
	
	</div>
	</div>
</body>
</html>