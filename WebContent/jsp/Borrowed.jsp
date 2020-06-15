<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>借阅书本</title>
</head>
<body>
<%
	String bookName = (String)request.getParameter("name");
	String userName = (String)session.getAttribute("username");
	int time = 10;
	int code;
	User cur;
	if (userName == null){
		cur = new User();
		request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
	}
	else{
		cur = DbUserControler.QueryByName((String)userName).get(0);
}
	
	//bookName = new String(bookName.getBytes("ISO-8859-1"), "utf-8");
	//userName = new String(userName.getBytes("ISO-8859-1"), "utf-8");
	
	List<Borrow> borrows = DbBorrowController.getNotEndBorrows(cur.getId());
	boolean haveBorrow = false; //have borrow this book
	
	for (Borrow temp : borrows){
		if (temp.getBookName().equals(bookName)){
			haveBorrow = true;
			break;
		}
	}
	
	if (haveBorrow){
		out.print( "这本书你已经借过了，请归还后再借第二本" );
		code = 0;
	}
	else if (borrows.size() == DbRuleController.getMaxBook()){
		code = 2;
	}
	else {
		int re = DbBorrowController.addBorrow(cur.getId(), bookName, DbRuleController.getMaxTime());
		out.println(new Date().toString());
		out.print("借书成功" + re);
		code = 1;
	}
	
	bookName = new String(bookName.getBytes("utf-8"), "ISO-8859-1");
	response.sendRedirect("/LibManager/jsp/Detail.jsp?name="+bookName+"&code="+code);
%>
</body>
</html>