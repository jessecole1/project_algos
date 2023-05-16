<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit <c:out value="${newExercise.exerciseName}"/></title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="indexNav">
		<h1><a class="homeLink" href="/">Exercise Page</a></h1>
		<div class="rightNav">
			<c:choose>
				<c:when test="${adId != null || user != null}">
					<c:choose>
						<c:when test="${logUser.id != null}">
							<p>Hello, <span class="greeting"><c:out value="${logUser.username}"/></span></p>
						</c:when>
					</c:choose>
					<p> | </p>
					<a class="aLink" href="/exercise/new">Add an exercise</a>
					<p> | </p>
					<p><a class="aLink" href="/my/user/account/${user.id}">My Account</a></p>
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
	<div>
		<form:form action="/exercise/${newExercise.id}/update" method="put" modelAttribute="newExercise">
		<form:input type="hidden" path="user" value="${user.id}"/>
			<table class="exerciseForm" style="width: 75%; height: 400px">
				<tbody>
					<tr>
						<td><form:label class="labelTitle" path="exerciseName">Exercise name: </form:label></td>
						<td><form:input class="newExerciseInput" path="exerciseName" type="text" value="${newExercise.exerciseName}"/></td>
					</tr>
					<tr>
						<td><form:errors path="exerciseName" class="errors"/></td>
					</tr>
					<tr>
						<td><form:label path="equipment"><span class="labelTitle">Equipment used: </span></form:label></td>
						<td><form:select class="newExerciseInput" path="equipment">
							<form:option value="Treadmill">Treadmill</form:option>
							<form:option value="Indoor rower">Indoor Rower</form:option>
							<form:option value="Ellyptical Trainer">Ellyptical Trainer</form:option>
							<form:option value="Stationary Bicycle">Stationary Bicycle</form:option>
							<form:option value="Resistance Band">Resistance Band</form:option>
							<form:option value="Dumbbell">Dumbbell</form:option>
							<form:option value="Kettlebell">Kettlebell</form:option>
							<form:option value="Barbell">Barbell</form:option>
							<form:option value="Bench">Bench</form:option>
							<form:option value="Medicine Ball">Medicine Ball</form:option>
						</form:select></td>
					</tr>
					<tr>
						<td><form:errors path="equipment" class="errors"/></td>
					</tr>
					<tr>
						<td><form:label class="labelTitle" path="difficulty">Difficulty Level (1-10): </form:label></td>
						<form:errors path="difficulty" class="errors"/>
						<td><form:input class="newExerciseInput" path="difficulty" type="number" value="${exercise.difficulty}"/></td>
					</tr>
					<tr>
						<td><form:errors path="difficulty" class="errors"/></td>
					</tr>
					<tr>
						<td><form:label class="labelTitle" path="categories">Categories</form:label></td>
						<td><form:select class="newExerciseInput catSelectInput" path="categories">
							<c:forEach var="category" items="${category}">
								<form:option value="${category.id}"><c:out value="${category.categoryName}"></c:out></form:option>
							</c:forEach>
						</form:select></td>
					</tr>
					<tr>
						<td><form:errors path="categories" class="errors"/></td>
					</tr>
					<tr>
						<td><button class="button">Update</button></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>
	<div>
		<form:form action="/exercise/${newExercise.id}/destroy" method="delete" modelAttribute="newExercise">
		<p><button class="deleteButton">Delete</button></p>
		</form:form>
	</div>
	<div>
		<p><form:errors path="categories" class="errors"/></p>
	</div>
</body>
</html>