<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="StyleSheetFolder/StyleSheet.css">
<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
</head>

<body>
	<form name="formm" method="post" onsubmit="return false">
			<div class = "div">
				
					<table class="a">
					<tr>
						<th>����</th>
						<th>�й�</th>
						<th>�̸�</th>
						<th>�������</th>
						<th>�а�</th>
						<th>�г�</th>
						<th>�ֹε�Ϲ�ȣ</th>
						<th>����ó</th>
					</tr>
					<%
							Connection conn = DBConn.getMySqlConnection();
							out.println("db ���� ���� : " + conn);
							Statement stmt = conn.createStatement();
		
							String sql = "select * from student";
							stmt.executeQuery(sql);
		
							ResultSet rs = null;
		
							rs = stmt.executeQuery(sql);
							int i=0;
							while (rs.next()) {
					%>
					
					<tr style="text-align: center">
						
						<td><input type="checkbox" name="delete_check" value="<%= rs.getString("stdno") %>"></td>
						<td><%=rs.getString("stdno")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("birthdate")%></td>
						<td><%=rs.getString("major")%></td>
						<td><%=rs.getString("grade")%></td>
						<td><%=rs.getString("personal_id")%></td>
						<td><%=rs.getString("phone")%></td>
						
					</tr>
					
					<%		
							i++;
							}
					%>
					</table>
			</div>
			<button class="button" style="width:80px; float:right;" onClick="go_deleteProcess()">����</button>
	</form>
</body>
</html>