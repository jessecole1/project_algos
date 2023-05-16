<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create new category</title>
</head>
<body>
	<div>
		<a href="/"><button>Home</button></a>
	</div>
	<div>
		<form:form action="/category/create" method="post" modelAttribute="newCategory">
		<form:input type="hidden" path="admin" value="${adId.adminId}"/>
			<table>
				<tbody>
					<tr>
						<td><form:label path="categoryName">Muscle Category Name: </form:label></td>
						<td><form:input path="categoryName" type="text"/></td>
					</tr>
					<tr>
						<td><button>Create</button>
					</tr>
				</tbody>
			</table>
		</form:form>
	</div>
</body>
</html>