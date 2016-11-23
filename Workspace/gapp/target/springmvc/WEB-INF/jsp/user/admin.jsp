<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Administrator Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

    <div class="container">
   		<div class="page-header">
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2> Graduate Application Program <small>CS 520</small> </h2>
    		<h3> Administrator Page </h3> <br/>    		    		
    	</div>	

		<h3> Hi Admin! </h3> <br/>
		
		<hr>
		<h4> To add Department, Program and Additional requirement: </h4>
		<a href="addDepartment.html" class="btn btn-primary" > Add Department </a> <br/> <br/>
		
		<hr>
		
    	<h4> To manage Department, Program and Additional requirement: </h4>
    	
    	<a href="department.html" class="btn btn-primary" > Manage Departments </a> <br/> <br/>
    	
    	<hr>
    	<h4> To manage Users (Staff and Student) </h4>
    	
    	<a href="list.html" class="btn btn-primary" > Manage Users </a> <br/>
    	
	</div>

</body>

</html>