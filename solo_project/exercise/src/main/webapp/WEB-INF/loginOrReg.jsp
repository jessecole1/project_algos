<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="formCon">
		<div class="formConOne">
			<form:form style="height: 100%" class="registerTable" action="/register" method="post" modelAttribute="newUser">
				<table style="height: 100%">
					<tbody>
						<tr>
							<td><h3>Register</h3></td>
						</tr>
						<tr>
							<td><form:label path="username">Username: </form:label></td>
							<td><form:input type="text" path="username"></form:input></td>
						</tr>
						<tr>
							<td><form:errors path="username" class="errors"/><td>
						</tr>
						<tr>
							<td><form:label path="email">Email: </form:label></td>
							<td><form:input path="email" type="text"></form:input></td>
						</tr>
						<tr>
							<td><form:errors path="email" class="errors"/><td>
						</tr>
						<tr>
							<td><form:label path="password">Password: </form:label></td>
							<td><form:input path="password" type="text"/></td>
						</tr>
						<tr>
							<td><form:errors path="password" class="errors"/><td>
						</tr>
						<tr>
							<td><form:label path="confirm">Confirm: </form:label></td>
							<td><form:input path="confirm" type="text"/></td>
						</tr>
						<tr>
							<td><form:errors path="confirm" class="errors"/><td>
						</tr>
						<tr>
							<td><button>Register</button>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
		<div class="formConOne">
			<form:form style="height: 100%" action="/login" method="post" modelAttribute="newLogin">
				<table style="height: 100%">
					<tbody>
						<tr>
							<td><h3>Login</h3></td>
						</tr>
						<tr>
							<td><form:label path="email">Email: </form:label></td>
							<td><form:input type="text" path="email"/></td>
						</tr>
						<tr>
							<td><form:errors path="email" class="errors"/><td>
						</tr>
						<tr>
							<td><form:label path="password">Password: </form:label></td>
							<td><form:input path="password" type="text"/></td>
						</tr>
						<tr>
							<td><form:errors path="password" class="errors"/><td>
						</tr>
						<tr>
							<td><button>Login</button></td>
						</tr>
					</tbody>
				</table>
			</form:form>
			<a href="/admin/login">admin login</a>
		</div>
	</div>
</body>
</html>