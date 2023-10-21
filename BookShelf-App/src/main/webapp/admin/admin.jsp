

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@ page import="com.ebook.dao.*"%>
<%@ page import="com.ebook.db.DbConnect"%>
<%@ page import="com.ebook.entity.*"%>
<%@include file="/Component/allCss.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin Page</title>
<link rel="stylesheet" href="Component/style.css" />
<link rel="stylesheet" type="text/css" href="admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; ">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
.header {
	position: fixed;
	background-color: #22242a;
	top: 0;
	padding: 20px;
	width: 100%;
	height: 13%;
	transition: 0.5s;
	transition-property: color;
	z-index: 100000;
}
</style>
<title>BookShelf</title>
</head>
<body>

	<c:if test="${empty obj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%
		User u = (User) session.getAttribute("obj");
	%>
	<c:if test="${not empty succMsg }">
		<div id="toast">${succMsg }</div>

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
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failMsg }">

		<div id="toast">${failMsg }</div>

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
		<c:remove var="failMsg" scope="session" />
	</c:if>
	<header class="header">
		<div class="navbar-header">

			<h3>Admin Dashboard</h3>

			<a href="../logout">
				<button type="button" class="button1">LOGOUT</button>
			</a>
			<!-- login form-->
		</div>
		<!-- login form end-->

		</div>
	</header>

	<!-- header end-->
	<!-- sidebar -->
	<div class="sidebar">
		<div id="space"></div>

		<b> <a href="#" id="next1"><i class="fas fa-user active"></i><span>Add
					Book </span></a> <a href="#" id="next2"><i class="fas fa-person"></i><span>All
					Books</span></a> <a href="#" id="next3"><i class="fas fa-plus-circle"></i><span>Book
					Order</span></a> <a href="#" id="next4"><i class="fas fa-pencil"></i><span>Update
					Items</span></a> <a href="#" id="next5"><i class="fas fa-users"></i><span>Customer
					Data</span></a>
		</b>
	</div>
	<!-- sidebar end-->
	<div class="ad">
		<%
			BookDtls book = null;

		if (request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImpl daoImpl = new BookDAOImpl(DbConnect.getConn());
			book = daoImpl.getBookById(id);

		}
		%>


		<section id="f1">
			<form action="../add_books" method="post"
				enctype="multipart/form-data">


				<h3>Add Book</h3>
				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">
							<label class="form-label" for="form3Example1m">Book Name</label>
						</div>
					</div>
					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<input type="text" id="form3Example1m"
								class="form-control form-control-lg" name="name" required />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Author
								Name</label>
						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<input type="text" id="form3Example1m"
								class="form-control form-control-lg" name="aname" required />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Price</label>
						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<input type="number" id="form3Example1m"
								class="form-control form-control-lg" name="price" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Book
								Categories</label>

						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">

							<select class="form-control form-control-lg" id="form3Example1m"
								name="btype">
								<option selected>--select--</option>
								<option value="new">New Book</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Book
								Status</label>

						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">

							<select class="form-control form-control-lg" id="form3Example1m"
								name="bstatus">
								<option selected>--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-0">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Upload
								Image</label>
						</div>
					</div>

					<div class="col-md-4 mb-0">
						<div class="form-outline">
							<input type="file" id="form3Example1m"
								class="form-control form-control-lg" name="bimg"
								accept="image/png, image/jpeg" required /><label
								style="color: red"> * jpg , jpeg</label>
						</div>
					</div>
				</div>

				<button type="submit" value="submit">Add</button>
			</form>


		</section>



		<section id="f2">
			<form>
				<h3>All Books</h3>
				<div class="table">
					<table class="cust" border="5">
						<thead class="thead-light">
							<th>ID</th>
							<th>Image</th>
							<th>Book Name</th>
							<th>Author</th>
							<th>Price</th>
							<th>Categories</th>
							<th>Status</th>
							<th>Action</th>

						</thead>
						<tbody>
							<%
								BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());

							List<BookDtls> list = dao.getAllBooks();
							for (BookDtls b : list) {
							%>
							<tr>
								<td><%=b.getBookId()%></td>
								<td><img src="../img/<%=b.getPhotoName()%>"
									style="width: 50px; height: 50px;""></td>
								<td><%=b.getBookName()%></td>
								<td><%=b.getAuthor()%></td>
								<td><%=b.getPrice()%></td>
								<td><%=b.getBookCategory()%></td>

								<td><%=b.getStatus()%></td>
								<td><a href="./admin.jsp?id=<%=b.getBookId()%>"
									class="btn btn-sm btn-danger">Edit</a> <a
									href="../delete?id=<%=b.getBookId()%>"
									class="btn btn-sm btn-danger">Delete</a></td>
							</tr>

							<%
								}
							%>
						</tbody>


					</table>
				</div>
			</form>
		</section>




		<section id="f3">

			<form>
				<h3>Book Orders</h3>
				<div class="table">
					<table class="cust" border="5">
						<thead class="thead-light">
							<th>Order Id</th>
							<th>Name</th>
							<th>Email</th>
							<th>Address</th>
							<th>Phone Number</th>
							<th>Book Name</th>
							<th>Author</th>
							<th>Price</th>
							<th>Payment</th>
						</thead>
						<tbody>

						</tbody>
						<%
							try {

							Class.forName("org.apache.derby.jdbc.ClientDriver");
							Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Mca", "mca", "Ankit@123");
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select * from reg ");
							while (rs.next()) {
								out.print("<tr><tc><td>" + rs.getString(1) + "  " + rs.getString(2) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(3) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(4) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(8) + "</td></tc>");
								out.print("<tc><td>********</td></tc>");
								out.print("<tc><td>" + rs.getString(10) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(11) + " - " + rs.getString(12) + "</td></tc> </tr>");

							}

						} catch (Exception ee) {
						}
						%>
					</table>
				</div>
			</form>

		</section>

		<section id="f4">


			<form class="input" action="../add_books" method="post">
				<h3>Update Item</h3>


				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Book Name</label>
						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<input type="text" id="form3Example1m"
								class="form-control form-control-lg" name="name"
								value="<%=(book != null) ? book.getBookName() : ""%>" required />
						</div>
					</div>
				</div>



				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Author
								Name</label>
						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<input type="text" id="form3Example1m"
								class="form-control form-control-lg" name="author"
								value="<%=(book != null) ? book.getAuthor() : ""%>" required />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Price</label>
						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<input type="number" id="form3Example1m"
								class="form-control form-control-lg" name="price"
								value="<%=(book != null) ? book.getPrice() : ""%>" required />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Book
								Categories</label>

						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">

							<select class="form-control form-control-lg" id="form3Example1m"
								name="btype">
								<option selected>--select--</option>
								<option value="new">New Book</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Book
								Status</label>

						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">

							<select class="form-control form-control-lg" id="form3Example1m"
								name="bstatus">
								<option selected>--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-4">
						<div class="form-outline">

							<label class="form-label" for="form3Example1m">Upload
								Image</label>
						</div>
					</div>

					<div class="col-md-4 mb-4">
						<div class="form-outline">
							<input type="file" id="form3Example1m"
								class="form-control form-control-lg" name="bimg"
								accept="image/png, image/jpeg" required /><label
								style="color: red"> * jpg , jpeg</label>
						</div>
					</div>
				</div>


				<button type="submit">Update</button>
			</form>


		</section>


		<section id="f5">
			<form>
				<h3>Customers Data</h3>
				<div class="table">
					<table class="cust" border="5">
						<thead class="thead-light">
							<th>Customer Name</th>
							<th>Phone Number</th>

							<th>Email</th>
							<th>Address</th>
							<th>Pincode</th>

						</thead>
						<tbody>
							<%
								UserDAOImpl dao1 = new UserDAOImpl(DbConnect.getConn());

							List<User> list1 = dao1.getAllUsers();
							for (User user : list1) {
							%>
							<tr>
								<td><%=user.getName()%></td>

								<td><%=user.getPhno()%></td>
								<td><%=user.getEmail()%></td>
								<td><%=user.getAddress()%></td>
								<td><%=user.getPincode()%></td>

							</tr>

							<%
								}
							%>
						</tbody>
						<%
							try {

							Class.forName("org.apache.derby.jdbc.ClientDriver");
							Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Mca", "mca", "Ankit@123");
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select * from reg ");
							while (rs.next()) {
								out.print("<tr><tc><td>" + rs.getString(1) + "  " + rs.getString(2) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(3) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(4) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(8) + "</td></tc>");
								out.print("<tc><td>********</td></tc>");
								out.print("<tc><td>" + rs.getString(10) + "</td></tc>");
								out.print("<tc><td>" + rs.getString(11) + " - " + rs.getString(12) + "</td></tc> </tr>");

							}

						} catch (Exception ee) {
						}
						%>
					</table>
				</div>
			</form>

		</section>
	</div>

	<script>
		next1.onclick = function() {
			f1.style.top = "0px";
			f2.style.top = "+1000px";
			f3.style.top = "+1000px";
			f4.style.top = "+1000px";
			f5.style.top = "+1000px";
			f6.style.top = "+1000px";
			f7.style.top = "+1000px";
			f8.style.top = "1000px";
		}

		next2.onclick = function() {
			f2.style.top = "0px";
			f1.style.top = "-1000px";
			f3.style.top = "+1000px";
			f4.style.top = "+1000px";
			f5.style.top = "+1000px";
			f6.style.top = "+1000px";
			f7.style.top = "+1000px";
			f8.style.top = "1000px";

		}

		next3.onclick = function() {

			f3.style.top = "0px";
			f1.style.top = "-1000px";
			f2.style.top = "-1000px";
			f4.style.top = "+1000px";
			f5.style.top = "+1000px";
			f6.style.top = "+1000px";
			f7.style.top = "+1000px";
			f8.style.top = "1000px";
		}

		next4.onclick = function() {

			f4.style.top = "0px";
			f3.style.top = "-1000px";
			f1.style.top = "-1000px";
			f2.style.top = "-1000px";
			f5.style.top = "+1000px";
			f6.style.top = "+1000px";
			f7.style.top = "+1000px";
			f8.style.top = "1000px";
		}

		next5.onclick = function() {
			f5.style.top = "0px";
			f2.style.top = "-1000px";
			f1.style.top = "-1000px";
			f3.style.top = "-1000px";
			f4.style.top = "-1000px";
			f6.style.top = "+1000px";
			f7.style.top = "+1000px";
			f8.style.top = "1000px";

		}

		next6.onclick = function() {
			f6.style.top = "0px";
			f2.style.top = "-1000px";
			f1.style.top = "-1000px";
			f3.style.top = "-1000px";
			f4.style.top = "-1000px";
			f5.style.top = "-1000px";
			f7.style.top = "+1000px";
			f8.style.top = "1000px";
		}

		next7.onclick = function() {
			f7.style.top = "0px";
			f2.style.top = "-1000px";
			f1.style.top = "-1000px";
			f3.style.top = "-1000px";
			f4.style.top = "-1000px";
			f5.style.top = "-1000px";
			f6.style.top = "-1000px";
			f8.style.top = "1000px";
		}
		next8.onclick = function() {
			f8.style.top = "0px";
			f2.style.top = "-1000px";
			f1.style.top = "-1000px";
			f3.style.top = "-1000px";
			f4.style.top = "-1000px";
			f5.style.top = "-1000px";
			f6.style.top = "-1000px";
			f7.style.top = "-1000px";

		}
	</script>
</body>
</html>
