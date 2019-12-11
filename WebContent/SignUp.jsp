<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>SignUP</title>
<link rel="stylesheet" href="StyleSheetFolder/StyleSheet.css">

</head>
<body>
	<form name="formm" method="post"">
	<table>
		<tr>
			<td>
				<input type="radio" name="identity" value="student" onClick="CheckAbledID()">�л�
			</td>
			
			<td>
				<input type="radio" name="identity" value="manager"  onClick="CheckAbledID()">������
			</td>
		</tr>
	</table>
		
	<div>&nbsp;</div>
	<table>
		<tr>
			<td style="text-align:justify;">
				�̸� : 
			</td>
			<td>
				<input type="text" name="name" maxlength="12" style="width: 140px;" disabled>
			</td>
			<td style="text-align:justify;">
							ID
			</td>	
			<td>
				<input type="text" name="id" maxlength="12" style="width: 140px;" disabled pattern="[0-9a-zA-Z]{20}">
			</td>
		</tr>
		
		<tr>
			<td style="text-align:justify;">
				������� :
			</td>
			<td>
				<input type="date" name="birthdate" maxlength="12" style="width: 140px;" disabled>
			</td>
			<td style="text-align:justify;">
				PASSWORD
			</td>
			<td>
				<input type="password" name="passwd" maxlength="12" style="width: 140px;" disabled pattern="[0-9a-zA-Z]{20}">
			</td>
		</tr>
		<tr>
			<td style="text-align:justify;">
				�а� :
			</td>
			<td>
				<select name="major" style="width:140px" disabled>
				  <option value="��ǻ�Ͱ��а�">��ǻ�Ͱ��а�</option>
				  <option value="������а�">������а�</option>
				  <option value="��������а�">��������а�</option>
				  <option value="�ɸ��а�">�ɸ��а�</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="text-align:justify;">
				�г� :
			</td>
			<td>
				<input type="number" name="grade" maxlength="12" style="width: 140px;" disabled>
			</td>
		</tr>
		<tr>
			<td style="text-align:justify;">
				�ֹε�Ϲ�ȣ :
			</td>
			<td>
				<input type = "text" name = "personal_id" pattern = "\d{6}\-\d{7}" title = "123456-1234567 �������� �Է����ּ���" disabled/>
			</td>
		</tr>
		<tr>
			<td style="text-align:justify;">
				����ó :
			</td>
			<td>
				<input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required disabled>
			</td>
		</tr>
	</table>
	<div>&nbsp;</div>
	<div style="text-align: right;">&nbsp;<button class="button" style="width: 80px;" onClick="go_SignUpProcess()">Ȯ��</button></div>
	
	</form>
	<script type="text/javascript" src="ScriptFolder/Script1.js"></script>
	
	
</body>
</html>