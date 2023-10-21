<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.ebook.db.DbConnect"%>
<%@ page import="com.ebook.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>
<%@include file="Component/allCss.jsp"%>
<!DOCTYPE html>
<html>

<head>
<%@include file="Component/allCss.jsp"%>
<link href="Component/cart.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Carts</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<%
		User u = (User) session.getAttribute("obj");
	%>
	<c:if test="${empty obj }">
		<c:redirect url="login.jsp" />
	</c:if>

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
			<c:remove var="msg" scope="session" />
	</c:if>


	<div class=" container-fluid my-5 ">
		<div class="row justify-content-center ">
			<div class="col-xl-10">
				<div class="card shadow-lg ">
					<div class="row p-2 mt-3 justify-content-between mx-sm-2">
						<div class="col">
							<p class="text-muted space mb-0 shop">BookShelf</p>
							<p class="text-muted space mb-0 shop">Store Locator</p>
						</div>
						<div class="col">
							<div class="row justify-content-start ">
								<div class="col">
									<img class="irc_mi img-fluid cursor-pointer "
										src="https://i.imgur.com/jFQo2lD.png" width="70" height="70">
								</div>
							</div>
						</div>

					</div>

					<div class="row justify-content-around">
						<div class="col-md-5">
							<div class="card border-0">
								<div class="card-header pb-0">
									<h2 class="card-title space ">Checkout</h2>
									<p class="card-text text-muted mt-4  space">SHIPPING
										DETAILS</p>
									<hr class="my-0">
								</div>
								<form method="post" action="order">

									<input type="hidden" value="${obj.id }" name="id">
									<div class="form-group">
										<label for="NAME" class="small text-muted mb-1">NAME </label>
										<input type="text" class="form-control form-control-sm"
											name="name" value="<%=u.getName()%>">
									</div>
									<div class="form-group">
										<label for="email" class="small text-muted mb-1">Email</label>
										<input type="text" class="form-control form-control-sm"
											name="email" value="<%=u.getEmail()%>" readonly="readonly">
									</div>
									<div class="row no-gutters">
										<div class="col-sm-6 pr-sm-2">
											<div class="form-group">
												<label for="phno" class="small text-muted mb-1">Moblie
													Number</label> <input type="text"
													class="form-control form-control-sm" name="phno"
													value="<%=u.getPhno()%>">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="address" class="small text-muted mb-1">Address
												</label> <input type="text" class="form-control form-control-sm"
													name="address" required>
											</div>
										</div>
									</div>
									<div class="row no-gutters">
										<div class="col-sm-6 pr-sm-2">
											<div class="form-group">
												<label for="landmark" class="small text-muted mb-1">LandMark</label>
												<input type="text" class="form-control form-control-sm"
													name="landmark" placeholder="Near Ganesh Temple" required>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="city" class="small text-muted mb-1">City</label>
												<input type="text" class="form-control form-control-sm"
													name="city" placeholder="pune" required>
											</div>
										</div>
									</div>
									<div class="row no-gutters">
										<div class="col-sm-6 pr-sm-2">
											<div class="form-group">
												<label for="state" class="small text-muted mb-1">State</label>
												<input type="text" class="form-control form-control-sm"
													name="state" placeholder="maharashtra" required>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="pincode" class="small text-muted mb-1">Pincode</label>
												<input type="text" class="form-control form-control-sm"
													name="pincode" placeholder="411001" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="payment" class="small text-muted mb-1">Payment
											Mode</label> <input type="text" class="form-control form-control-sm"
											name="payment" value="COD" placeholder="Cash On Delivery"
											readonly="readonly">
									</div>
									<div
										class="row mb-md-5 mt-5  justify-content-center align-items-center">
										<div class="col">
											<button class="btn btn-warning text-white btn-lg">place
												Order</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-5">
							<div class="card border-0 ">
								<div class="card-header card-2">
									<p class="card-text text-muted mt-md-4  mb-2 space">
										YOUR ORDER <span class=" small text-muted ml-2 cursor-pointer">EDIT
											SHOPPING BAG</span>
									</p>
									<hr class="my-2">
								</div>
								<div class="card-body pt-0">

									<%
										CartDAOImpl dao = new CartDAOImpl(DbConnect.getConn());
									List<Cart> cart = dao.getBookByUser(u.getId());
									BookDAOImpl dao1 = new BookDAOImpl(DbConnect.getConn());
									Double totalPrice = 0.0;
									for (Cart c : cart) {
										totalPrice = c.getTotalprice();
										int bid = c.getBid();

										BookDtls b = dao1.getBookById(bid);
									%>
									<div class="row  justify-content-between">
										<div class="col-auto col-md-7">
											<div class="media flex-column flex-sm-row">
												<img class=" img-fluid " src="img/<%=b.getPhotoName()%>"
													width="50">
												<div class="media-body  my-auto">
													<div class="row ">
														<div class="col">
															<p class="mb-0">
																<b><%=c.getBookName()%></b>
															</p>
															<small class="text-muted"><%=c.getAuthor()%></small>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="pl-0 flex-sm-col col-auto  my-auto">
											<a
												href="removeBook?bid=<%=c.getBid()%>&uid=<%=c.getUid()%>&cid=<%=c.getCid()%>"
												class="btn btn-sm btn-danger">Remove</a>
										</div>
										<div class="pl-0 flex-sm-col col-auto my-auto">
											<p>
												<b><%=c.getPrice()%></b>
											</p>
										</div>
									</div>
									<hr class="my-2">
									<%
										}
									%>



									<div class="row ">
										<div class="col">

											<div class="row justify-content-between">
												<div class="col">
													<p class="mb-1">
														<b>Shipping</b>
													</p>
												</div>
												<div class="flex-sm-col col-auto">
													<p class="mb-1">
														<b>0 Rs</b>
													</p>
												</div>
											</div>
											<div class="row justify-content-between">
												<div class="col-4">
													<p>
														<b>Total</b>
													</p>
												</div>
												<div class="flex-sm-col col-auto">
													<p class="mb-1">
														<b><%=totalPrice%>Rs</b>
													</p>
												</div>
											</div>
											<hr class="my-0">
										</div>
									</div>
									<div class="row mb-5 mt-4 ">
										<div class="col-md-7 col-lg-6 mx-auto">
											<a href="index.jsp" type="button"
												class="btn btn-secondary btn-lg">Contiue Shopping</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>