<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercise Page</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="indexNav">
		<div class="leftNav">
			<h1><a class="homeLink" href="/">Exercise Page</a></h1>
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
			<h2 class="bodyTitle">Exercises</h2>
			<p style="color: white">Find the perfect exercises for your workouts</p>		
		</div>
		<div class="exercises">
			<table style="width: 100%">
				<tbody>
					<c:forEach var="cat" items="${categories}" varStatus="status">
						<c:if test="${status.index % 3 == 0}">
							<tr class="catRow">
						</c:if>
						<td>
							<div class="indexBoxes catTd">
								<div class="topBox">
									<div class="innerTop">
								
									</div>
								</div>
							<div class="bottomBox">
								<p class="catText"><a class="catLinks catLinksLink" href="/exercise/all/${cat.id}"><c:out value="${cat.categoryName}"/></a></p>
							</div>
						</div>
						</td>
						<c:if test="${status.index % 3 == 2}">
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<%-- 			<div class="indexBoxes">
				<div class="topBox">
					<div class="innerTop">
					
					</div>
				</div>
				<div class="bottomBox">
					<p class="catText"><c:out value="${cat.categoryName}"/></p>
				</div>
			</div> --%>
<!--  			<div class="indexBoxes">
				<div class="topBox">
					<div class="innerTop">
					
					</div>
				</div>
				<div class="bottomBox">
				
				</div>
			</div>
			<div class="indexBoxes">
				<div class="topBox">
					<div class="innerTop">
					
					</div>
				</div>
				<div class="bottomBox">
				
				</div>
			</div>  -->

</body>
</html>