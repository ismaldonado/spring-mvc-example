<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<h1>Hello User</h1>
	
	<form action="user" method="post">
	<label for="userName">Enter your name</label>
		<input type="text" name="userName"><br> 
	<label for="days">Enter the number of days</label>
		<input type="number" name="days"><br>
		<input
			type="submit" value="Submit">
	</form>
	
</body>
</html>



