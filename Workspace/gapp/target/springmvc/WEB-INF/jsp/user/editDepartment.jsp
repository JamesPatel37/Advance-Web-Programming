<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Department</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">
   		<div class="page-header">
   			<a href="../detail.html" class="btn btn-primary pull-right" > Home </a>
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2>Departments<small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>
    	
    <form action= "${id}.html" method="post" class="form-inline text-left"> 
    	
    		<div class="form-group">
          		<label for="department"> Department Name:  </label> ${department.name}
        	</div> <br/>
        	
        	<div class="form-group">
          		<label for="name"> Edit Name: </label>
          		<input type="text" class="form-control" name="name" id="name" placeholder="Rename department">
        	</div> <br/>
        	
        	<input type="hidden" name="deptId" value="${department.id}" />
        	
        	<button type="submit" class="btn btn-success"> Save </button>
        	
	</form>

	</div>
</body>

</html>