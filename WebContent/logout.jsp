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
		
		sql = "select * from manager";
		rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			if(rs.getString(3).equals(trialUsername) && rs.getString(4).equals(trialPassword))
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
String trialUsername = null;
String trialPassword = null;
String membershipUsername = null;
String membershipPassword = null;
Cookie objectUsername = null;
Cookie objectPassword = null;
String Username=null;
String userIdentity=null;
authorizeStatus = false;

//POST 방식으로 넘어온 데이터 중 trialUsername이라는 데이터가 있는지 확인
if(request.getParameter("id")!=null)
{
	trialUsername = request.getParameter("id");
	
	//trialUsername이 존재하면, trialPassword라는 데이터도 있는지 확인
	if(request.getParameter("passwd")!=null)
	{
		trialPassword = request.getParameter("passwd");
		
		//trialUsername과 trialPassword가 모두 수신되면,
		//위에서 선언한 authorizeMembership 서브루틴을 호출하여 로그인 요청한다.
		authorizeStatus = authorizeMembership(trialUsername, trialPassword);
		
	}
}


//로그인 요청이 승인되었다면.
if(authorizeStatus)
{
	//membershipUsername이라 이름붙인 세션변수에 사용자 이름을 기록한다.
	session.setAttribute("membershipUsername", trialUsername);
	//membershipPassword이라 이름붙인 세션변수에 사용자 암호를 기록한다.
	session.setAttribute("membershipPassword", trialPassword);
	
	try{
		String sql = "select * from student";
		Connection Conn = DBConn.getMySqlConnection();
		Statement stmt = Conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		boolean flag = false;
		while(rs.next() && flag==false)
		{
			if(rs.getString(1).equals(session.getAttribute("membershipUsername")))
			{
				Username = rs.getString(2);
				userIdentity = "S";
				flag = true;
			}
		}
		
		sql = "select * from manager";
		rs = stmt.executeQuery(sql);
		
		while(rs.next() && flag==false)
		{
			if(rs.getString(3).equals(trialUsername) && rs.getString(4).equals(trialPassword))
			{
				Username = rs.getString(1);
				userIdentity = "M";
				flag = true;
			}
		}
		
		
	}catch(SQLException e)
	{
		System.out.println(e);
	}catch(Exception el)
	{
		System.out.println(el);
	}
	
	
	//세션의 유효기간은 현재 시점으로부터 12시간이다. 60초*60*12 ->12시간
	session.setMaxInactiveInterval(12*60*60); 
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
<script type="text/javascript" src="ScriptFolder/Script1.js"></script>

<!-- test -->
			<!-- 탭화면 -->
			<div class="tab">
				<button class="tablink" 
				onclick="openPage('Main', this, '#A9BCF5')"
				id="defaultOpen">메인</button>
				<button id="std_btn" class="tablink"
					onclick="openPage('StudentInformation', this, '#A9BCF5')">학생정보</button>
				<button id="man_btn" class="tablink" onclick="openPage('manager', this, '#A9BCF5')">관리자</button>
			</div>
			
			<!-- 메인화면겸 로그인화면 -->	
			<div id="Main" class="tabcontent">
				<form name="formm" method="post">
					<table>
						<tr>
							
							<td>
								<% 
									if(authorizeStatus)
									{
								%>
										<p>회원 전용 페이지</p>
										<p>환영합니다. <%= Username %>님</p>
										<p><a href="./logoutProcess.jsp">로그아웃</a></p>
								<% } else { %>
										<p>이 페이지를 보려면 로그인이 필요합니다.</p>
										<p><a href="./login.jsp">로그인</a></p>
								<% } %>
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
							<button class="button" style="width: 80px;" onClick="popup_add()">등록</button>
						</td>
						<td>
							<button class="button" style="width: 80px;">수정</button>
						</td>
						<td>
							<button class="button" style="width: 80px;" onClick="go_delete()">삭제</button>
						</td>
						
					</tr>
				
				</table>
			
				<div class = "div">
				
					<table class="a">
					<tr>
						<th>구분</th>
						<th>학번</th>
						<th>이름</th>
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
							int i=0;
							while (rs.next()) {
					%>
					
					<tr style="text-align: center">
						
						<td><input type="checkbox" name="delete_check" value="1"></td>
						<td><%=rs.getString("stdno")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("birthdate")%></td>
						<td><%=rs.getString("major")%></td>
						<td><%=rs.getString("grade")%></td>
						<td><%=rs.getString("personal_id")%></td>
						<td><%=rs.getString("phone")%></td>
						
					</tr>
					
					<%		
							i++;
							}
					%>
					</table>
				</div>
			
			</div>	
			
			<script>
			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
			<% 
				if(userIdentity.equals("S"))
				{
				%>
				
					document.getElementById("man_btn").disabled=true;
				<%
				}else if(userIdentity.equals("M")){
					%>
				
					document.getElementById("std_btn").disabled=true;
					<%
				
				}

			%>
			</script>
</body>
</html>
