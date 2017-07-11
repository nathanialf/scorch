<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.revature.bean.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Batch</title>
<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	
	<c:if test="${sessionScope.user == null}">
		<jsp:forward page="Login" />
	</c:if>

	<c:if test="${sessionScope.user.getRole().getName() == \"Associate\"}">
		<jsp:include page="review.jsp" />
	</c:if>
	
	
	<c:if
		test="${	sessionScope.user.getRole().getName() == \"Trainer\" || 
					sessionScope.user.getRole().getName() == \"Evaluator\" ||
					sessionScope.user.getRole().getName() == \"Manager\" }">

	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Revature</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">Page 1</a></li>
			<li><a href="#">Page 2</a></li>
			<li><a href="#">Page 3</a></li>
		</ul>
		<form:form method="GET" action="logout">
			<button type="submit" class="btn btn-default btn-sm"
				style="float: right; margin-top: 10px">
				<span class="glyphicon glyphicon-log-out"></span>&nbsp;Log-Out
			</button>
		</form:form>
	</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<h1>List of Batches</h1>

			<c:if test="${ sessionScope.user.getRole().getName() == \"Trainer\" }">
				<form:form method="POST">
					<input type="submit" value="Create Batch">
				</form:form>
			</c:if>

			<ul>
				<li>1</li>
				<li>2</li>
				<li>3</li>
			</ul>
		</div>
	</div>

	</c:if>

</body>
</html>