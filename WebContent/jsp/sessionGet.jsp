<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注销</title>
</head>
<body>
<%
	String name = (String)session.getAttribute("username");
	if (name == null){
		response.sendRedirect("/LibManager/jsp/Login.jsp");
	}
	else{
		response.sendRedirect("/LibManager/jsp/personal/personIndex.jsp");
	}
%>
</body>
</html>