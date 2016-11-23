<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Program</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">
   		<div class="page-header">
   			<a href="../detail.html" class="btn btn-primary pull-right" > Home </a>
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2> Programs <small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>
    	
    	
    	<div class="form-group">
         	<label for="department"> Department Name:  </label> &nbsp; ${department.name}
      	</div> <br/>
        	    
      	<form action= "${id}.html" method="post" class="form-inline text-left"> 
	        	
	     	<div class="form-group">
	          	<label for="program"> Add Program: &nbsp;</label>
	          	<input type="text" class="form-control" name="program" id="program" placeholder="Add new Program">
	        </div> 
	        
	        	<input type="hidden" name="department" value="${department.name}" />
	        
	        	<button type="submit" class="btn btn-success"> Add </button>
        	
		</form>

<hr>

<table class="table table-striped table-bordered table-hover" >
	<tr><th> Program(s) </th></tr>
	<c:forEach items="${programs}" var="program">
		<input type="hidden" name="deptId" value="${department.id}"/>
		<input type="hidden" name="progId" value="${program.id}"/>
	<tr> <td>${program.name}  <a href="${id}/${program.id}.html" class="pull-right"> remove </a></td> </tr>
	</c:forEach>
</table>

<hr>

<!-- form action= "../detail.html" method="get" class="form-inline text-left"> 
    	<button type="submit" class="btn btn-primary"> Previous Page </button> 	
</form-->

 	</div>
</body>

</html>