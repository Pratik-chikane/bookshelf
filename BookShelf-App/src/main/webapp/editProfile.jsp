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
<link rel="stylesheet" href="Component/register.css" />
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
</head>
<body>

	<%@include file="Component/navbar.jsp"%>
	<%
		User u = (User) session.getAttribute("obj");
	%>


	<div class="outer-box">
		<div class="inner-box">
			<header class="signup-header">
				<h2>Edit Profile</h2>
			</header>
			<main class="signup-body">
				<c:if test="${ not empty msg}">
					<div class="alert alert-success text-center">${msg }</div>
					<c:remove var="msg" scope="session" />
				</c:if>
				<c:if test="${empty obj }">
					<c:redirect url="login.jsp" />
				</c:if>
				<form action="update" method="post">
					<input type="hidden" value="<%=u.getId()%>" name="id">
					<p>
						<label for="full name">Enter Your Full Name</label> <input
							type="text" name="name" value="<%=u.getName()%>" required>

					</p>
					<p>
						<label for="Email">Enter Your Email</label> <input type="text"
							name="email" value="<%=u.getEmail()%>" required>

					</p>
					<p>
						<label for="Email">Enter Your Mobile No</label> <input type="text"
							name="phno" value="<%=u.getPhno()%>" required>

					</p>
					<p>
						<label for="password">Enter Your Password</label> <input
							type="password" name="password" required>

					</p>
					<p>

						<input type="submit" id="submit" value="Update">

					</p>
				</form>
			</main>
		</div>
	</div>
</body>
</html>