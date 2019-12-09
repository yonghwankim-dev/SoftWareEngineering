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
				<td><input type="radio" name="identity" value="student"
					onClick="CheckAbledID()">학생</td>

				<td><input type="radio" name="identity" value="manager"
					onClick="CheckAbledID()">관리자</td>
			</tr>
		</table>

		<div>&nbsp;</div>
		<table>
			<tr>
				<td style="text-align: justify;">이름 :</td>
				<td><input type="text" name="name" maxlength="12"
					style="width: 140px;" disabled></td>
				<td style="text-align: justify;">ID</td>
				<td><input type="text" name="id" maxlength="12"
					style="width: 140px;" disabled pattern="[0-9a-zA-Z]{20}"></td>
			</tr>

			<tr>
				<td style="text-align: justify;">생년월일 :</td>
				<td><input type="date" name="birthdate" maxlength="12"
					style="width: 140px;" disabled></td>
				<td style="text-align: justify;">PASSWORD</td>
				<td><input type="password" name="passwd" maxlength="12"
					style="width: 140px;" disabled pattern="[0-9a-zA-Z]{20}"></td>
			</tr>
			<tr>
				<td style="text-align: justify;">학과 :</td>
				<td><select name="major" style="width: 140px" disabled>
						<option value="컴퓨터공학과">컴퓨터공학과</option>
						<option value="전기공학과">전기공학과</option>
						<option value="언론정보학과">언론정보학과</option>
						<option value="심리학과">심리학과</option>
				</select></td>
			</tr>
			<tr>
				<td style="text-align: justify;">학년 :</td>
				<td><input type="number" name="grade" maxlength="12"
					style="width: 140px;" disabled></td>
			</tr>
			<tr>
				<td style="text-align: justify;">주민등록번호 :</td>
				<td><input type="text" name="personal_id"
					pattern="\d{6}\-\d{7}" title="123456-1234567 형식으로 입력해주세요" disabled />
				</td>
			</tr>
			<tr>
				<td style="text-align: justify;">연락처 :</td>
				<td><input type="tel" name="phone"
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required disabled></td>
			</tr>
		</table>
		<div>&nbsp;</div>
		<div style="text-align: right;">
			&nbsp;
			<button class="button" style="width: 80px;"
				onClick="go_SignUpProcess()">확인</button>
		</div>

	</form>
	<script type="text/javascript" src="ScriptFolder/Script1.js"></script>


</body>
</html>