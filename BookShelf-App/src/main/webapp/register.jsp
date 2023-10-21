<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Component/allCss.jsp"%>
<link rel="stylesheet" href="Component/register.css" />
<title>Registration</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>


	<div class="outer-box">
		<div class="inner-box">
			<header class="signup-header">
				<h2>Sign Up</h2>
				<p>It just takes only 30 seconds!</p>
			</header>
			
			<main class="signup-body">
			<c:if test="${ not empty regMsg}">
					<div class="alert alert-success text-center">${regMsg }</div>
					<c:remove var="regMsg" scope="session" />
				</c:if>
				<form action="register" method="post">

					<p>
						<label for="full name">Enter Your Full Name</label> <input
							type="text" name="name" required>

					</p>
					<p>
						<label for="Email">Enter Your Email</label> <input type="text"
							name="email" required>

					</p>
					<p>
						<label for="Email">Enter Your Mobile No</label> <input type="text"
							name="phno" required>

					</p>
					<p>
						<label for="password">Enter Your New Password</label> <input
							type="password" name="password" required>

					</p>
					<p>

						<input type="submit" id="submit" value="submit">

					</p>
				</form>
			</main>
			<footer class="signup-footer">
				<p>
					Already have an account <a href="login.jsp">Sign in</a>
				</p>

			</footer>

		</div>


	</div>

</body>
</html>