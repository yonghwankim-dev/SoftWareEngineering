<%@page import="db.*"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

		<%
		/***********************************************************************************************/
		//웹 페이지 헤더 영역
		//세션에 기록된 사용자 이름 및 암로를 읽어와서 로그인 유효성을 검증한다.
		
		String authorizeStatus = "";
		String userIdentity = "";
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		GUI gui = new GUI();
		
		authorizeStatus = gui.clickOnLoginButton(id, passwd,session);
		
		if(authorizeStatus==null)
		{
			%>
			<script>
			alert("회원정보가 일치하지 않습니다.");
			location.href = "login.jsp";
			</script>
			<%
		}
		
		//로그인 요청이 승인되었다면.
		else if(authorizeStatus.equals("S"))
		{
			//membershipUsername이라 이름붙인 세션변수에 사용자 이름을 기록한다.
			session.setAttribute("membershipUsername", id);
			//membershipPassword이라 이름붙인 세션변수에 사용자 암호를 기록한다.
			session.setAttribute("membershipPassword", passwd);
			//세션의 유효기간은 현재 시점으로부터 12시간이다. 60초*60*12 ->12시간
			session.setMaxInactiveInterval(12*60*60);
					%>
					
					<script>
					location.href="./student_logout.jsp";
					</script>
					 
					<%

		}
		else if(authorizeStatus.equals("M"))
		{
			
			//membershipUsername이라 이름붙인 세션변수에 사용자 이름을 기록한다.
			session.setAttribute("membershipUsername", id);
			//membershipPassword이라 이름붙인 세션변수에 사용자 암호를 기록한다.
			session.setAttribute("membershipPassword", passwd);
			//세션의 유효기간은 현재 시점으로부터 12시간이다. 60초*60*12 ->12시간
			session.setMaxInactiveInterval(12*60*60); 
					%>
					 
						<script>
						location.href="./manager_logout.jsp";
						</script>
						
					<%
			
		}
		%>    
	
	
