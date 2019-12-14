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

	
	
	for(int i=0;i<values.length;i++)
	{
		if(i+1==values.length)
		{
			values_list += values[i];
		}else{
			values_list += values[i] + ",";
		}
	}
	
	sql = "delete from student where stdno in("+values_list+")";
	System.out.println(sql);
	int message=0;
	try{
	    Connection Conn = DBConn.getMySqlConnection();
	    Statement stmt = Conn.createStatement();
	    
	    message = stmt.executeUpdate(sql);
		
	    stmt.close();
	    Conn.close();
	   
	}catch(SQLException e)
	{
		out.println(e);
	}catch(Exception e)
	{
		out.println(e);
	}
	
	if(message>0)
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

    		
