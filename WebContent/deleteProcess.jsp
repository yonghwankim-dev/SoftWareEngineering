<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
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
		alert("�л������� �Ϸ�Ǿ����ϴ�.");
		self.close();
		</script>
<%
	}else{
%>
		<script>
		alert("�л������� �����߽��ϴ�.");
		</script>
<%
	}	
%>
	
	
	%>
	<script>
	self.close();
	</script>
<% 
%>

    		
