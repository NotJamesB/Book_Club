<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>reserve</title>
</head>
<body>
	<h1>Welcome!</h1>
	<p>Join our growing Community.</p>
	<div class="d-flex justify-content-around">
		<div class="register">
			<h3>Register</h3>
			<form:form method="post" action="/register" modelAttribute="newUser">
				<p>
					<form:label path="userName">User Name</form:label>
					<form:errors path="userName" />
					<form:input path="userName" />
				</p>
				<p>
					<form:label path="email">Email</form:label>
					<form:errors path="email" />
					<form:input path="email" />
				</p>
				<p>
					<form:label path="password">Password</form:label>
					<form:errors path="password" />
					<form:input path="password" />
				</p>
				<p>
					<form:label path="confirm">Confirm PW</form:label>
					<form:errors path="confirm" />
					<form:input path="confirm" />
				</p>
				<form:button>Register</form:button>
			</form:form>
		</div>
		<div class="login">
			<h3 class="text-primary">Login</h3>
			<form:form method="post" action="/login" modelAttribute="newLogin">
				<form:label path="email">Email</form:label>
				<form:errors path="email" />
				<form:input path="email" />
				<p>
					<form:label path="password">Password</form:label>
					<form:errors path="password" />
					<form:input path="password" />
					<form:button>Login</form:button>
			</form:form>
		</div>
	</div>
</body>
</html>