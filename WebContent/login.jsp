<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<%!
/*****************************************************************************************/
//사용자 인증 로직
//이름과 암호를 비교하며 승인되면 true, 승인이 안되면 false를 반환한다.
//로그인 승인시 true, 아니면 false
private boolean authorizeStatus = false;
private static String ident="";
//authorizeMembership(String trialUsername, String trialPassword)
//사용자 이름과 암호를 비교하여 로그인 승인 여부를 결정하는 서브루틴
//trialUsername : 로그인을 시도하는 사용자 이름
//trialPassword : 로그인을 시도하는 사용자가 입력한 암호
//로그인 승인하면 true를 반환하고, 승인 거부 시 false를 반환한다.
private static boolean authorizeMembership(String trialUsername, String trialPassword)
{	
	try{
		String sql = "select *, aes_decrypt(unhex(pwd),'"+trialUsername+"') from student";
		Connection Conn = DBConn.getMySqlConnection();
		Statement stmt = Conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			if(rs.getString(1).equals(trialUsername) && rs.getString(10).equals(trialPassword))
			{
				ident = "S";
				return true;		
			}
		}
		
		sql = "select *, aes_decrypt(unhex(pwd),'"+trialUsername+"') from manager";
		rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			if(rs.getString(3).equals(trialUsername) && rs.getString(6).equals(trialPassword))
			{
				ident="M";
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
Cookie objectUsername = null;
Cookie objectPassword = null;
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

//로그인 요청이 승인되었다면.
if(authorizeStatus)
{
	//membershipUsername이라 이름붙인 세션변수에 사용자 이름을 기록한다.
	session.setAttribute("membershipUsername", membershipUsername);
	//membershipPassword이라 이름붙인 세션변수에 사용자 암호를 기록한다.
	session.setAttribute("membershipPassword", membershipPassword);

	//세션의 유효기간은 현재 시점으로부터 12시간이다. 60초*60*12 ->12시간
	session.setMaxInactiveInterval(12*60*60);
}
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
<!--===============================================================================================-->
</head>
<body>
	<!-- test -->
	<!-- 메인화면겸 로그인화면 -->
	<%
		if((authorizeStatus==true) && (ident.equals("S")))
		{
			%>
			<script>
				location.href = "student_logout.jsp";
			</script>
			<% 
		}else if((authorizeStatus==true) && (ident.equals("M"))){
			%>
			<script>
			location.href = "manager_logout.jsp";
			</script>
	<%
		}
		
	%>
	
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

