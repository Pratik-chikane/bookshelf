<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Component/allCss.jsp"%>
<title>LogIn</title>


<link rel="stylesheet" href="Component/register.css" />

</head>
<body>
<body>
	<div>
		<%@include file="Component/navbar.jsp"%>


		<div class="outer-box">
			<div class="inner-box">
				<header class="signup-header">
					<h2>Sign In</h2>
					<p>It just takes only 30 seconds!</p>
				</header>
				
				<c:if test="${ not empty logMsg}">
					<div class="alert alert-success text-center">${logMsg }</div>
					<c:remove var="logMsg" scope="session" />
				</c:if>
				<main class="signup-body">
					<form action="login" method="post">


						<p>
							<label for="Email">Enter Your Email</label> <input type="text"
								name="email" required>

						</p>

						<p>
							<label for="password">Enter Your Password</label> <input
								type="password" name="password" required>

						</p>
						<p>

							<input type="submit" id="submit" value="submit">

						</p>
					</form>
				</main>
				<footer class="signup-footer">
					<p>
						Don't have an account <a href="./register.jsp">Register</a>
					</p>

				</footer>

			</div>


		</div>
</body>
</html>