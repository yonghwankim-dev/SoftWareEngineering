<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>

<title>login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="StyleSheetFolder/util.css">
<link rel="stylesheet" type="text/css"
	href="StyleSheetFolder/mainLogin.css">
<!--===============================================================================================-->
</head>
<body>
	<!-- test -->
	<!-- 메인화면겸 로그인화면 -->

	<div id="Main" class="login-page">
		<div class="form">
			<form name="formm" class="login-form" method="post" onsubmit="return false">
				<input type="text" id="id" name="id" placeholder="ID" /> <input
					type="password" id="passwd" name="passwd" placeholder="PASSWORD" />
				<button class="btn" onClick="go_login()">로그인</button>
				<p class="message">
					<button class="btn" onClick="go_SignUp()">회원가입</button>
				</p>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
</body>
</html>
