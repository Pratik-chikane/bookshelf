<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="Component/allCss.jsp"%>
<link href="Component/index.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<h1>user home</h1>
	<c:if test="${not empty obj }">
		<p>Name : ${obj.name }</p>
		<p>Password: ${obj.password }</p>
		<p>Password: ${obj.email }</p>
	</c:if>
</body>
</html>