<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//기존의 세션 모두 삭제
	session.invalidate();
	response.sendRedirect("login.jsp");
%>