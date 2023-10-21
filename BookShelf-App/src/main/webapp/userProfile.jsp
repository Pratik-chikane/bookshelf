<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<link href="Component/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="Component/userProfile.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>
	<c:if test="${empty obj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="Component/navbar.jsp"%>
	<div class="ui-bg-cover ui-bg-overlay-container text-white "
		style="background-color: #c9c9bd;">
		<div class="ui-bg-overlay opacity-10 "></div>
		<div class="container ">
			<div class="text-center py-5">
				<img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt=""
					class="ui-w-100 rounded-circle">

				<div class="col-md-8 col-lg-6 col-xl-5 p-0 mx-auto">
					<c:if test="${not empty obj }">
						<h4 class="font-weight-bold my-4 text-dark">${obj.name }</h4>
					</c:if>


					<div class="opacity-75 mb-4 text-dark">Lorem ipsum dolor sit
						amet, nibh suavitate qualisque ut nam. Ad harum primis electram
						duo, porro principes ei has.</div>
				</div>

			</div>
		</div>

		<div class="ui-bg-overlay-container">
			<div class="ui-bg-overlay  opacity-25"></div>
			<ul
				class="nav nav-tabs tabs-alt justify-content-center border-transparent">
				<li class="nav-item"><a class="nav-link  py-4 text-dark "
					href="SellBook.jsp">Sell Old Book</a></li>

				<li class="nav-item"><a class="nav-link  py-4 text-dark"
					href="userOldBook.jsp">My Books</a></li>
				<li class="nav-item"><a class="nav-link  py-4 text-dark"
					href="viewOrder.jsp">View Orders</a></li>
				<li class="nav-item"><a class="nav-link py-4  text-dark"
					href="editProfile.jsp">Edit Profile</a></li>
				<li class="nav-item"><a class="nav-link py-4 text-dark"
					href="javascript:void(0)"></a></li>
			</ul>
		</div>
	</div>

</body>
</html>