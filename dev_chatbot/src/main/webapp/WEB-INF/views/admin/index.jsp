<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session을 잃은 상태면 로그인 페이지로 넘어감.
	String mb_Id = (String)session.getAttribute("mb_Id");
	if(mb_Id == null){
		out.println("<script>location.href='/';</script>");
	}
	
	//mode 확인
		//get요청 mode에 저장된 값을 이용하여 페이지를 확인
		String mode = (String)request.getParameter("mode");
		System.out.println("mode : " + mode);
%>

	<!-- admin.head include -->
	<%@include file="./include/admin.head.jsp" %>
	
	<!-- admin.tail include -->
	<%@include file="./include/admin.tail.jsp" %>
