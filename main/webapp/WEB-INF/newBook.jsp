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
<title>New Book</title>
</head>
<body>
<h1>Add a Book to Your Shelf!</h1> <a href="/home">Back to the shelves</a>
<p>
	<form:form method="post" action="/book/create" modelAttribute="book">
	<form:label path="title">Title:</form:label>
	<form:errors path="title"/>
	<form:input path="title"/>
	<p>
	<form:label path="author">Author:</form:label>
	<form:errors path="author"/>
	<form:input path="author"/>
	<p>
	<form:label path="thoughts">Thoughts:</form:label>
	<form:errors path="thoughts"/>
	<form:textarea path="thoughts"/>
	<p>
	<form:errors path="user"/>
	<form:input type="hidden" path="user" value="${user.id}"/>
	<p>
	<button>Add book!</button>
	</form:form>
</body>
</html>