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
<meta charset="ISO-8859-1">
<%@include file="Component/allCss.jsp"%>
<link href="Component/index.css" rel="stylesheet" type="text/css">

<title>Book Shelf</title>

<style type="text/css">
.back-img {
	background: url("img/a.jpg");
	height: 86vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

@import
	url('https://fonts.googleapis.com/css2?family=Fira+Sans+Extra+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Heebo:wght@100;200;300;400;500;600;700;800;900&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap')
	;

@import url("https://use.fontawesome.com/releases/v5.13.0/css/all.css");
</style>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<%
		User u = (User) session.getAttribute("obj");
	%>
	<c:if test="${not empty cart }">
		<div id="toast">${cart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		
</script>
		<c:remove var="cart" scope="session" />
	</c:if>

	<div class="container-fluid back-img "></div>
	<h3>Recent Books</h3>
	<!-- Recent Book -->

	<div class="container bg-trasparent my-4 p-3"
		style="position: relative">
		<div
			class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">
			<%
				int count2 = 0;
			BookDAOImpl dao1 = new BookDAOImpl(DbConnect.getConn());
			List<BookDtls> list1 = dao1.getRecentBooks();
			for (BookDtls b1 : list1) {
				if (count2 < 4) {
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
					count2++;
				}
				}
				%>

			</div>
			<div class="d-grid gap-2 my-4">
				<a href="recentBook.jsp" class="btn btn-warning btn-sm bold-btn">View
					All</a>
			</div>

		</div>
		<!-- Recent Book -->





		<!-- NEW Book -->
		<h3>NEW Books</h3>
		<div class="container bg-trasparent my-4 p-3"
			style="position: relative">
			<div
				class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">

				<%
					int count1 = 0;
				BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
				List<BookDtls> list = dao.getNewBooks();
				for (BookDtls b : list) {
					if (count1 < 4) {
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
					count1++;
				}
				}
				%>

			</div>
			<div class="d-grid gap-2 my-4">
				<a href="newBook.jsp" class="btn btn-warning btn-sm bold-btn">View
					All</a>
			</div>
		</div>
		<!-- NEW Book -->



		<!-- OLD BOOK -->

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
					if (count < 4) {
				%>

				<div class="col hp">
					<div class="card h-100 shadow-sm">
						<a href="productPage.jsp?bid=<%=b2.getBookId()%>"> <img
							src="img/<%=b2.getPhotoName()%>" class="card-img-top"
							alt="product.title" />
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

								<a href="#" class="btn btn-warning bold-btn">Contact to
									Owner</a>

							</div>

						</div>
					</div>
				</div>

				<%
					count++;
				}
				}
				%>

			</div>
			<div class="d-grid gap-2 my-4">
				<a href="oldBook.jsp" class="btn btn-warning btn-sm bold-btn">View
					All</a>
			</div>
		</div>

		<!-- OLD book -->
</body>
</html>