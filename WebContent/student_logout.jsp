<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="form-v5-content">
			<form name="formm" class="form-detail" method="post">
				<h2>학생 정보</h2>
				<div class="form-row">
					<label for="name">이름</label> <input type="text" name="name"
						id="name" readonly="readonly">
				</div>
				<div class="form-row">
					<label for="studentId">학번</label> <input type="text"
						name="studentId" id="studentId" readonly="readonly">
				</div>
				<div class="form-row">
					<label for="birthDate">생년월일</label> <input type="text"
						name="birthDate" id="birthDate" readonly="readonly">
				</div>
				<div class="form-row">
					<label for="divison">학과</label> <input type="text"
						name="divison" id="divison" readonly="readonly">
				</div>
				<div class="form-row">
					<label for="grade">학년</label> <input type="text"
						name="grade" id="grade" readonly="readonly">
				</div>
				<div class="form-row">
					<label for="personalId">주민등록번호</label> <input type="text"
						name="personalId" id="personalId" readonly="readonly">
				</div>
				<div class="form-row">
					<label for="address">연락처</label> <input type="text"
						name="address" id="address" readonly="readonly">
				</div>
				<div class="form-row-last">
					<input type="submit" name="register" class="register" value="수정" onclick="popup_change()">
					<input type="button" name="logout" class="register" value="로그아웃" onclick="go_logout()">
				</div>
			</form>
		</div>
	</div>
		<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>