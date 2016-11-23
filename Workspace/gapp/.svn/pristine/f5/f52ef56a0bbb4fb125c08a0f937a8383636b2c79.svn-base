<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Student Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
</head>
<body>

    <div class="container">
   		<div class="page-header">   		   	
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2>Students<small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>	
	
	
		<h3>Hi ${student.firstName}!</h3> <br/>
		
		<h4> Apply for new Application: </h4>
    	    <form action= "../student/addApplication.html" method="get" class="form-inline text-left"> 
    			<button type="submit" name="studentId" value="${student.id}" class="btn btn-primary"> Add New Application </button> 	
			</form>		
		<hr>

		<h4> Edit Existing Application(s): </h4>
    	    <form action= "../student/editApplication.html?studentId=${student.id}" method="get" class="form-inline text-left"> 
    			<button type="submit" name="studentId" value="${student.id}" class="btn btn-primary">  Edit  Applications </button> 	
			</form>		
		<hr>
 <br/>
		
		<h3><u>List of Application(s): </u></h3> 
		
<table class="table table-striped table-bordered table-hover">

				<c:set var="count" value="1" scope="page"/>	
	
	<c:forEach items="${application}" var="app" >	
		<c:if test="${app.userId.id == student.id}">
			<table class="table table-striped table-bordered table-hover">
			
				<tr><td colspan="2"> <b><h3>Application [${count}]</h3></b>
				<tr><td> <b>Date:</b>      <fmt:formatDate value="${app.date}" pattern="MM/dd/yyyy"  /> </td></tr>
				<tr><td> <b>Department:</b> ${app.departmentId.name} </td></tr> 
				<tr><td> <b>Program:</b>    ${app.programId.name} </td></tr> 
				<tr><td> <b>Term:</b> 		${app.term} </td></tr> 
				
				<c:choose>
				    <c:when test="${app.submitted == null || app.submitted == false}">
						<tr><td> <b>Status:</b> <a href="#">Not Submitted</a> </td></tr> <br/>
				    </c:when>
				    <c:otherwise>
						<tr><td> <b>Status:</b> <a href="#">Submitted</a> </td></tr> <br/>
				    </c:otherwise>
				</c:choose>
			
			</table>
				<c:set var="count" value="${count + 1}" scope="page"/>
		</c:if>		
    </c:forEach>

</table>

<hr>

<%-- <form action= "../student/upload.html" method="get" class="form-inline text-left"> 
	<input type="hidden" name="studentId" value="${student.id}">
    	<button type="submit" class="btn btn-primary"> Upload Transcript </button> 	
</form><br/> --%>

<form action= "../student/appDetail.html" method="post" class="form-inline text-left"> 
	<input type="hidden" name="studentId" value="${student.id}">
    	<button type="submit" class="btn btn-primary"> Details </button> 	
</form>
			<br/><br/>
	</div>
	
</body>
</html>