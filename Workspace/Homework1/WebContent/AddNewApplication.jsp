<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Application</title>
</head>
<body>

<form action = "AddNewApplication" method="post">

<c:if test="${not empty errors}">
	${errors}
</c:if>

<table border="1">

	<tr>
		<td>Applicant:*</td>
		<td> <input type="text" name="applicant" value="${currEntry[0]}"> </td>
	</tr>
	
	<tr>
		<td>Application Recieved On (M/d/yyyy):*</td>
		<td> <input type="text" name="date" placeholder="MM/dd/yyyy" value="${currEntry[1]}"> </td>
	</tr>
	
	<tr>
		<td>GPA:</td>
		<td> <input type="text" name="gpa" value="${currEntry[2]}"> </td>
	</tr>
	
	<tr>
		<td>Status:*</td>
		<td>
			<select name="status" value="${currEntry[3]}">
				<option>Application Incomplete</option>
				<option>Pending Review</option>
				<option>Rejected</option>
				<option>Accepted</option>
				<option>Admission Offer Sent</option>
				<option>Admission Offer Accepted</option>
			</select>
		</td>
	</tr>

	<tr> <td colspan="2"> <input type="Submit" value="Add"/> </td> </tr>
	
</table>
</form>

</body>
</html>