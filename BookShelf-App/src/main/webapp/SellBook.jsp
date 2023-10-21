<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@include file="Component/allCss.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Component/register.css">
<meta charset="ISO-8859-1">
<title>Sell Old Book</title>

</head>
<body>
	<c:if test="${not empty msg }">
		<div id="toast">${msg }</div>

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
	<c:remove var="msg" scope="session"/>
	</c:if>

	<%@include file="Component/navbar.jsp"%>
	<c:if test="${empty obj }">
		<c:redirect url="login.jsp" />
	</c:if>



	<div class="outer-box">
		<div class="inner-box">
			<header class="signup-header">
				<h2>Sell Old Book</h2>
				<p>Welcome to our book-selling community! Your literary
					treasures have found a home here.</p>
			</header>


			<main class="signup-body">
				<form action="add_old_book" method="post"
					enctype="multipart/form-data">
					<input type="hidden" value="${obj.email }" name="email">
					<p>
						<label for="full name">Enter Book Name</label> <input type="text"
							name="name" required>

					</p>
					<p>
						<label for="author">Enter Author Name</label> <input type="text"
							name="author" required>

					</p>
					<p>
						<label for="price">Enter Price</label> <input type="number"
							name="price" required>

					</p>

					<p>

						<label for="photo">Upload Photo of Book</label><input type="file"
							id="form3Example1m" class="form-control form-control-lg"
							name="bimg" accept="image/png, image/jpeg" required /><label
							style="color: red"> * jpg , jpeg</label>
					</p>
					<p>

						<input type="submit" id="submit" value="Sell Book">

					</p>

				</form>
			</main>


		</div>
	</div>
</body>
</html>