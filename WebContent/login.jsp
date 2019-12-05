<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%!
/*****************************************************************************************/


//사용자 인증 로직
//이름과 암호를 비교하며 승인되면 true, 승인이 안되면 false를 반환한다.

//로그인 승인시 true, 아니면 false
private boolean authorizeStatus = false;

//authorizeMembership(String trialUsername, String trialPassword)
//사용자 이름과 암호를 비교하여 로그인 승인 여부를 결정하는 서브루틴
//trialUsername : 로그인을 시도하는 사용자 이름
//trialPassword : 로그인을 시도하는 사용자가 입력한 암호
//로그인 승인하면 true를 반환하고, 승인 거부 시 false를 반환한다.

private static boolean authorizeMembership(String trialUsername, String trialPassword)
{	
	try{
		String sql = "select * from student";
		Connection Conn = DBConn.getMySqlConnection();
		Statement stmt = Conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			if(rs.getString(1).equals(trialUsername) && rs.getString(9).equals(trialPassword))
			{
				return true;		
			}
		}
		
	}catch(SQLException e)
	{
		System.out.println(e);
	}catch(Exception el)
	{
		System.out.println(el);
	}
	return false;	
}
%>
     
<%
/***********************************************************************************************/
//웹 페이지 헤더 영역
//세션에 기록된 사용자 이름 및 암로를 읽어와서 로그인 유효성을 검증한다.
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
%>    
    
    
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
				<button class="tablink" id="std_btn"
					onclick="openPage('StudentInformation', this, '#A9BCF5')" disabled>학생정보</button>
				<button id="man_btn" class="tablink" onclick="openPage('manager', this, '#A9BCF5')" disabled>관리자</button>
			</div>
		
			<!-- 메인화면겸 로그인화면 -->	
			<div id="Main" class="tabcontent">
				<form name="formm" method="post">
				<p>
				<label><b>ID</b></label>
				<br>
				<input type="text" id="id" name="id"> 
				<br>
				</p>
				<p>
				<label><b>PASSWORD</b></label>
				<br>
				<input type="password" id="passwd" name="passwd">
				<br>
				</p>
				<button class="button" style="width:80px;" onClick="go_login()">로그인</button>
				<button class="button" style="width:80px;"  onClick="go_SignUp()">회원가입</button>
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
						<table class="a">
							<tr>
								<th>구분</th>
								<th>이름</th>
								<th>학번</th>
								<th>생년월일</th>
								<th>학과</th>
								<th>학년</th>
								<th>주민등록번호</th>
								<th>연락처</th>
							</tr>
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
							<tr style="text-align: center">
								<td><input type="checkbox" name="deleteCheck" value="deleteCheck"></td>
								<td><%=rs.getString("stdno")%></td>
								<td><%=rs.getString("name")%></td>
								<td><%=rs.getString("birthdate")%></td>
								<td><%=rs.getString("major")%></td>
								<td><%=rs.getString("grade")%></td>
								<td><%=rs.getString("personal_id")%></td>
								<td><%=rs.getString("phone")%></td>
							</tr>
							<%
								}
							%>
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
