<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>还书</title>

<%
	String bookName = (String)request.getParameter("name");
	String userName = (String)session.getAttribute("username");
	
	//bookName = new String(bookName.getBytes("ISO-8859-1"), "utf-8");
	//userName = new String(userName.getBytes("ISO-8859-1"), "utf-8");
	
	int userId = DbUserControler.QueryByName(userName).get(0).getId();
	
	DbBorrowController.backBook(userId, bookName);
	out.print("还书成功");
%>
</head>
<body>

</body>
</html>