<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="ecommerceHelper.HelperDesc"%>
<%@page import="ecommerceEntities.Category"%>
<%@page import="ecommerceDao.CategoryDao"%>
<%@page import="ecommerceEntities.Product"%>
<%@page import="java.util.List"%>
<%@page import="ecommerceDao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommerce-Home</title>
<%@include file="components/Common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/Navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<%
			String cat = request.getParameter("category");
			ProductDao pdao = new ProductDao();
			List<Product> pr = null;
			if (cat == null || cat.trim().equals("all")) {
				pr = pdao.getAllProducts();
			} else {
				int cid = Integer.parseInt(cat.trim());
				pr = pdao.getAllProductsByCId(cid);
			}

			CategoryDao cd = new CategoryDao();
			List<Category> clist = cd.getCategories();
			%>
			<!-- Show Category -->

			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>

					<%
					for (Category z : clist) {
					%>
					<a href="index.jsp?category=<%=z.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=z.getCategoryName()%></a>
					<%
					}
					%>
				</div>

			</div>
			<!-- Show Products -->

			<div class="col-md-10">

				<!-- Row -->
				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">
							<%
							for (Product z : pr) {
							%>
							<div class="card">
								<div class="container text-center">
									<img class="card-img-top mt-2"
										src="img/product/<%=z.getpPhoto()%>"
										style="max-height: 200px; max-width: 100%"
										alt="Card image cap">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=z.getpName()%></h5>
									<p class="card-text">
										<%=HelperDesc.get10Words(z.getpDesc())%>
									</p>
								</div>
								<div class="footer">
									<button class="btn cutom-bg text-blue" onclick="add_to_cart(<%=z.getpId()%>,'<%=z.getpName()%>',<%= z.getPriceAfterDiscount()%>)">Add To Cart</button>
									<button class="btn btn-outline-success">
										&#8377;<%=z.getPriceAfterDiscount()%>/-<span
											class="text-secondary discount-label"> &#8377;<%=z.getpPrice()%>
											<%=z.getpDiscount()%> off
										</span>
									</button>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<%@include file="components/common_modals.jsp" %>
</body>
</html>