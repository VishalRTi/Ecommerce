<%@page import="ecommerceDao.ProductDao"%>
<%@page import="ecommerceDao.UserDao"%>
<%@page import="ecommerceEntities.Category"%>
<%@page import="java.util.List"%>
<%@page import="ecommerceDao.CategoryDao"%>
<%@page import="ecommerceEntities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are Not Logged in!! Login First");
	RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You Are Not Admin");
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
		return;
	}
}
UserDao u=new UserDao();
ProductDao p=new ProductDao();
CategoryDao m=new CategoryDao();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/Common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	<div class="container admin">
	<!-- Message for Category add -->
	<div class="container-fluid mt-3">
			<%@include file="components/Message.jsp" %>
	</div>
	
		<div class="row mt-3">

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="user_icon" src="img/man.png">
						</div>
						<h1><%=u.getTotalUser() %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="category" src="img/options.png">
						</div>
						<h1><%=m.getTotalCategory() %></h1>
						<h1 class="text-uppercase text-muted">Category</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="products" src="img/handle.png">
						</div>
						<h1><%=p.getTotalProduct() %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>

		</div>
		<!-- second Row -->
		<div class="row mt-3">
			<!-- second Row First Column -->
			<div class="col-md-6">
			
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="category" src="img/keys.png">
						</div>

						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>

			<!-- second Row second Column -->
			<div class="col-md-6">
			
				<div class="card" data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="category" src="img/plus.png">
						</div>

						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- add Category Modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" >
					<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form action="ProductOperationServlet" method="post">
				
				<input type="hidden"name="operation"value="addcategory">
				
				<div class="form-group">
				<input type="text" class="form-control"name="catTitle"placeholder="Enter Category Title"required>
				</div>
				
				<div class="form-group">
				<textarea style="height:100px;" class="form-control" placeholder="Enter Category Description"name="catDescription"required></textarea>
				</div>
				
				<div class="container text-center">
				
				<button class="btn btn-outline-success">Add Category</button>
				<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
				
				</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Category model-->
	
	
	<!-- Start of Product Model -->
		<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="add-product-modal">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
       		
       		<input type="hidden"name="operation" value="addproduct">
       		
				<div class="form-group">
				<input type="text" class="form-control"name="pname"placeholder="Enter Product Name"required>
				</div>
				<div class="form-group">
				<textarea style="height:100px;" class="form-control" placeholder="Enter Product Description"name="pdesc"required></textarea>
				</div>
				<div class="form-group">
				<input type="number" class="form-control"name="productPrice"placeholder="Enter Product Price"required>
				</div>
				<div class="form-group">
				<input type="text" class="form-control"name="productQuantity"placeholder="Enter Product Quantity"required>
				</div>
				<div class="form-group">
				<input type="number" class="form-control"name="productDiscount"placeholder="Enter Product Discount"required>
				</div>
				<!-- Product Categories -->
				
				<%
					CategoryDao c=new CategoryDao();
					List<Category>list=c.getCategories();		
				%>
				
				<div class="form-group">
				<select name="catId" class="form-control" id="">
				<%for(Category d:list){ 
				%>
				<option value="<%=d.getCategoryId()%>"><%=d.getCategoryName() %></option>
				
				<% }%>
				</select>
				</div>
				
				<!-- product Picture -->
				<div class="form-group">
				<label for="productPic">Select Picture for Products</label>
				<br>
				<input type="file"name="productPic" required>
				
				</div>
				<!-- Submit button -->
				<div class="container text-center">
				
				<button class="btn btn-outline-success">Add Product</button>
				<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
				
				</form>
      </div>
      
    </div>
  </div>
</div>
	<!-- End Product model-->
<%@include file="components/common_modals.jsp" %>
</body>
</html>