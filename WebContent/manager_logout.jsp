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
<link rel="icon" type="image/png"
	href="StyleSheetFolder/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="StyleSheetFolder/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="StyleSheetFolder/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="StyleSheetFolder/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="StyleSheetFolder/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="StyleSheetFolder/util.css">
<link rel="stylesheet" type="text/css"
	href="StyleSheetFolder/manager.css">

</head>
<body>
	<!-- 관리자 화면 -->

	<form name="formm" method="post">
		<div id="manager">

			<div class="buttoncontainer">
				<button class="btn" style=>조회</button>
				<button class="btn" onClick="popup_add();">등록</button>
				<button class="btn">수정</button>
				<button class="btn" onClick="go_delete()">삭제</button>
			</div>

			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table100">

							<table>
								<thead>
									<tr class="table100-head">
										<th class="column1">구분</th>
										<th class="column2">학번</th>
										<th class="column3">이름</th>
										<th class="column4">생년월일</th>
										<th class="column5">학과</th>
										<th class="column6">학년</th>
										<th class="column7">주민등록번호</th>
										<th class="column8">연락처</th>
									</tr>
								</thead>
								<%
									Connection conn = DBConn.getMySqlConnection();
									out.println("db 연결 정보 : " + conn);
									Statement stmt = conn.createStatement();
									String sql = "select * from student";
									stmt.executeQuery(sql);
									ResultSet rs = null;
									rs = stmt.executeQuery(sql);
									while (rs.next()) {
								%>
								<tbody>
									<tr>
										<td class="column1"><input type="checkbox"
											name="delete_check" value="<%=rs.getString("stdno")%>"></td>
										<td class="column2"><%=rs.getString("stdno")%></td>
										<td class="column3"><%=rs.getString("name")%></td>
										<td class="column4"><%=rs.getString("birthdate")%></td>
										<td class="column5"><%=rs.getString("major")%></td>
										<td class="column6"><%=rs.getString("grade")%></td>
										<td class="column7"><%=rs.getString("personal_id")%></td>
										<td class="column8"><%=rs.getString("phone")%></td>
									</tr>

									<%
										}
									%>

								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
</body>
</html>
