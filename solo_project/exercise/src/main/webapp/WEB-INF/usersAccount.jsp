<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${accountUser.username}"/>'s Account</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="indexNav">
		<h1><a class="homeLink" href="/">Exercise Page</a></h1>
		<div class="rightNav">
			<c:choose>
				<c:when test="${adId != null || userId != null}">
					<c:choose>
						<c:when test="${logUser.id != null}">
							<p>Hello, <span class="greeting"><c:out value="${logUser.username}"/></span></p>
						</c:when>
					</c:choose>
					<a class="aLink" href="/exercise/new">Add an exercise</a>
					<p> | </p>
					<p><a class="aLink" href="/logout">Logout</a><p>
				</c:when>
				<c:otherwise>
					<p><a class="aLink" href="/account">Login/Register</a>
				</c:otherwise>
			</c:choose>
			<c:choose>
			<c:when test="${adId != null}">
				<p><a href="/category/create">Create category</a></p>
			</c:when>
		</c:choose>
		</div>
	</div>
	<div class="userAccountInfo">
		<c:choose>
			<c:when test="${user.id == accountUser.id}">
				<h2 class="greeting greetingTwo">Your Account</h2>
			</c:when>
			<c:otherwise>
		<h2 class="greeting greetingTwo"><c:out value="${accountUser.username}"/>'s Account</h2>	
			</c:otherwise>
		</c:choose>
		<div>
		<p class="accountInfo"><c:out value="${accountUser.username}"/> posted some exercises: </p>
			<ul>
				<c:forEach var="exercise" items="${accountUser.exercises}">
					<li><p class="accountExerciseSinglePost"><c:out value="${exercise.exerciseName}"/>
						<c:choose>
							<c:when test="${user.id == accountUser.id}">
								<a class="editLinkAccountPage" href="/exercise/edit/${exercise.id}"><button class="accountEditButton">Edit</button></a>
							</c:when>
						</c:choose>
					</p></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>