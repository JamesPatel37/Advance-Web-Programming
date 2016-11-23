<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
</head>

<body>

	<div class="container">
   		<div class="page-header">
    		<h2> Graduate Application Program <small>CS 520</small> </h2>
    		<h3> User Login </h3>
    	</div>	
    	
    	<form action= "login.html" method="post" class="form-inline text-left"> 
    	
    		<div class="form-group">
          		<label for="user">Username</label>
          		<input type="text" class="form-control" name="username" id="username" placeholder="Enter your username">
        	</div> <br/>
        
        	
      		<div class="form-group">
          		<label for="pass">Password</label>
          		<input type="text" class="form-control" name="password" id="password" placeholder="Enter your password">
        	</div> <br/>
        <br/>
			<button type="submit" class="btn btn-success">Login</button>
		
		</form>
   	</div>


</body>

</html>