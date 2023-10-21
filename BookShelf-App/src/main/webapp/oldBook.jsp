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
<%@include file="Component/allCss.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<h3>Old Books</h3>
	<div class="container bg-trasparent my-4 p-3"
		style="position: relative">
		<div
			class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">
			<%
			int count = 0;
			BookDAOImpl dao2 = new BookDAOImpl(DbConnect.getConn());
			List<BookDtls> list2 = dao2.getOldBooks();
			for (BookDtls b2 : list2) {
			%>

			<div class="col hp ">
				<div class="card h-100 shadow-sm">
					<a href="productPage.jsp?bid=<%=b2.getBookId()%>"> <img src="img/<%=b2.getPhotoName()%>"
						class="card-img-top" alt="product.title" />
					</a>

					<div class="label-top shadow-sm">
						<a class="text-white" href="#"><%=b2.getBookCategory()%></a>
					</div>
					<div class="card-body">
						<div class="clearfix mb-3">
							<span class="float-start badge rounded-pill bg-success">RS
								<%=" " + b2.getPrice()%></span> <span class="float-end"><a
								href="#" class="small text-muted text-uppercase aff-link"><%=b2.getAuthor()%></a></span>
						</div>
						<h5 class="card-title pl-10">
							<a target="_blank" href="#"><%=b2.getBookName()%></a>
						</h5>

						<div class="d-grid gap-2 my-4">

							<a href="#" class="btn btn-warning bold-btn">Contact to Owner</a>

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