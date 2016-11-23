<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Users</title></head>
<body>
<h2> Users List</h2>
<table border="1">
<tr><th>ID</th><th>Last Name</th><th>First Name</th><th>Email</th><th>Password</th><th>User Type</th></tr>
<c:forEach items="${users}" var="user">
<tr>
  <td>${user.id}</td>
  <td>${user.lastName}</td>
  <td>${user.firstName}</td>
  <td>${user.email}</td>
  <td>${user.password}</td>
  <td>${user.type}</td>
</tr>
</c:forEach>
</table>
</body>
</html>