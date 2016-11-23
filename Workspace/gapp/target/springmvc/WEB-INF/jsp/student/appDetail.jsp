<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Application Details</title>
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
	
	
		<h3>Application Details</h3> <br/>
		
		<div>
    	    <form action= "addApplication.html" method="get" class="form-inline text-right"> 
    			<button type="submit" name="studentId" value="${student.id}" class="btn btn-primary"> Add New Application </button> 	
			</form>
			<form action= "editApplication.html" method="get" class="form-inline text-right"> 
    			<button type="submit" name="studentId" value="${student.id}" class="btn btn-primary"> Edit Application </button> 	
			</form>
		</div> <br/>

<table class="table table-striped table-bordered table-hover">

			<c:set var="count" value="1" scope="page"/>	
	
	<c:forEach items="${application}" var="app" >
		<c:if test="${app.userId.id == student.id}">
			<table class="table table-striped table-bordered table-hover">
				<tr><td colspan="2"> <b><h3>Application [${count}]</h3><b>	</td></tr> 
				<tr><td> <b>Date:</b>       </td>   <td> <fmt:formatDate value="${app.date}" pattern="MM/dd/yyyy"  /> </td></tr>
				<tr><td> <b>Department:</b> </td>   <td> ${app.departmentId.name} </td></tr> 
				<tr><td> <b>Program:</b>    </td>   <td> ${app.programId.name} </td></tr> 
				<tr><td> <b>Term:</b> 		</td>   <td> ${app.term} </td></tr> 
				
				<c:choose>
				    <c:when test="${app.submitted == null || app.submitted == false}">
						<tr><td> <b>Status:</b> </td>   <td> <a href=#> Application is Not Submitted </a> </td></tr>
				    </c:when>
				    <c:otherwise>
						<tr><td> <b>Status:</b> </td>   <td> <a href=#> Application is Submitted </a> </td></tr>
				    </c:otherwise>
				</c:choose>

				<tr><td colspan="2"> <h4>Basic Information</h4>	</td></tr> 				
				<tr><td> <b>Last Name:</b> 	 </td>   <td>	${student.lastName} </td></tr> 
				<tr><td> <b>First Name:</b>  </td>   <td>	${student.firstName} </td></tr> 
				<tr><td> <b>CIN:</b> 	     </td>   <td>	${student.cin} </td></tr> 
				<tr><td> <b>Phone No.:</b> 	 </td>   <td>	${student.phone} </td></tr> 
				<tr><td> <b>E-mail:</b> 	 </td>   <td>	${student.email} </td></tr> 
				<tr><td> <b>Gender:</b> 	 </td>   <td>	${student.gender} </td></tr> 
				<tr><td> <b>Birthday:</b> 	 </td>   <td>	<fmt:formatDate value="${student.birthday}" pattern="MM/dd/yyyy"  /> </td></tr> 
				<tr><td> <b>Citizenship:</b> </td>   <td> 	${student.citizenship} </td></tr>
			
				<c:forEach items="${eduBackground}" var ="eduBackground">
					<c:if test="${eduBackground.userId.id == student.id}">
						<tr><td colspan="2"> <h4>Educational Background</h4>	</td></tr> 
						<tr><td> <b>College Name:</b> </td>   <td> ${eduBackground.colgName}	</td></tr> 
						<tr><td> <b>Time Period:</b>  </td>   <td> <fmt:formatDate value="${eduBackground.timePeriod1}" pattern="MM/dd/yyyy"  /> to <fmt:formatDate value="${eduBackground.timePeriod2}" pattern="MM/dd/yyyy"  /></td></tr> 
						<tr><td> <b>Degree:</b> 	  </td>   <td> ${eduBackground.degree} </td></tr> 
						<tr><td> <b>Major:</b> 		  </td>   <td> ${eduBackground.major} </td></tr> 
					</c:if>
				</c:forEach>

				<tr><td colspan="2"> <h4>Academic Records</h4>	</td></tr> 
				<tr><td><b>TOEFL:</b></td>   <td>${app.toefl}</td></tr>
				<tr><td><b>GRE:</b></td>   <td>${app.gre}</td></tr>
				<tr><td><b>GPA:</b></td>   <td>${app.gpa}</td></tr>					
				<tr><td><b>Transcript:</b></td>   <td><a href= "download.html?name=${app.transcript}"> View transcript </a></td></tr>
			
			</table>
			<br/> <hr style="height:30px"> <br/>
			<c:set var="count" value="${count + 1}" scope="page"/>
			
		</c:if>
    </c:forEach>
    	
</table>
	<br/><hr>
	
	</div>
</body>
</html>