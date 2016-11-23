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
  <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
  
<script>
$(document).ready(function() {

$('#department').change(function(event) {
        var dept = $("select#department").val();
        $.get('ajax.html', {
        	department : dept
        }, function(response) {
     console.log(response);
        var select = $('#program');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        });
        });
});


</script>
</head>
<body>

    <div class="container">
   		<div class="page-header">
   		   	<a href="../student/appDetail.html?studentId=${student.id}" class="btn btn-primary pull-right" > Home </a>
   			<a href="../home.html" class="btn btn-primary pull-right" > Logout </a>
    		<h2>Students<small> &nbsp; Graduate Application Program</small> <small>CS 520</small> </h2>
    	</div>	
	
	
		<h3>Add New Application</h3> <br/>

		<h4>Hi ${student.firstName} </h4> <br/>
	
<form action="addApplication.html" method="post" enctype="multipart/form-data">
	<table class="table table-striped table-bordered table-hover">
	
				<tr><td colspan="2" > <h3>Add Application</h3>	</td></tr> 
				<tr><td> <b>Department:</b> </td>   <td> <select name="department" id="department">
																<option>select department</option>
															<c:forEach items="${department}" var="department">
																<option value="${department.name}"> ${department.name}</option>
															</c:forEach>
														 </select>
													</td></tr> 
				<tr><td> <b>Program:</b>    </td>   <td> <select name="program" id="program">
															<option>select program</option>
														</select> 
													</td></tr> 
				<tr><td> <b>Term:</b> 		</td>   <td> <input type="text" name="term"> </td></tr> 
				
				
				<tr><td colspan="2"> <h4>Basic Information</h4>	</td></tr> 				 
				<tr><td> <b>CIN:</b> 	     </td>   <td> <input type="text" name="cin"> 	 </td></tr> 
				<tr><td> <b>Phone No.:</b> 	 </td>   <td> <input type="text" name="phone"> 	 </td></tr> 
				<tr><td> <b>Gender:</b> 	 </td>   <td> <input type="text" name="gender"> 	 </td></tr> 
				<tr><td> <b>Birthday:</b> 	 </td>   <td> <input type="date" name="birthday"> 	</td></tr> 
				<tr><td> <b>Citizenship:</b> </td>   <td> <input type="text" name="citizenship"> 	 </td></tr>
			
<tr><td colspan="2"> <h4>Educational Background(s)  <a href="./addEduBackground.html?studentId=${student.id}"  class="pull-right"> Add/Remove </a></h4></td></tr> 
 
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
				 
				<tr><td> <b>TOEFL:</b>		</td>  		<td> <input type="text" name="toefl"> </td></tr>
				<tr><td> <b>GRE:</b>		</td>    	<td> <input type="text" name="gre"> </td></tr>
<%-- 				
			<c:forEach items="${additionalFields}" var ="additionalField">
				<c:if test="${additionalField.deptId.id == department.id}">
					<tr><td> <b>${additionalField.name}:</b> </td>   	<td> <input type="text" name="${additionalField.name}"> </td></tr>	
				</c:if>
			</c:forEach> --%>
				
				<tr><td> <b>GPA:</b>		</td>   	<td> <input type="text" name="gpa"> </td></tr>	
				<tr><td> <b>Transcript:</b> </td>   	<td> <input type="file" name="file" /> </td></tr>
				
											 <%-- <a href="newUpload.html"> Upload Transcript </a> 
			                                         	 <c:if test= "${not empty fileName}">
			                                            	&nbsp; ${fileName}           	
			                                             </c:if> --%>
														
									
	</table>

				<input type="hidden" name="file" value="${file}"/>						
	   			<input type="hidden" name= "studentId" value="${student.id}"/>
				<input type="submit" name="action" value="Save"/>
				<input type="submit" name="action" value="Submit"/>
</form>
<hr>

			
	</div>
</body>
</html>