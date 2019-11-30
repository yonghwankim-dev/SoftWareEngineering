<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>

<link rel="stylesheet" href="StyleSheetFolder/StyleSheet.css">


</head>
<body>
<!-- test -->
			<!-- 탭화면 -->
			<div class="tab">
				<button class="tablink" 
				onclick="openPage('Main', this, '#A9BCF5')"
				id="defaultOpen">메인</button>
				<button class="tablink"
					onclick="openPage('StudentInformation', this, '#A9BCF5')">학생정보</button>
				<button class="tablink" onclick="openPage('manager', this, '#A9BCF5')">관리자</button>
			</div>
		
			<!-- 메인화면겸 로그인화면 -->	
			<div id="Main" class="tabcontent">
				<form name="formm" method="post">
					<table>
						<tr id="id_row">
							<td style="text-align: center;">ID</td>
							<td><input type="text" name="id" maxlength="12"
								style="width: 140px;"></td>
							<td>
								<button class="button" style="width: 80px;" onClick="go_Check()">로그인</button>
							</td>
						</tr>
		
						<tr id="pw_row">
							<td style="text-align: center;">PASSWORD</td>
							<td><input type="password" name="passwd" maxlength="12"
								style="width: 140px;"></td>
							<td>
								<button class="button" style="width: 80px;" onClick="go_SignUp()">회원가입</button>
							</td>
						</tr>
						<tr id="logout_row" style="display:none">
							<td style="text-align: center;" colspan="2">학적관리시스템에 로그인 하셨습니다.</td>
							
							<td>
								<button class="button" style="width: 80px;" onClick="go_Check()">로그아웃</button>
							</td>
						</tr>
		
					</table>
				</form>
			</div>
			
			<!-- 학생정보 화면 -->
			<div id="StudentInformation" class="tabcontent">
				<form method="post" action="">
					<table>
						<tr>
							<td>이름:</td>
							<td style="width: 140px;"></td>
							<td><input type="text" name="name" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
		
						<tr>
							<td>학번:</td>
							<td></td>
							<td><input type="text" name="studentId" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>생년월일:</td>
							<td></td>
							<td><input type="text" name="birthDate" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>학과:</td>
							<td></td>
							<td><input type="text" name="divison" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>학년:</td>
							<td></td>
							<td><input type="text" name="grade" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>주민등록번호:</td>
							<td></td>
							<td><input type="text" name="personalId" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>연락처:</td>
							<td></td>
							<td><input type="text" name="address" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>
								<button class="button" style="width: 80px; float: right;"
									onclick="popup_change()">수정</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<!-- 관리자 화면 -->
			<div id="manager" class="tabcontent">
			  <table>
					<tr>
						<td>
							<button class="button" style="width: 80px;">조회</button>
						</td>
						<td>
							<button class="button" style="width: 80px;">등록</button>
						</td>
						<td>
							<button class="button" style="width: 80px;">수정</button>
						</td>
						<td>
							<button class="button" style="width: 80px;">삭제</button>
						</td>
						
					</tr>
				
				</table>
			
				<div class = "div">
					<table class = "a">
					<tr>
						<th>
							이름
						</th>
						<th>
							학번
						</th>
						<th>
							생년월일
						</th>
						<th>
							학과
						</th>
						<th>
							학년
						</th>
						<th>
							주민등록번호
						</th>
						<th>
							연락처
						</th>
					</tr>
				</table>
				</div>
			</div>
		
			<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
			<script>
			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
			</script>
</body>
</html>
