<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "classes.DbManager.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
</head>
<body>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String path = request.getContextPath();
	int current = DbUserControler.Login(username, password);
	
	switch(current){
	case 1:
		session.setAttribute("username", username);
		response.sendRedirect(path + "/index.jsp");
		break;
	case 2:
		session.setAttribute("username", username);
		response.sendRedirect( "/LibManager/jsp/admin/adminIndex.jsp");
		break;
	default:
		request.setAttribute("error", "ERROR");
		request.setAttribute("code", current);
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		break;
	}
%>
</body>
</html>