<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	
	String name = request.getParameter("name");
	String birthdate = request.getParameter("birthdate");
	String major = request.getParameter("major");
	String grade = request.getParameter("grade");
	String phone = request.getParameter("phone");
	String personal_id = request.getParameter("personal_id");
	String passwd = request.getParameter("passwd");
	
	
	String sql;

	sql = "insert into student(name,major,personal_id,phone,grade,identity,birthdate,pwd)" +  
			"values('"+name+"','"+major+"','"+personal_id+"','"+phone+"','"+grade+"','S','"+birthdate+"','"+passwd+"')";

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
		alert("학생등록이 완료되었습니다.");
		self.close();
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