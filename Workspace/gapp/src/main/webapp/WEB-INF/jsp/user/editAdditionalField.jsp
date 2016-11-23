<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Edit Additional Field</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">
   		<div class="page-header">
   			<a href="../detail.html" class="btn btn-primary pull-right" > Home </a>
   			<a href="/springmvc/home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2> Additional Requirement <small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>
    	
    	
    	<div class="form-group">
         	<label for="department"> Department Name:  </label> &nbsp; ${department.name}
      	</div> 

	
		<form action= "${id}.html" method="post" class="form-inline text-left"> 
 
 			<div class="form-group">
	       		<label for="addReq"> Add Additional Requirement: &nbsp;</label>
	       		<input type="text" class="form-control" name="addReq" id="addReq" placeholder="Add new Additional Requirement">
	    	</div> 
	    
	    		<input type="hidden" name="department" value="${department.name}" />
	    	    
	    		<button type="submit" class="btn btn-success"> Add </button>
	    
	 	</form>

<hr/>

<table class="table table-striped table-bordered table-hover" >
	<c:forEach items="${af}" var="af">
		<input type="hidden" name="deptId" value="${department.id}"/>
		<input type="hidden" name="afId" value="${af.id}"/>
	<tr> <td>${af.name}  <a href="${id}/${af.id}.html" class="pull-right"> remove </a></td> </tr>
	</c:forEach>
</table>

<!--  form action= "../detail.html" method="get" class="form-inline text-left"> 
    	<button type="submit" class="btn btn-primary"> Department Page </button> 	
</form-->

</body>

</html>