<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.ebook.db.DbConnect"%>
<%@ page import="com.ebook.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="Component/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="Component/productPage.css" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<%
		BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
	BookDtls b = dao.getBookById(Integer.parseInt(request.getParameter("bid")));
	%>
	<div class="container mt-5 mb-5">
		<div class="card">
			<div class="row g-0">
				<div class="col-md-6 border-end">
					<div class="d-flex flex-column justify-content-center">
						<div class="main_image">
							<img src="img/<%=b.getPhotoName()%>" id="main_product_image"
								width="200">
						</div>

					</div>
				</div>
				<div class="col-md-6 pt-100">
					<div class="p-3 right-side">
						<div>
							<h3><%=b.getBookName()%></h3>
							<h4><%=b.getBookCategory()%></h4>
						</div>
						<div>

							<h3><%=b.getPrice()%></h3>
						</div>

						<div class="mt-10 ">
							<%
								if (b.getBookCategory().equalsIgnoreCase("old")) {
							%>

							<h4>
								Contact to seller
								<%=b.getEmail()%></h4>
							<%
								}
							%>

							<div>
								<ul>
									<li class="fw-bold">Easy Return</li>
									<li class="fw-bold">CAsh on delivery</li>
									<li class="fw-bold">Free Shipping</li>

								</ul>
							</div>
						</div>
						<div class="buttons d-flex flex-row mt-5 gap-3">
							<%
								if (b.getBookCategory().equalsIgnoreCase("old")) {
							%>
							<a class="btn btn-outline-dark" href="">Contiue Shopping</a>
							<%
								} else {
							%>
							<a class="btn btn-outline-dark" href="">Add to cart</a>
							<%
								}
							%>
							<!--<b utton class="btn btn-dark">Add to Cart</button> -->
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>