<%@page import="com.mysql.cj.protocol.Message"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String sql = "select * from student";
	Connection Conn = DBConn.getMySqlConnection();
	Statement stmt = Conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next())
	{
		if(!id.equals(rs.getString(1)))
		{
%>
			<script>
			alert("아이디가 잘못되었습니다.");
			location.href  ="./login.jsp";
			</script>
<% 
		}
		if(id.equals(rs.getString(1)) && !passwd.equals(rs.getString(9)))
		{
%>
			<script>
			alert("비밀번호가 잘못되었습니다.");
			location.href  ="./login.jsp";
			</script>
<%
		}
		if(id.equals(rs.getString(1))&& passwd.equals(rs.getString(9)))
		{
			%>
			<script>
				alert("//");
				var frm = document.formm;
				frm.id_row.style.display="none";
				frm.pw_row.style.display="none";
				frm.logout_row.style.display="block";
			</script>
<%
		}
	}
%>