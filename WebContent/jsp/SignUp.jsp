<%@ page import = "javax.servlet.*" %>
<%@ page import = "classes.DbManager.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<head>
    <title>注册成功</title>
</head>
<body>
    <%
    	Boolean su = false;
        String username = request.getParameter("user").trim();
        String password = request.getParameter("password").trim();
        out.print("<script> alert(\"");
        try{
            if (DbUserControler.SignUp(username, password)){
                out.print("注册成功");
                su = true;
            }
            else {
                out.print("用户名已被使用");
            }
        } catch (Exception e) {
            out.print(e);
        }
		
        out.print("\");</script>");
        
        String path = request.getContextPath();
        if (su){
        	session.setAttribute("username", username);
			response.sendRedirect("/LibManager/index.jsp");
        }
        else {
        	response.sendRedirect(path + "/html/signIn.html");
        }
    %>
</body>
</html>