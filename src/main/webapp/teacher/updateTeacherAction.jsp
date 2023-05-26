<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	// 인코딩 설정
	request.setCharacterEncoding("utf-8");

	// 요청값 유효성 검사
	if(request.getParameter("teacherNo") == null 
		|| request.getParameter("teacherNo").equals("")) {
		// subjectList.jsp으로
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	// 요청값 변수에 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	// 디버깅
	System.out.println(teacherNo + " <-- updateTeacherAction teacherNo");
	// 요청값 유효성 검사
	if(request.getParameter("teacherId") == null 
		|| request.getParameter("teacherName") == null 
		|| request.getParameter("teacherHistory") == null
		|| request.getParameter("teacherId").equals("")
		|| request.getParameter("teacherName").equals("")
		|| request.getParameter("teacherHistory").equals("")) {
		// updateTeacher.jsp으로
		response.sendRedirect(request.getContextPath() + "/teacher/updateTeacher.jsp?teacherNo="+teacherNo);
		return;
	}
	// 요청값 변수에 저장
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	// 디버깅
	System.out.println(teacherNo + " <-- updateTeacherAction teacherNo");
	System.out.println(teacherName + " <-- updateTeacherAction teacherName");
	System.out.println(teacherHistory + " <-- updateTeacherAction teacherHistory");
	
	// sql 메서드들이 있는 클래스의 객체 생성
	TeacherDao tDao = new TeacherDao();
	// Subject 객체 생성하여 요청값 저장
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	// 과목 수정 메서드 실행
	int row = tDao.updateTeacher(teacher);
	
	if(row == 1){
		System.out.println("강사 수정 성공");
	}
	// teacherOne.jsp으로
	response.sendRedirect(request.getContextPath() + "/teacher/teacherOne.jsp?teacherNo="+teacherNo);
%>