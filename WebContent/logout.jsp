<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
/*****************************************************************************************/


//����� ���� ����
//�̸��� ��ȣ�� ���ϸ� ���εǸ� true, ������ �ȵǸ� false�� ��ȯ�Ѵ�.

//�α��� ���ν� true, �ƴϸ� false
private boolean authorizeStatus = false;

//authorizeMembership(String trialUsername, String trialPassword)
//����� �̸��� ��ȣ�� ���Ͽ� �α��� ���� ���θ� �����ϴ� �����ƾ
//trialUsername : �α����� �õ��ϴ� ����� �̸�
//trialPassword : �α����� �õ��ϴ� ����ڰ� �Է��� ��ȣ
//�α��� �����ϸ� true�� ��ȯ�ϰ�, ���� �ź� �� false�� ��ȯ�Ѵ�.

private static boolean authorizeMembership(String trialUsername, String trialPassword)
{	
	try{
		String sql = "select * from student";
		Connection Conn = DBConn.getMySqlConnection();
		Statement stmt = Conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			if(rs.getString(1).equals(trialUsername) && rs.getString(9).equals(trialPassword))
			{
				return true;		
			}
		}
		
		sql = "select * from manager";
		rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			if(rs.getString(3).equals(trialUsername) && rs.getString(4).equals(trialPassword))
			{
				return true;		
			}
		}
		
	
		
	}catch(SQLException e)
	{
		System.out.println(e);
	}catch(Exception el)
	{
		System.out.println(el);
	}
	return false;	
}
%>

<%
/***********************************************************************************************/
//�� ������ ��� ����
//���ǿ� ��ϵ� ����� �̸� �� �Ϸθ� �о�ͼ� �α��� ��ȿ���� �����Ѵ�.
String trialUsername = null;
String trialPassword = null;
String membershipUsername = null;
String membershipPassword = null;
Cookie objectUsername = null;
Cookie objectPassword = null;
String Username=null;
String userIdentity=null;
authorizeStatus = false;

//POST ������� �Ѿ�� ������ �� trialUsername�̶�� �����Ͱ� �ִ��� Ȯ��
if(request.getParameter("id")!=null)
{
	trialUsername = request.getParameter("id");
	
	//trialUsername�� �����ϸ�, trialPassword��� �����͵� �ִ��� Ȯ��
	if(request.getParameter("passwd")!=null)
	{
		trialPassword = request.getParameter("passwd");
		
		//trialUsername�� trialPassword�� ��� ���ŵǸ�,
		//������ ������ authorizeMembership �����ƾ�� ȣ���Ͽ� �α��� ��û�Ѵ�.
		authorizeStatus = authorizeMembership(trialUsername, trialPassword);
		
	}
}


//�α��� ��û�� ���εǾ��ٸ�.
if(authorizeStatus)
{
	//membershipUsername�̶� �̸����� ���Ǻ����� ����� �̸��� ����Ѵ�.
	session.setAttribute("membershipUsername", trialUsername);
	//membershipPassword�̶� �̸����� ���Ǻ����� ����� ��ȣ�� ����Ѵ�.
	session.setAttribute("membershipPassword", trialPassword);
	
	try{
		String sql = "select * from student";
		Connection Conn = DBConn.getMySqlConnection();
		Statement stmt = Conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		boolean flag = false;
		while(rs.next() && flag==false)
		{
			if(rs.getString(1).equals(session.getAttribute("membershipUsername")))
			{
				Username = rs.getString(2);
				userIdentity = "S";
				flag = true;
			}
		}
		
		sql = "select * from manager";
		rs = stmt.executeQuery(sql);
		
		while(rs.next() && flag==false)
		{
			if(rs.getString(3).equals(trialUsername) && rs.getString(4).equals(trialPassword))
			{
				Username = rs.getString(1);
				userIdentity = "M";
				flag = true;
			}
		}
		
		
	}catch(SQLException e)
	{
		System.out.println(e);
	}catch(Exception el)
	{
		System.out.println(el);
	}
	
	
	//������ ��ȿ�Ⱓ�� ���� �������κ��� 12�ð��̴�. 60��*60*12 ->12�ð�
	session.setMaxInactiveInterval(12*60*60); 
}
%>    



    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>

<link rel="stylesheet" href="StyleSheetFolder/StyleSheet.css">


</head>
<body>
<script type="text/javascript" src="ScriptFolder/Script1.js"></script>

<!-- test -->
			<!-- ��ȭ�� -->
			<div class="tab">
				<button class="tablink" 
				onclick="openPage('Main', this, '#A9BCF5')"
				id="defaultOpen">����</button>
				<button id="std_btn" class="tablink"
					onclick="openPage('StudentInformation', this, '#A9BCF5')">�л�����</button>
				<button id="man_btn" class="tablink" onclick="openPage('manager', this, '#A9BCF5')">������</button>
			</div>
			
			<!-- ����ȭ��� �α���ȭ�� -->	
			<div id="Main" class="tabcontent">
				<form name="formm" method="post">
					<table>
						<tr>
							
							<td>
								<% 
									if(authorizeStatus)
									{
								%>
										<p>ȸ�� ���� ������</p>
										<p>ȯ���մϴ�. <%= Username %>��</p>
										<p><a href="./logoutProcess.jsp">�α׾ƿ�</a></p>
								<% } else { %>
										<p>�� �������� ������ �α����� �ʿ��մϴ�.</p>
										<p><a href="./login.jsp">�α���</a></p>
								<% } %>
							</td>
						</tr>
						
		
					</table>
				</form>
			</div>
			
			
			<!-- ������ ȭ�� -->

			<div id="manager" class="tabcontent">
			
			  <table>
					<tr>
						<td>
							<button class="button" style="width: 80px;">��ȸ</button>
						</td>
						<td>
							<button class="button" style="width: 80px;" onClick="popup_add()">���</button>
						</td>
						<td>
							<button class="button" style="width: 80px;">����</button>
						</td>
						<td>
							<button class="button" style="width: 80px;" onClick="go_delete()">����</button>
						</td>
						
					</tr>
				
				</table>
			
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
						
						<td><input type="checkbox" name="delete_check" value="1"></td>
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
			
			</div>	
			
			<script>
			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
			<% 
				if(userIdentity.equals("S"))
				{
				%>
				
					document.getElementById("man_btn").disabled=true;
				<%
				}else if(userIdentity.equals("M")){
					%>
				
					document.getElementById("std_btn").disabled=true;
					<%
				
				}

			%>
			</script>
</body>
</html>
