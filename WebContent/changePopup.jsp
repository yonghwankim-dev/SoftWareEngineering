<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>change_popup</title>
<link rel="stylesheet" href="StyleSheetFolder/StyleSheet.css">

</head>
<body>
	<div style="text-align: center;">�л� ���� ����</div>
	<form method="post" action="">
		<div id="StudentInformation" style="width: 100%, height= 100%;">

			<br>
			<div class="row">
				<span style="width: 30%;" class="cell">�̸�:</span> <span
					style="width: 30%;" class="cell"></span> <span class="cell">
					<input type="text" name="name_change" maxlength="12"
					style="width: 140px;" readonly="readonly">
				</span>
			</div>
			<br>
			<div class="row">
				<span class="cell" style="width: 30%;">�й�:</span> <span class="cell"
					style="width: 30%;"></span> <span class="cell"> <input
					type="text" name="studentId_change" maxlength="12"
					style="width: 140px;" readonly="readonly">
				</span>
			</div>
			<br>
			<div class="row">
				<span class="cell" style="width: 30%;">�������:</span> <span
					class="cell" style="width: 30%;"></span> <span class="cell">
					<input type="text" name="birthDate_change" maxlength="12"
					style="width: 140px;" readonly="readonly">
				</span>
			</div>
			<br>
			<div class="row">
				<span class="cell" style="width: 30%;">�а�:</span> <span class="cell"
					style="width: 30%;"></span> <span class="cell"> <input
					type="text" name="division_change" maxlength="12"
					style="width: 140px;" readonly="readonly">
				</span>
			</div>
			<br>
			<div class="row">
				<span class="cell" style="width: 30%;">�г�:</span> <span class="cell"
					style="width: 30%;"></span> <span class="cell"> <input
					type="text" name="grade_change" maxlength="12"
					style="width: 140px;" readonly="readonly">
				</span>
			</div>
			<br>
			<div class="row">
				<span class="cell" style="width: 30%;">�ֹε�Ϲ�ȣ:</span> <span
					class="cell" style="width: 30%;"></span> <span class="cell">
					<input type="text" name="personalId_change" maxlength="12"
					style="width: 140px;" readonly="readonly">
				</span>
			</div>
			<br>
			<div class="row">
				<span class="cell" style="width: 30%;">����ó:</span> <span
					class="cell" style="width: 30%;"></span> <span class="cell">
					<input type="text" name="address_change" maxlength="12"
					style="width: 140px;" readonly="readonly">
				</span>
			</div>
			<br>
			<div class="row">
				<span class="cell" style="width: 30%;"></span> <span class="cell"
					style="width: 30%;"></span> <span class="cell" style="">
					<button class="button" style="width: 80px; float: center;"
						onclick="popup_change()">����</button>
				</span>
			</div>

		</div>
	</form>
</body>
</html>