<%@page import="db.*"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	GUI gui = new GUI();

	boolean result = gui.clickOnLogOutButton(session,response);
	if(result==true)
	{
		%>
		<script>
		alert("로그아웃 되었습니다.");
		</script>
		<%
	}
	
	
%>