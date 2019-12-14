<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.*"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	GUI gui = new GUI();
	String[] values = request.getParameterValues("delete_check");
	
	String values_list = "";
	String sql;

	boolean result = gui.clickOnDeleteButton(request);
	
	if(result==true)
	{
%>
		<script>
		alert("학생삭제가 완료되었습니다.");
		self.close();
		</script>
<%
	}else{
%>
		<script>
		alert("학생삭제가 실패했습니다.");
		</script>
<%
	}	
%>
	<script>
	location.href="manager_logout.jsp";
	</script>
<% 
%>

    		
