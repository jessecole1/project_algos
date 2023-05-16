<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register as Admin</title>
<link rel="stylesheet" tyle="text/css" href="/css/style.css">
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
					<p> | </p>
					<a class="aLink" href="/exercise/new">Add an exercise</a>
					<p> | </p>
					<p><a class="aLink" href="/account/user/${logUser.id}">My Account</a></p>
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
	<div class="adminLogin">
	<h2>Login</h2>
		<form:form action="/admin/login" method="post" modelAttribute="newLogin">
			<table>
				<tbody>
					<tr>
						<td><form:label path="email">Email: </form:label></td>
						<td><form:errors path="email" class="errors"/></td>
						<td><form:input type="text" path="email"></form:input></td>
					</tr>
					<tr>
						<td><form:label path="password">Password: </form:label></td>
						<td><form:errors path="password" class="errors"/></td>
						<td><form:input path="password" type="password"/></td>
					</tr>
					<tr>
						<td><button>Login</button></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>
	<div class="adminLogin">
	<h2>Register</h2>
		<form:form action="/admin/register" method="post" modelAttribute="admin">
			<table>
				<tbody>
					<tr>
						<td><form:label path="email">Email: </form:label></td>
						<td><form:input path="email" type="text"/></td>
					</tr>
					<tr>
						<td><form:label path="username">Username: </form:label></td>
						<td><form:input path="username" type="text"/></td>
					</tr>
					<tr>
						<td><form:label path="password">Password: </form:label></td>
						<td><form:input path="password" type="password"/></td>
					</tr>
					<tr>
						<td><form:label path="confirm">Confirm password: </form:label></td>
						<td><form:input path="confirm" type="password"/></td>
					</tr>
					<tr>
						<td><button>Create account</button></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>
	
</body>
</html>