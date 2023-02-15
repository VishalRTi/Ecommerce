<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
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
<h3>Forgot Password</h3>
</div>
<div class="card-body">
<form action="ForgotPassword"method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  	<div class="form-group">
    <label for="exampleInputPassword1">New-Password</label>
    <input name="pass"type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>
</div>
</div>

</div>
</div>
</div>
</body>
</html>