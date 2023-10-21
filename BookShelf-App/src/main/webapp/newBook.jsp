<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.ebook.db.DbConnect"%>
<%@ page import="com.ebook.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>
<link href="Component/index.css" rel="stylesheet" type="text/css">

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>New Books</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<%
		User u = (User) session.getAttribute("obj");
	%>
	
	<div class="container bg-trasparent my-4 p-3"
		style="position: relative">
		<div
			class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">

			<%
				BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
			List<BookDtls> list = dao.getNewBooks();
			for (BookDtls b : list) {
			%>

			<div class="col hp">
				<div class="card h-100 shadow-sm">
					<a href="productPage.jsp?bid=<%=b.getBookId()%>"> <img
						src="img/<%=b.getPhotoName()%>" class="card-img-top"
						alt="product.title" />
					</a>

					<div class="label-top shadow-sm">
						<a class="text-white" href="#"><%=b.getBookCategory()%></a>
					</div>
					<div class="card-body">
						<div class="clearfix mb-3">
							<span class="float-start badge rounded-pill bg-success">RS
								<%=" " + b.getPrice()%></span> <span class="float-end"><a
								href="#" class="small text-muted text-uppercase aff-link"><%=b.getAuthor()%></a></span>
						</div>
						<h5 class="card-title pl-10">
							<a target="_blank" href="#"><%=b.getBookName()%></a>
						</h5>

						<div class="d-grid gap-2 my-4">
							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-warning bold-btn">add to
								cart</a>
							<%
								} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-warning bold-btn">add to cart</a>

							<%
								}
							%>
						</div>

					</div>
				</div>
			</div>

			<%
				}
			%>

		</div>

	</div>

</body>
</html>