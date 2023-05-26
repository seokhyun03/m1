<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 요청값 유효성 검사
	if(request.getParameter("teacherNo") == null  
		|| request.getParameter("teacherNo").equals("")) {
		// teacherList.jsp으로
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	// 요청값 변수에 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// sql 메서드들이 있는 클래스의 객체 생성
	TeacherDao tDao = new TeacherDao();
		
	// 상세 페이지에 표시할 teacher 객체
	Teacher one = tDao.selectTeacherOne(teacherNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherOne</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>강사 상세</h1>
		<div class="d-grid">
			<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp">
				<button type="button" class="btn btn-dark btn-block">목록으로</button>
			</a>
		</div>
		<form action="<%=request.getContextPath()%>/teacher/updateTeacher.jsp" method="post">
			<table class="table table-bordered">
				<tr>
					<th class="table-dark">강사ID</th>
					<td>
						<input type="hidden" name="teacherNo" value="<%=one.getTeacherNo()%>">
						<%=one.getTeacherId()%>
					</td>
				</tr>
				<tr>
					<th class="table-dark">강사이름</th>
					<td><%=one.getTeacherName()%></td>
				</tr>
				<tr>
					<th class="table-dark">강사이력</th>
					<td><%=one.getTeacherHistory()%></td>
				</tr>
				<tr>
					<th class="table-dark">담당과목</th>
					<td><%=one.getTeacherSubjectName()%></td>
				</tr>
				<tr>
					<th class="table-dark">입사날짜</th>
					<td><%=one.getCreatedate()%></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-dark btn-block">수정</button>
			<button type="submit" formaction="<%=request.getContextPath()%>/teacher/deleteTeacherAction.jsp" class="btn btn-dark btn-block">삭제</button>
		</form>
	</div>
</body>
</html>