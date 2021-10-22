<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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

form {
	padding: 37.5px;
	margin: 50px 0;
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
	text-transform: uppercase;
	width: 100%;
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

.submit input {
	background: none;
	border: solid 2px #474544;
	color: #474544;
	cursor: pointer;
	font-size: 0.875em;
	font-weight: bold;
	outline: none;
	padding: 20px 35px;
	text-transform: uppercase;
	transition: all 0.3s;
}

.submit input:hover {
	background: #474544;
	color: #f2f3eb;
}

.error-message {
	color: red;
	text-align: center;
	margin-top: 30px;
}
</style>
<html>
<head>
<meta charset="UTF-8" />
<title>Login</title>
</head>
<body>
	<div class="container">
		<h3>Login</h3>
		<c:if test="${unauthorizedAccess}">
			<p class="error-message">Du prøver å nå en side du ikke har tilgang til, eller så har
				token utløpt, vennligst logg inn på nytt.</p>
		</c:if>
		<c:if test="${invalidPassword}">
			<p class="error-message">Passordet du ga inn var feil. Prøv igjen.</p>
		</c:if>

		<form action="login" method="post">
			<input type="password" placeholder="Password" name="password"
				required />
			<div class="submit">
				<input type="submit" value="Login" />
			</div>
		</form>
	</div>
</body>
</html>