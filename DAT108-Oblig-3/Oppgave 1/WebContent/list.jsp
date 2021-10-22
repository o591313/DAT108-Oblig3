<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat:400, 700)
	;

html {
	font-family: 'Montserrat', sans-serif;
}

body {
	background: #fff;
}

button, input {
	color: #5a5a5a;
}

input {
	line-height: normal;
}

.container {
	border: solid 3px #474544;
	max-width: 500px;
	margin: 60px auto;
	position: relative;
}

.add-form {
	padding: 37.5px;
	margin: 20px 0 0 0;
}

h3 {
	color: #474544;
	font-size: 24px;
	font-weight: 700;
	letter-spacing: 7px;
	text-align: center;
	text-transform: uppercase;
	margin-top: 50px;
}

input {
	background: none;
	border: none;
	border-bottom: solid 2px #474544;
	color: #474544;
	font-size: 1em;
	font-weight: 400;
	letter-spacing: 1px;
	margin: 0 0 1.875em 0;
	padding: 0 0 0.875em 0;
	width: 60%;
}

input:focus {
	outline: none;
	padding: 0 0 0.875em 0;
}

::-webkit-input-placeholder {
	color: #474544;
}

.submit {
	margin-top: 30px;
	display: flex;
	justify-content: center;
}

.add {
	background: none;
	border: solid 2px #474544;
	color: #474544;
	cursor: pointer;
	font-size: 0.875em;
	font-weight: bold;
	outline: none;
	padding: 10px 25px;
	margin-left: 20px;
	text-transform: uppercase;
	transition: all 0.3s;
}

.add:hover {
	background: #474544;
	color: #f2f3eb;
}

.remove {
	background: none;
	border: solid 2px #474544;
	color: #474544;
	cursor: pointer;
	font-size: 0.875em;
	font-weight: bold;
	outline: none;
	padding: 5px 15px;
	float: right;
	text-transform: uppercase;
	transition: all 0.3s;
	font-size: 13px;
}

.remove:hover {
	background: #474544;
	color: #f2f3eb;
}

ul li {
	list-style-type: none;
	font-size: 18px;
}

ul li form {
	padding: 10px;
}
</style>
<html>
<head>
<meta charset="UTF-8" />
<title>Handleliste</title>
</head>
<body>
	<div class="container">
		<h3>Handleliste</h3>
		<form class="add-form" action="list" method="post">
			<input type="text" name="item" />
			<button class="add" type="submit" name="item">Legg til</button>
		</form>
		<hr />
		<c:if test="${isListEmpty == true}">
			<p style="text-align: center">Du har ingen varer i handlelisten.</p>
		</c:if>
		<ul>
			<c:forEach items="${list.getItems()}" var="item">
				<li>
					<form action="list" method="post">
						<c:out value="${item}" />
						<button class="remove" type="submit" name="removeItem" value=${item}>Slett</button>
					</form>
				</li>
				<br />
			</c:forEach>

		</ul>
	</div>
</body>
</html>