<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="javascript/gs_sortable.js"></script>

<!--script type="text/javascript">
var TSort_Data = new Array ('myTable', 's', 's', 'f', 's');
var TSort_Initial = new Array (1, 'D');
//tsRegister();
</script-->

 <title>CS Grad Applications</title>
</head>
 
<body>

<a href="AddNewApplication.jsp" > Add New Application </a> 
<br/>
<table border=1 id="myTable">
	
	<thead>
	<tr>
		<th> <a href = "Applications?id=1"> Applicant </a> </th>
		<th> Application Received On  </th>
		<th> <a href = "Applications?id=2"> GPA </a> </th>
		<th> <a href = "Applications?id=3"> Status </a> </th>
		<th> &nbsp; &nbsp; &nbsp; &nbsp; </th>
	</tr>
	</thead>
	<c:forEach items="${entries}" var = "entry" varStatus="stat">
	<tr>
		<td> ${entry.name} </td>
		<td>
      		<fmt:formatDate value="${entry.date}" pattern="MM/dd/yyyy"  />
   		</td>
		<!-- td> ${entry.date} </td -->
		<td> ${entry.gpa} </td>
		<td> ${entry.status} </td>
		<td> <a href = "EditApplication?index=${stat.index}" >edit</a> </td>
	</tr>
	
	</c:forEach>

</table>

</body>
</html>