<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>view_popup</title>
<link rel="stylesheet" href="StyleSheetFolder/StyleSheet.css">
</head>
<body>
	<form class="doc" action="" method="post">
		<div id="table">
			<div class="row">
				<div class="cell">
					<label for="name">이름:</label>
				</div>
				<div class="cell">
					<input id="name" type="text" name="name"><br>
				</div>
				<div class="cell"></div>
				<div class="cell"></div>
			</div><br>
			<div class="row">
				<div class="cell">
					<label for="studentId">학번:</label>
				</div>
				<div class="cell">
					<input id="studentId" type="text" name="studentId">
				</div>
				<div class="cell"></div>
				<div class="cell"></div>
				
			</div><br>
			<div class="row">
				<div class="cell">
					<label for="birthdate">생년월일:</label>
				</div>
				<div class="cell">
					<input id="birthdate" type="date" name="birthdate">
				</div>
				<div class="cell">
					<label for="birthdate2">~</label>
				</div>
				<div class="cell">
					<input id="birthdate2" type="date" name="birthdate2">
				</div>
				
			</div><br>
			<div class="row">
				<div class="cell">
					<label for="division">학과:</label>
				</div>
				<div class="cell">
					<input id="division" type="text" name="division">
				</div>
				<div class="cell"></div>
				<div class="cell"></div>
				
			</div><br>
			<div class="row">
				<div class="cell">
					<label for="grade">학년:</label>
				</div>
				<div class="cell">
					<input id="grade" type="text" name="grade"><br>
				</div>
				<div class="cell"></div>
				<div class="cell"></div>
			</div><br>
			<div class="row">

				<div class="cell">
					<label for="personalId">주민등록번호:</label>
				</div>
				<div class="cell">
					<input id="personalId" type="text" name="personalId">
				</div>
				<div class="cell"></div>
				<div class="cell"></div>
				
			</div>
			<div class="row">
				<div class="cell">
					<label for="address">연락처:</label>
				</div>
				<div class="cell">
					<input id="address" type="text" name="address">
				</div>
				<div class="cell"></div>
				<div class="cell">
					<input class="button" type="submit" name="view" value="조회" formaction=“”
						formmethod="post" style="width: 80px; float: right;">
				</div>
			</div>
		</div>

	</form>
</body>
</html>