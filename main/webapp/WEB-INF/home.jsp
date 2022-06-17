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
<div class="container d-flex justify-content-between mx-auto mt-3">
<div class="header">
	<h1 class="text-primary">Welcome, ${user.userName}</h1>
	<p> Books from everyone's shelves.
</div>
<div class="header2 mt-2">
<a href="/logout">logout</a>
<p> <a href="/createBook"> + Add to my shelf!</a>
</div>
</div>
<p>
	<table class="table table-hover col-6">
		<th>Id</th>
		<th>Title</th>
		<th>Authors Name</th>
		<th>Posted by</th>
	<c:forEach var="book" items="${books}">
	<tr>
	<td>${book.id}</td>
	<td><a href="/book/${book.id}">${book.title}</a></td>
	<td>${book.author}</td>
	<td>${book.user.userName}</td>
	</tr>
	</c:forEach>
	</table>
	
</body>
</html>