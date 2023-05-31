<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 인코딩 설정
	request.setCharacterEncoding("utf-8");
	// 요청값 유효성 검사
	if(request.getParameter("teacherId") == null 
		|| request.getParameter("teacherName") == null 
		|| request.getParameter("teacherId").equals("")
		|| request.getParameter("teacherName").equals("")) {
		// insertTeacher.jsp으로
		response.sendRedirect(request.getContextPath() + "/teacher/insertTeacher.jsp");
		return;
	}
	// 요청값 변수에 저장
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	// sql 메서드들이 있는 클래스의 객체 생성
	TeacherDao tDao = new TeacherDao();
	// Subject 객체 생성하여 요청값 저장
	Teacher teacher = new Teacher();
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	// 과목 추가 메서드 실행
	int row = tDao.insertTeacher(teacher);
	
	if(row == 1){
		System.out.println("강사 추가 성공");
	}
	// subjectList.jsp으로
	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
%>