<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--jsp:useBean id="option" class="model.SelectOption" scope="page"/-->

<title>Edit Application</title>
</head>
<body>

<c:if test="${not empty errors}" >
	<font color="red"> ${errors} </font>
</c:if>
<form action = "EditApplication" method="post">
<table border="1">

	<tr>
		<td>Applicant:*</td>
		<td> <input type="text" name="applicant" value="${currEntry[0]}"/>  </td>
	</tr>
	
	<tr>
		<td>Application Recieved On (M/d/yyyy):*</td>
		<td> <input type="text" name="date" value="${currEntry[1]}"/> </td>
	</tr>
	
	<tr>
		<td>GPA:</td>
		<td> <input type="text" name="gpa" value="${currEntry[2]}"/> </td>
	</tr>
	
	<tr>
		<td>Status:*</td>
		<td>
			<select name="status">
				<option>${currEntry[3]}</option>
				<option>Application Incomplete</option>
				<option>Pending Review</option>
				<option>Rejected</option>
				<option>Accepted</option>
				<option>Admission Offer Sent</option>
				<option>Admission Offer Accepted</option>
			</select>
		</td>
	</tr>

	<tr> <td colspan="2"> <input type="Submit" value="Save"/> </td> </tr>
	
</table>
<input type="hidden" name="index" value="${param.index}" />
</form>

</body>
</html>