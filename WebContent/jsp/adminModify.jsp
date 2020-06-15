<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<!DOCTYPE html>
<html>
<head>
<title>数据修改</title>
</head>
<body>
<%
	String time = request.getParameter("day");
	String book = request.getParameter("bookcount");
	String newNotice = request.getParameter("notice");
	
	//newNotice = new String(newNotice.getBytes("ISO-8859-1"), "utf-8");
	
	if (!time.equals("")){
		DbRuleController.modifyMaxTime(Integer.parseInt(time));
	}
	
	if (!book.equals("")){
		DbRuleController.modifyMaxBook(Integer.parseInt(book));
	}
	
	if (!newNotice.equals("")){
		DbNoticeControler.addNotice(newNotice);
	}
	
	response.sendRedirect("/LibManager/jsp/admin/1/adminRule.jsp");
%>
</body>
</html>