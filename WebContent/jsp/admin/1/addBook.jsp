<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<title>添加书本中</title>
</head>
<body>
<%
	int code = 1;
	String name = request.getParameter("name");
	String ISBN = request.getParameter("isbn");
	String author = request.getParameter("author");
	String keyword = request.getParameter("keyword");
	//String pdate = request.getParameter("pdate");
	String count = request.getParameter("count");
	String publish = request.getParameter("publish");
	String summary = request.getParameter("summary");
	
	Book book = new Book();
	if(!author.equals(""))
		book.setAuthor(author);
	else
		code = 0;
	
	if(!count.equals(""))
		book.setCount(Integer.parseInt(count));
	else
		code = 0;
	
	if (!name.equals(""))
		book.setName(name);	
	else
		code = 0;
	
	if (!ISBN.equals(""))
		book.setISBN(ISBN);
	else
		code = 0;
	
	book.setKeyword(keyword);
	//book.setPdate(pdate);
	
	if (!publish.equals(""))
		book.setPublish(publish);
	else
		code = 0;
	book.setSummary(summary);

	//if(code == 1)
		//DbBookControler.AddNewBook(book);
	response.sendRedirect("bookModify.jsp?code="+code);
%>
</body>
</html>