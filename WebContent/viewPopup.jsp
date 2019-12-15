<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.*"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Information</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/roboto-font.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-5/css/fontawesome-all.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="StyleSheetFolder/util.css">
<link rel="stylesheet" href="StyleSheetFolder/studentInfo.css" />
<!--===============================================================================================-->
</head>

<body class="form-v5">
	<!-- 학생정보 화면 -->
	<div class="page-content">
		<div class="form-v5-content" style="margin-top: 10px; margin-bottom: 10px;" >
			<form name="formm" class="form-detail" method="post">
				<h2>학생정보 조회</h2>
				<div class="form-row">
					<label for="name">이름</label> <input type="text" name="name"
						id="name">
				</div>
				<div class="form-row">
					<label for="id">학번</label> <input type="text"
						name="id" id="id">
				</div>
				<div class="form-row">
					<label for="birthdate">생년월일</label> <input type="text"
						name="birthdate_start" id="birthDate1">
						<input type="text"
						name="birthdate_end" id="birthDate2">
				</div>
				<div class="form-row">
					<label for="major">학과</label> <input type="text"
						name="major" id="major">
				</div>
				<div class="form-row">
					<label for="grade">학년</label> <input type="text"
						name="grade" id="grade">
				</div>
				<div class="form-row">
					<label for="personal_id">주민등록번호</label> <input type="text"
						name="personal_id" id="personal_id">
				</div>
				<div class="form-row">
					<label for="phone">연락처</label> <input type="text"
						name="phone" id="phone">
				</div>
				<div class="form-row-last">
					<input type="button" name="register" class="register" value="조회" onclick="go_search()">
				</div>
			</form>
		</div>
	</div>
		<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>