<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- �л����� ȭ�� -->
			<div>
				<form name="formm" method="post">
					<table>
						<tr>
							<td>�̸�:</td>
							<td style="width: 140px;"></td>
							<td><input type="text" name="name" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
		
						<tr>
							<td>�й�:</td>
							<td></td>
							<td><input type="text" name="studentId" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>�������:</td>
							<td></td>
							<td><input type="text" name="birthDate" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>�а�:</td>
							<td></td>
							<td><input type="text" name="divison" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>�г�:</td>
							<td></td>
							<td><input type="text" name="grade" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>�ֹε�Ϲ�ȣ:</td>
							<td></td>
							<td><input type="text" name="personalId" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td>����ó:</td>
							<td></td>
							<td><input type="text" name="address" maxlength="12"
								style="width: 140px;" readonly="readonly"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>
								<button class="button" style="width: 80px; float: right;"
									onclick="popup_change()">����</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
</body>
</html>