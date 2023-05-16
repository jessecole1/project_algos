<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calorie Calculator</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="indexNav">
		<div class="leftNav">
			<h1><a class="homeLink" href="/">Exercise Page</a></h1>	
			<p><a href="/calorie/calculator">Calorie Calculator</a></p>
		</div>
		<div class="rightNav">
			<c:choose>
				<c:when test="${adId != null || userId != null}">
					<c:choose>
						<c:when test="${logUser.id != null}">
							<p>Hello, <span class="greeting"><c:out value="${logUser.username}"/></span></p>
						</c:when>
					</c:choose>
					<p> | </p>
					<a class="aLink" href="/exercise/new">Add an exercise</a>
					<c:choose>
					<c:when test="${logUser.id != null}">
					<p> | </p>					
					<p><a class="aLink" href="/account/user/${logUser.id}">My Account</a></p>
					</c:when>
					</c:choose>
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
		<div class="exerciseTitle">
			<h2 class="bodyTitle">Calorie Calculator</h2>
			<p style="color: white">Find your recommended daily caloric intake</p>		
		</div>
		<div>
			<form:form action="#" method="post">
				<table>
					<tbody>
						<tr>
							<td><form:label>Sex: </form:label></td>
							<td><form:checkbox value="male"/>
						</tr>
						<tr>
						
						</tr>
						<tr>
						
						</tr>
						<tr>
						
						</tr>
						<tr>
						
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>