<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.*"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	GUI gui = new GUI();
	boolean result = gui.clickOnInsertButton(request);
	
	if(result==true)
	{
%>
    	<form name="frm" method="post" action="manager_logout.jsp">
    		
    	</form>
    	<script lang="javascript">
    		alert("학생등록이 완료되었습니다.");
    		window.opener.document.formm.submit();
    		window.close();
    	</script>
<%
	}else{
%>
		<script>
		alert("학생등록이 실패했습니다.");
		</script>
<%
	}	
%>