<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${category.categoryName}"/>'s Exercises</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="indexNav">
		<h1><a class="homeLink" href="/">Exercise Page</a></h1>
		<div class="rightNav">
			<c:choose>
				<c:when test="${admin != null || userId != null}">
					<a href="/exercise/new">Add an exercise</a>
					<p> | </p>
					<p><a href="/logout">Logout</a><p>
					<p>Hello, <c:out value="${logUser.username}"/></p>
				</c:when>
				<c:otherwise>
					<p><a href="/account">Login/Register</a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${adId != null}">
					<p><a href="/category/create">Create category</a></p>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div>
		<div class="exerciseTitle">
			<h2 class="bodyTitle"><c:out value="${category.categoryName}"/></h2>
			<p style="color: white">Find the perfect exercises for your workouts</p>		
		</div>
	</div>
	<div class="exercisePosts">
		<c:forEach var="exercise" items="${category.exercises}">
			<div class="exerciseSinglePost">
		<c:choose>
			<c:when test="${logUser.id == exercise.user.id}">
				<p><a href="/exercise/edit/${exercise.id}">Edit</a></p>
			</c:when>
		</c:choose>
				<p><span class="oneExerciseTitle"><c:out value="${exercise.exerciseName}"/></span> - <span class="exerciseAuth">posted by: <a href="/account/user/${exercise.user.id}"><c:out value="${exercise.user.username}"/></a></span></p>
				<p><span class="oneEquipment">Equipment used: </span><c:out value="${exercise.equipment}"/></p>
				<p><span class="oneDifficulty">Difficulty: </span><c:out value="${exercise.difficulty}"/></p>
			</div>
			<c:choose>
				<c:when test="${admin != null}">
					<div>
						<form:form action="/exercise/${exercise.id}/destroy" method="delete" modelAttribute="newExercise">
						<p><button class="deleteButton">Delete</button></p>
						</form:form>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>