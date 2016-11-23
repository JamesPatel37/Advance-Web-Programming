<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Department Management</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">
   		<div class="page-header">
   			<a href="department.html" class="btn btn-primary pull-right" > Home </a>
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2> Graduate Application Program <small>CS 520</small> </h2>
    		<h3> Department Details </h3>
    	</div>	
    	
    	<div>
    	    <form action= "addDepartment.html" method="get" class="form-inline text-right"> 
    			<button type="submit" name="department" class="btn btn-primary"> Add New Department </button> 	
			</form>
		</div> <br/>
		
<table class="table table-striped table-bordered table-hover ">

	<tr><th>Departments</th></tr>

	<c:forEach items="${departments}" var="department">
		<table class="table table-striped table-bordered table-hover ">
			<tr><th> <b> ${department.name} </b> <a href="editDepartment/${department.id}.html" class="pull-right"> Edit </a> </th></tr>
			
			<tr><th> Program(s): <a href="editProgram/${department.id}.html" class="pull-right"> Edit </a> </th></tr>
			
			<c:forEach items="${programs}" var="program">
				<tr>
				<c:if test="${program.department.id == department.id}">
					<tr><td> ${program.name} <!--a href="editProgram/${department.id}.html" class="pull-right"> Edit </a--> </td></tr>
				</c:if>
				</tr>
			</c:forEach>
			
			<tr><th> Additional Requirement(s): <a href="editAdditionalField/${department.id}.html" class="pull-right"> Edit </a> </th></tr>
			<c:forEach items="${additionalFieldList}" var="af">	
				<c:if test="${department.name == af.deptId.name }">
					<tr><td> ${af.name} <!-- a href="editAdditionalField/${department.id}.html" class="pull-right"> Edit </a--> </td></tr>
				</c:if>
			</c:forEach>
			
		</table>
	</c:forEach>

</table>

	</div>
</body>
</html>