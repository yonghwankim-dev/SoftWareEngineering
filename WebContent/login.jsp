<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       
<%
/***********************************************************************************************/
//�� ������ ��� ����
//���ǿ� ��ϵ� ����� �̸� �� �Ϸθ� �о�ͼ� �α��� ��ȿ���� �����Ѵ�.
/*
String membershipUsername = null;
String membershipPassword = null;
authorizeStatus = false;

//�α��� ��ȿ�� �˻� : ���ǿ� ����� �α��� ������ �����Ѵ�.
//���� ���� �� membershipUsername�̶�� �����Ͱ� �ִ��� Ȯ��
if(session.getAttribute("membershipUsername")!=null)
{
	//membershipUsername�� �����ϸ�, membershipPassword��� �����͵� �ִ��� Ȯ��
	if(session.getAttribute("membershipPassword")!=null)
	{
		//���� �������� ���� ����� �̸��� ��ȣ�� �α��� ���°� ��ȿ���� ����
		membershipUsername = (String)session.getAttribute("membershipUsername");
		membershipPassword = (String)session.getAttribute("membershipPassword");
		
		//membershipUsername�� membershipPassword�� ��� ���ŵǸ�,
		//�ռ� ���ǵ� authorizeMembership �޼���� ���� ��û�Ѵ�.
		authorizeStatus = authorizeMembership(membershipUsername, membershipPassword);
	}
}
*/
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>


</head>
<body>
<!-- test -->
			<!-- ����ȭ��� �α���ȭ�� -->	
			<div id="Main" class="tabcontent">
				<form name="formm" method="post" onsubmit="return false">
				<p>
				<label><b>ID</b></label>
				<br>
				<input type="text" id="id" name="id"> 
				<br>
				</p>
				<p>
				<label><b>PASSWORD</b></label>
				<br>
				<input type="password" id="passwd" name="passwd">
				<br>
				</p>
				<button class="button" style="width:80px;" onClick="go_login()">�α���</button>
				<button class="button" style="width:80px;"  onClick="go_SignUp()">ȸ������</button>
				</form>
									
			</div>
			
			<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
</body>
</html>
