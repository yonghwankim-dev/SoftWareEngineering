<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.*"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	GUI gui = new GUI();
	boolean result = gui.clickOnSignUpButton(request);
	
	if(result==true)
	{
	%>
		<script>
		alert("회원가입이 완료되었습니다.");
		self.close();
		</script>
<%
	}else{
%>
		<script>
		alert("회원가입이 실패하였습니다.");
		location.href = "SignUp.jsp";
		</script>
<%
	}	
%>