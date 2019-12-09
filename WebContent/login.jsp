<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	/***********************************************************************************************/
	//웹 페이지 헤더 영역
	//세션에 기록된 사용자 이름 및 암로를 읽어와서 로그인 유효성을 검증한다.
	/*
	String membershipUsername = null;
	String membershipPassword = null;
	authorizeStatus = false;
	
	//로그인 유효성 검사 : 세션에 저장된 로그인 정보를 검증한다.
	//세션 변수 중 membershipUsername이라는 데이터가 있는지 확인
	if(session.getAttribute("membershipUsername")!=null)
	{
		//membershipUsername이 존재하면, membershipPassword라는 데이터도 있는지 확인
		if(session.getAttribute("membershipPassword")!=null)
		{
			//세션 변수에서 얻은 사용자 이름과 암호로 로그인 상태가 유효한지 검증
			membershipUsername = (String)session.getAttribute("membershipUsername");
			membershipPassword = (String)session.getAttribute("membershipPassword");
			
			//membershipUsername과 membershipPassword가 모두 수신되면,
			//앞서 정의된 authorizeMembership 메서드로 고르인 요청한다.
			authorizeStatus = authorizeMembership(membershipUsername, membershipPassword);
		}
	}
	*/
%>


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
	<link rel="stylesheet" type="text/css"
	href="StyleSheetFolder/buttons.css">
<!--===============================================================================================-->
</head>
<body>
	<!-- test -->
	<!-- 메인화면겸 로그인화면 -->

	<div id="Main" class="login-page">
		<div class="form">
			<form class="login-form" method="post" onsubmit="return false">
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
