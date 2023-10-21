<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./allCss.jsp"%>
</head>
<body>
	<div class="superNav border-bottom py-2 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 centerOnMobile">
					<select class="me-3 border-0 bg-light">
						<option value="en-us">EN-US</option>
					</select> <span
						class="d-none d-lg-inline-block d-md-inline-block d-sm-inline-block d-xs-none me-3"><strong>info@bookshelf.com</strong></span>
					<span class="me-3"><i
						class="fa-solid fa-phone me-1 text-warning"></i> <strong>1-800-123-1234</strong></span>
				</div>
				<div
					class="col-lg-6 col-md-6 col-sm-12 col-xs-12 d-none d-lg-block d-md-block-d-sm-block d-xs-none text-end">
					<span class="me-3"><i
						class="fa-solid fa-truck text-muted me-1"></i><a
						class="text-muted" href="#">Shipping</a></span> <span class="me-3"><i
						class="fa-solid fa-file  text-muted me-2"></i><a
						class="text-muted" href="#">Policy</a></span>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg bg-white sticky-top navbar-light p-3 shadow-sm">
		<div class="container">
			<a class="navbar-brand" href="./index.jsp"><i
				class="fa-solid fa-book-open"></i> <strong>Book Shelf</strong></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="mx-auto my-3 d-lg-none d-sm-block d-xs-block">

				<!-- <div class="input-group"> -->
					<!--  <form action="search.jsp" method="post">
						<span
							class="border-warning input-group-text bg-warning text-white"><i
							class="fa-solid fa-magnifying-glass"></i></span> <input type="search"
							class="form-control border-warning" name="ch" style="color: #7a7a7a">
						<button class="btn btn-warning text-white" >Search</button>
					</form>  -->
					<!-- <form action="search.js" action="post">
					<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="search" aria-label="Search">
					<button	class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
					</form> -->
			<!-- 	</div> -->
			</div>
			 <div class=" collapse navbar-collapse" id="navbarNavDropdown">
				<div class="ms-auto d-none d-lg-block">
					
						 <form action="search.jsp" method="post">
						 <div class="input-group">
						<span
							class="border-warning input-group-text bg-warning text-white"><i
							class="fa-solid fa-magnifying-glass"></i></span> <input type="search"
							class="form-control border-warning" name="ch" style="color: #7a7a7a">
						<button class="btn btn-warning text-white" type="submit">Search</button>
						</div>
					</form> 
					
				</div>
				<ul class="navbar-nav ms-auto ">
					<li class="nav-item"><a
						class="nav-link mx-2 text-uppercase active" aria-current="page"
						href="./recentBook.jsp">Newly Added</a></li>
					<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
						href="./newBook.jsp">New Books</a></li>
					<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
						href="./oldBook.jsp">Old Books</a></li>
					<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
						href="#">Services</a></li>
					<c:if test="${not empty obj }">
						<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
							href="checkout.jsp"><i class="fa-solid fa-cart-shopping me-1"></i>
								Cart </a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav ms-auto ">

					<c:if test="${not empty obj }">
						<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
							href="./userProfile.jsp"><i
								class="fa-solid fa-circle-user me-1"></i> ${obj.name } </a></li>
						<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
							href="./logout"><i class="fa-solid fa-circle-user me-1"></i>
								Logout </a></li>
					</c:if>
					<c:if test="${empty obj }">
						<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
							href="login.jsp"><i class="fa-solid fa-cart-shopping me-1"></i>
								Login </a></li>
						<li class="nav-item"><a class="nav-link mx-2 text-uppercase"
							href="register.jsp"><i class="fa-solid fa-circle-user me-1"></i>
								Register </a></li>
					</c:if>
				</ul>
			</div>
		</div> 
	</nav>


</body>
</html>