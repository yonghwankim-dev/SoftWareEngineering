<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.sql.*" %>
    <%@page import="db.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%

	Connection conn = DBConn.getMySqlConnection();
	out.println("db 연결 정보 : " + conn);
	Statement stmt = conn.createStatement();
	
	String sql = "select * from student";
	stmt.executeQuery(sql);
	
	ResultSet rs = null;
	
	rs = stmt.executeQuery(sql);
    out.println("<table border=\"1\">");
    
	if(rs.next())
	{
		do{
	        out.println("<tr>");
	        out.println("<td>"+rs.getString("stdno")+"</td>");
	        out.println("<td>"+rs.getString("name")+"</td>");
	        out.println("<td>"+rs.getString("personal_id")+"</td>");
	        out.println("<td>"+rs.getString("phone")+"</td>");
	        out.println("<td>"+rs.getString("grade")+"</td>");
	        out.println("<td>"+rs.getString("identity")+"</td>");
	        out.println("<td>"+rs.getString("birthdate")+"</td>");
	        out.println("<td>"+rs.getString("id")+"</td>");
	        out.println("<td>"+rs.getString("pwd")+"</td>");
	        
	        out.println("</tr>");
		}while(rs.next());
	}else{
		out.print("검색 결과가 없습니다.");
	}
%>

</body>
</html>