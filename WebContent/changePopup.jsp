<%@page import="java.awt.Window"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
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


	<%
			String stdno = request.getParameter("delete_check");
			
			Connection conn = DBConn.getMySqlConnection();
			Statement stmt = conn.createStatement();
			String sql = "select * from student where stdno="+stdno;
			
			ResultSet rs = stmt.executeQuery(sql);

			Student student=null;
			while(rs.next())
			{
				student = new Student(
						rs.getString("name"),
						rs.getString("stdno"),
						rs.getString("birthdate"),
						rs.getString("major"),
						rs.getString("grade"),
						rs.getString("personal_id"),
						rs.getString("phone"),
						"S",
						rs.getString("pwd"));
			}
			if(student==null)
			{
				student = new Student("","","","","","","","","");
			}
	%>
</head>

<body class="form-v5">

	<!-- 학생정보 화면 -->
	<div class="page-content">
		<div class="form-v5-content"  style="margin-top: 10px; margin-bottom: 10px;">
			<form name="formm" class="form-detail" method="post" onsubmit="return false">
				<h2>학생정보 수정창</h2>
				<div class="form-row">
					<label for="name">이름</label> <input type="text" name="name"
						id="name" value="<%=student.getName() %>">
				</div>
				<div class="form-row">
					<label for="studentId">학번</label> <input type="text"
						name="id" id="studentId" readonly="readonly" value="<%=student.getId() %>">
				</div>
				<div class="form-row">
					<label for="birthDate">생년월일</label> <input type="text"
						name="birthdate" id="birthDate" readonly="readonly" value="<%=student.getBirthdate() %>">
				</div>
				<div class="form-row">
					<label for="divison">학과</label> <input type="text"
						name="major" id="divison" value="<%=student.getMajor() %>">
				</div>
				<div class="form-row">
					<label for="grade">학년</label> <input type="text"
						name="grade" id="grade" value="<%=student.getGrade() %>">
				</div>
				<div class="form-row">
					<label for="personalId">주민등록번호</label> <input type="text"
						name="personal_id" id="personalId" readonly="readonly" value="<%=student.getPersonal_id() %>">
				</div>
				<div class="form-row">
					<label for="address">연락처</label> <input type="text"
						name="phone" id="address" value="<%=student.getPhoneNumber() %>">
				</div>
				<div class="form-row-last">
					<input type="button" name="register" class="register" value="수정" onclick="go_change()">
				</div>
			</form>
		</div>
	</div>
	<%
		if(student.getId().equals(""))
		{
			%>
			<script>
			alert("학생을 선택해주세요.");
			self.close();
			</script>
			<%
		}
	%>
		<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>