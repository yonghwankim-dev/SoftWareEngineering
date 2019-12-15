<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.*"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	GUI gui = new GUI();

	boolean result = gui.clickOnUpdateButton(request);
	
	if(result==true)
	{
		%>
		
		<script lang="javascript">
    		alert("수정이 완료되었습니다.");
    		window.opener.parent.location="student_logout.jsp";
    		window.close();
    	</script>
		<%
	}else{
		%>
		<script>
		alert("수정이 실패하였습니다.");
		self.close();
		</script>
		<%
	}
%>