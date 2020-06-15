<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<html>
<%
	String name = (String)session.getAttribute("username");
	User admin;
	if (name == null){
		admin = new User();
		request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
	}
	else{
		admin = DbUserControler.QueryByName(name).get(0);
	}
	
	int total = 550420;
	int borrow = DbBorrowController.getNotEndBorrows().size();
%>
<head>
<title>图书馆后台</title>
    <style>
    </style>
</head>

<body style="margin:0px">
    <div style="height:72px;width:1900px;">
        <div id="all"
            style="margin-top:1px; background-color:#393D49;height:67px;width:1900px;clear:both;text-align:center;">

            <div style="float:left;width:100px;"><br>

            </div>
            <div style="float:left;width:300px;"><img src="houtai.png" style="height:67px;width:300px;">
            </div>


        </div>
        <div style="height:5px;width:1900px;background-color:#267EEB">
        </div>
    </div>
    <div style="background-color:rgb(255, 255, 255);height:840px;width:1900px;">
        <div id="left" style="background-color:#393D49;height:840px;width:100px;float:left;">
        
            <div id="fp" style="background-color:#267EEB;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#267EEB;height:70px;width:100px;"onclick="window.location.href='adminIndex.jsp'">首页</button>
            </div>
            
            <div id="rule" style="background-color:#393D49;height:70px;width:100px;">
                <button
                    style="border:none; color: white;background-color:#393D49;height:70px;width:100px;" onclick="window.location.href='1/adminRule.jsp'">图书规则</button>
            </div>
            
            <div id="paper" style="background-color:#393D49;height:70px;width:100px;">
                <button
                    style="border:none; color: white;background-color:#393D49;height:70px;width:100px;" onclick="window.location.href='1/card.jsp'">借书证管理</button>
            </div>
            
            <div id="book" style="background-color:#393D49;height:70px;width:100px;">
                <button
                    style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"onclick="window.location.href='1/bookModify.jsp'">增减书本</button>
            </div>
            


        </div>

        <div id="main" style="background-color:rgb(202, 202, 202);height:840px;width:1800px;float:left;">
            <div id="mmain"
                style="background-color:rgb(255, 255, 255);height:780px;width:1740px;float:left;position:relative;left:30;top:30;">
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:850px;float:left;text-align:center;">
                    <br><br><br><br><br>
                    <h3>您的账户</h3><br>
                    <p>账号:</p> <%=admin.getId() %><br>
                    <p>昵称：</p> <%=admin.getUsername() %><br>
                    <p>账号状态：</p> 管理员<br>

                </div>
                <div id="mmain" style="background-color:rgb(202, 202, 202);height:780px;width:40px;float:left;">





                </div>
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:850px;float:left;text-align:center;">
                    <br><br><br><br><br>
                    <h3>图书馆状态</h3><br>
                    <p>总藏书数：<%=total %></p><br>
                    <p>已借出书数：<%=borrow %></p><br>
                    <p>剩余书数：<%=total-borrow %></p><br>
                </div>
            </div>
        </div>
    </div>





</body>

</html>