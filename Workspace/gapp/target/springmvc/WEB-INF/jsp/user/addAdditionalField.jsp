<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add New Additional Field</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
   		<div class="page-header">
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2>Additional Requirement<small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>	
    	
 <br/>
<h3>Add new Department's Additional Requirement</h3>

		<form action= "addAdditionalField.html" method="post" class="form-inline text-left"> 
        	
        	<div class="form-group">
	        	<label for="department" >Department Name</label>
	      		<select name="department" class="form-control">
	      		<c:forEach items="${departments}" var="department">
	        		<option>${department.name}</option>
	        	</c:forEach>
	      		</select>
      		</div> <br/>
      		
        	<div class="form-group">
          		<label for="addReq"> Program Name </label>
          		<input type="text" class="form-control" name="addReq" id="addReq" placeholder="Enter new Additional requirement">
        	</div> <br/>
        	
        	<button type="submit" class="btn btn-success"> Add </button>
        	
        </form>

<br/>
<hr/>
	
	</div>
</body>
</html>