<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.ebook.db.DbConnect"%>
<%@ page import="com.ebook.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>

<!DOCTYPE html>
<html>
<head>
<!-- Include jQuery first -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include DataTables after jQuery -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<meta charset="ISO-8859-1">




<title>Orders</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<%
		User u = (User) session.getAttribute("obj");
	%>
	<c:if test="${ not empty ssg}">
		<div class="alert alert-success text-center">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<div class="container p-5">
		<table class="table table-striped table-hover">
			<thead class="table-head-light-grey">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Book Name</th>
					<th scope="col">Name</th>

					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
					String email = u.getEmail();
				System.out.println("****************" + u);
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DbConnect.getConn());
				List<BookOrder> list = dao.userOrders(u.getEmail());
				for (BookOrder b : list) {
				%>
				<tr>

					<%-- <td><img src="img/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50px;"></td> --%>

					<td><%=b.getOrderId()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getUserName()%></td>

					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>

				</tr>

				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>


</html>