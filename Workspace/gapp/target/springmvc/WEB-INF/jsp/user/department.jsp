<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Department Management</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">
   		<div class="page-header">
   			<a href="detail.html" class="btn btn-primary pull-right" > Home </a>
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2>Departments<small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>	
    	
    	<h3><u>Departments</u></h3>
    	    	
    	    <form action= "addDepartment.html" method="get" class="form-inline text-right"> 
    			<button type="submit" name="department" class="btn btn-primary"> Add New Department </button> 	
			</form>
    
<table class="table table-striped table-bordered table-hover">

	<c:forEach items="${departments}" var="department">

		<table class="table table-striped table-bordered table-hover">
	
			<th> ${department.name} </th>
		 
		<c:set var="count" value="0" scope="page"/>	
		<c:forEach items="${programs}" var="program">
			<c:if test="${program.department.id == department.id}">
				<c:set var="count" value="${count + 1}" scope="page"/>
			</c:if>
		</c:forEach>
		
			<tr> <td> ${count} program(s) offered </td></tr>
	
		</table>
	
	</c:forEach>

</table>

<hr>

<form action= "detail.html" method="post" class="form-inline text-left"> 
    	<button type="submit" class="btn btn-primary"> Details </button> 	
</form>
			<br/><br/>

    </div>


</body>
</html>