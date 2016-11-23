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
  
  <script type="text/javascript" src="javascript/jquery-2.1.1.min.js"></script>

</head>
<body>

    <div class="container">
   		<div class="page-header">
   		   	<a href="../student/appDetail.html?studentId=${student.id}" class="btn btn-primary pull-right" > Home </a>
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2>Students<small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>	
	
	
		<h3>Edit Application</h3> <br/>

		<h4>Hi ${student.firstName} </h4> <br/>

<form action="addApplication.html" method="post" enctype="multipart/form-data">
	<table class="table table-striped table-bordered table-hover">
	
			<tr><td colspan="2" > <h4>Add Application</h4>	</td></tr> 
			<tr><td> <b>Department:</b> </td>   <td>  ${department.name} </td></tr>
			 
			<tr><td> <b>Program:</b>    </td>   <td> <select name="program" id="progSelect">
														<c:forEach items="${programs}" var="prog">	
															<option value="${prog.name}" <c:if test="${prog.name == program.name}"> selected</c:if>>${prog.name}</option>
														</c:forEach>
													</select> 
												</td></tr> 
												
			<tr><td> <b>Term:</b> 		</td>   <td> <input type="text" name="term" value="${application.term}"> </td></tr> 
			

			<tr><td colspan="2"> <h4>Basic Information</h4>	</td></tr> 	
			<tr><td> <b>Last Name:</b> 	     </td>   <td> <input type="text" name="lastName" value="${student.lastName}"> 	 </td></tr> 			 
			<tr><td> <b>First Name:</b> 	     </td>   <td> <input type="text" name="firstName" value="${student.firstName}"> 	 </td></tr> 
			<tr><td> <b>CIN:</b> 	     </td>   <td> <input type="text" name="cin" value="${student.cin}"> 	 </td></tr> 
			<tr><td> <b>Phone No.:</b> 	 </td>   <td> <input type="text" name="phone" value="${student.phone}"> 	 </td></tr> 
			<tr><td> <b>Gender:</b> 	 </td>   <td> <input type="text" name="gender" value="${student.gender}"> 	 </td></tr> 
			<tr><td> <b>Birthday:</b> 	 </td>   <td> <input type="date" name="birthday" value="${student.birthday}"> </td></tr> 
			<tr><td> <b>Citizenship:</b> </td>   <td> <input type="text" name="citizenship" value="${student.citizenship}"> 	 </td></tr>
		

<tr><td colspan="2"> <h4>Educational Background(s)  <a href="./editEduBackground/${application.id}" onclick="document.getElementById('foo').submit(); return false;" class="pull-right"> Add/Remove </a></h4></td></tr> 

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
			<tr><td> <b>TOEFL:</b>		</td>  	<td> <input type="text" name="toefl" value="${application.toefl}"> </td></tr>
			<tr><td> <b>GRE:</b>		</td>   <td> <input type="text" name="gre" value="${application.gre}"> </td></tr>
			<tr><td> <b>GPA:</b>		</td>   <td> <input type="text" name="gpa" value="${application.gpa}"> </td></tr>	
			<tr><td> <b>Transcript:</b> </td>   <td> <input type="file" name="file" />
			
													<%-- <a href="newUpload.html"> Upload Transcript </a> 
			                                         	 <c:if test= "${not empty fileName}">
			                                            	&nbsp; ${fileName}           	
			                                             </c:if> --%>
													</td></tr>
									
	</table>

				<input type="hidden" name="file" value="${file}"/>						
	   			<input type="hidden" name= "studentId" value="${student.id}"/>
	   			<input type="hidden" name= "department" value="${department.id}"/>
	   			<input type="hidden" name= "appId" value="${application.id}"/>
	   				   			
				<input type="submit" name="action" value="Save"/>
				<input type="submit" name="action" value="Submit"/>
</form>
<hr>
			
	</div>
	
			<form id="foo" method="get" action="./editEduBackground/${application.id}.html">
    			<input type="hidden" name="studentId" value="${student.id}" />
			</form>
</body>
</html>