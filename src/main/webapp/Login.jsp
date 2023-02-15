<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login-MyCart</title>
<%@include file="components/Common_css_js.jsp" %>
</head>
<body>
<%@include file="components/Navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">

<div class="card mt-3">
<%@include file="components/Message.jsp"%>
<div class="card-header custom-bg text-blue">
<h3>Login here</h3>
</div>
<div class="card-body">
<form action="Login"method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="pass"type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <a href="Register.jsp">if not register click-here</a><br>
  <a href="ForgetPassword.jsp">Forget Password</a>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
  <button type="submit" class="btn btn-primary">Reset</button>
  </div>
</form>
</div>
</div>

</div>
</div>
</div>
</body>
</html>