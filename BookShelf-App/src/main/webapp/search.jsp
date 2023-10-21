<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Recently Added</title>
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
			String ch = request.getParameter("ch");
				BookDAOImpl dao1 = new BookDAOImpl(DbConnect.getConn());
			List<BookDtls> list1 = dao1.getBookBySearch(ch);
			for (BookDtls b1 : list1) {
			%>

			<div class="col hp">
				<div class="card h-100 shadow-sm">
					<a href="productPage.jsp?bid=<%=b1.getBookId()%>"> <img
						src="img/<%=b1.getPhotoName()%>" class="card-img-top"
						alt="product.title" />
					</a>

					<div class="label-top shadow-sm">
						<a class="text-white" href="#"><%=b1.getBookCategory()%></a>
					</div>
					<%
						if (b1.getBookCategory().equalsIgnoreCase("old")) {
					%>
					<div class="card-body">
						<div class="clearfix mb-3">
							<span class="float-start badge rounded-pill bg-success">RS
								<%=" " + b1.getPrice()%></span> <span class="float-end"><a
								href="#" class="small text-muted text-uppercase aff-link"><%=b1.getAuthor()%></a></span>
						</div>
						<h5 class="card-title pl-10">
							<a target="_blank" href="#"><%=b1.getBookName()%></a>
						</h5>

						<div class="d-grid gap-2 my-4">

							<a href="#" class="btn btn-warning bold-btn">Contact to Owner</a>

						</div>
						<%
							} else {
						%>

						<div class="card-body">
							<div class="clearfix mb-3">
								<span class="float-start badge rounded-pill bg-success">RS
									<%=" " + b1.getPrice()%></span> <span class="float-end"><a
									href="#" class="small text-muted text-uppercase aff-link"><%=b1.getAuthor()%></a></span>
							</div>
							<h5 class="card-title pl-10">
								<a target="_blank" href="#"><%=b1.getBookName()%></a>
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
								<a href="cart?bid=<%=b1.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-warning bold-btn">add to cart</a>

								<%
									}
								%>
							</div>
							<%
								}
							%>


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