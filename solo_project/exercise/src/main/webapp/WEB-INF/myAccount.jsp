<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Account</title>
</head>
<body>
	<div>
		
	</div>
		<div>
			<a href="/"><button>Home</button></a>
		</div>
	<div>
		<h2><c:out value="${user.username}"/>'s Account</h2>
		<div>
		<p><c:out value="${user.username}"/> posted some exercises: </p>
			<ul>
				<c:forEach var="exercise" items="${user.exercises}">
					<li><p><c:out value="${exercise.exerciseName}"/></p></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>