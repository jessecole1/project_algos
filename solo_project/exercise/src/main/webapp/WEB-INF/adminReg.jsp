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
</head>
<body>
	<div>
		<form:form action="/admin/login" method="post" modelAttribute="newAdminLogin">
			<table>
				<tbody>
					<tr>
						<td><form:label path="email">Email: </form:label></td>
						<td><form:input type="text" path="email"></form:input></td>
					</tr>
					<tr>
						<td><form:label path="password">Password: </form:label></td>
						<td><form:input path="password" type="text"/></td>
					</tr>
					<tr>
						<td><button>Login</button></td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>
	<div>
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
						<td><form:input path="password" type="text"/></td>
					</tr>
					<tr>
						<td><form:label path="confirm">Confirm password: </form:label></td>
						<td><form:input path="confirm" type="text"/></td>
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