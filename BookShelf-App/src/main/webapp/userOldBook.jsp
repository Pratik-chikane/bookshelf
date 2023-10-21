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
<meta charset="ISO-8859-1">
<title>All Old Book</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<%
		User u = (User) session.getAttribute("obj");
	%>
	<c:if test="${ not empty succMsg}">
		<div class="alert alert-success text-center">
		${succMsg }
		</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	<div class="container p-5">
		<table class="table table-striped table-hover">
			<thead class="table-head-light-grey">
				<tr>
					<th scope="col">Book</th>
					<th scope="col">Name</th>

					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					String email = u.getEmail();
				System.out.println("****************"+u);
				BookDAOImpl dao = new BookDAOImpl(DbConnect.getConn());
				List<BookDtls> list = dao.getUserOldBooks(email, "old");
				for (BookDtls b : list) {
				%>
				<tr>

					<td><img src="img/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50px;"></td>
				
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><a href="deleteOld?em=<%=email%>&id=<%=b.getBookId() %>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
					}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>