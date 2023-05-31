<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTeacher</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
	<h1>강사 추가</h1>
	<form action="<%=request.getContextPath()%>/teacher/insertTeacherAction.jsp" method="post">
		<table class="table table-bordered">
			<tr>
				<th class="table-dark">ID</th>
				<td><input type="text" name="teacherId"></td>
			</tr>
			<tr>
				<th class="table-dark">이름</th>
				<td><input type="number" name="teacherName"></td>
			</tr>
			<tr>
				<th class="table-dark">경력</th>
				<td><input type="number" name="teacherHistory"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-dark btn-block">추가</button>
	</form>
	</div>
</body>
</html>