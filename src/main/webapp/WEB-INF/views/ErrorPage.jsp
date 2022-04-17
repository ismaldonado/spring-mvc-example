<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>Error page</h1>
		<p align="right">
			<button
				onclick="window.location.href = 'showFormForAdd.html'; return false;"
				class="btn btn-primary">Back to form</button>
		</p>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<div class="bg-dark text-light text-center p-3">Please,
					complete the form correctly</div>
			</div>
		</div>
	</div>
</body>
</html>