<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/Common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	<div class="row">
		<div class="col-md-4 offset-md-3 ">
			<div class="card">
				<div class="card-body">

					<h3 class="text-center my-3">Sign Up Here</h3>
					<form action="Register"method="post">
						<div class="form-group">
							<label for="name">User Name</label> <input name="name" type="text"
								class="form-control" id="name" aria-describedby="emailHelp"
								placeholder="Enter Name Here">
						</div>
						<div class="form-group">
							<label for="email">User Email</label> <input name="email" type="email"
								class="form-control" id="email" aria-describedby="emailHelp"
								placeholder="Enter email Here">
						</div>
						<div class="form-group">
							<label for="password">User Password</label> <input name="password"
								type="password" class="form-control" id="password"
								aria-describedby="emailHelp" placeholder="Enter Password Here">
						</div>
						<div class="form-group">
							<label for="Contact Number">User Contact Details</label> <input name="phno"
								type="tel" class="form-control" id="phno"
								aria-describedby="emailHelp"
								placeholder="Enter Contact Details Here">
						</div>
						<div class="form-group">
							<label for="address">User Address</label>
							<textarea name="address" style="height =: 200px;" class="form-control"
								placeholder="Enter Address Here"></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Register</button>
							<button class="btn btn-outline-warning">Reset</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>