<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Student Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <script type="text/javascript" src="javascript/jquery-2.1.1.min.js"></script>

</head>
<body>

    <div class="container">
   		<div class="page-header">
   		   	<a href="../appDetail.html?studentId=${student.id}" class="btn btn-primary pull-right" > Home </a>
   			<a href="/springmvc/home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2>Students<small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>	
	
	
		<h3>Educational Background</h3> <br/>

		<h4>Hi ${student.firstName} </h4> <br/>

<form:form modelAttribute="eduBackground" method="post">
	
	<table class="table table-striped table-bordered table-hover">
	
		<tr><td colspan="2"> <h4>Educational Background</h4> </td></tr> 
		<tr><td> <b>College Name:</b> </td>   <td> <form:input path="colgName" class="form-control" /> 	</td></tr> 
		<tr><td> <b>Attended From:</b></td>   <td> <form:input path="timePeriod1" type="date" class="form-control" />  </td></tr> 
		<tr><td> <b>Attended To:</b>  </td>   <td> <form:input path="timePeriod2" type="date" class="form-control" />  </td></tr> 
		<tr><td> <b>Degree:</b> 	  </td>   <td> <form:input path="degree" class="form-control" />  </td></tr> 
		<tr><td> <b>Major:</b> 		  </td>   <td> <form:input path="major" class="form-control" />  </td></tr>
						
	</table>
			<input type="hidden" name="studentId" value="${student.id}" /> 
	   		<input type="submit" value="Add" class="btn btn-success"/>		
</form:form>

<hr>		


<table class="table table-striped table-bordered table-hover" >
	<tr><td colspan="2"> <h4>Educational Background(s)</h4> </td></tr> 
				<c:forEach items="${eduBack}" var ="eduBackground">
					<c:if test="${eduBackground.userId.id == student.id}">
						<tr><td colspan="2"> <h4>Educational Background  <a href="../removeEduBack/${application.id}/${eduBackground.id}.html?studentId=${student.id}" class="pull-right"> remove </a>	</h4> </td></tr> 
						<tr><td> <b>College Name:</b> </td>   <td> ${eduBackground.colgName}	</td></tr> 
						<tr><td> <b>Time Period:</b>  </td>   <td> <fmt:formatDate value="${eduBackground.timePeriod1}" pattern="MM/dd/yyyy"  /> to <fmt:formatDate value="${eduBackground.timePeriod2}" pattern="MM/dd/yyyy"  /></td></tr> 
						<tr><td> <b>Degree:</b> 	  </td>   <td> ${eduBackground.degree} </td></tr> 
						<tr><td> <b>Major:</b> 		  </td>   <td> ${eduBackground.major} </td></tr> 
					</c:if>
				</c:forEach>
</table>

<hr>
	</div>

</body>
</html>