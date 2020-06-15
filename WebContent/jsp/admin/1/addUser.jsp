<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>添加用户中</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String password = request.getParameter("comment");
	
	if(!name.equals("") && !password.equals("")){
		//name = new String(name.getBytes("ISO-8859-1"), "utf-8");
		//password = new String(password.getBytes("ISO-8859-1"), "utf-8");
		DbUserControler.SignUp(name, password);
	}
	
	response.sendRedirect("/LibManager/jsp/admin/1/card.jsp");
%>
</body>
</html>