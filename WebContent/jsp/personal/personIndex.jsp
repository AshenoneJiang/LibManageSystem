<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	String name = (String)session.getAttribute("username");
	User cur;
	if (name == null){
		cur = new User();
		request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
	}
	else{
		cur = DbUserControler.QueryByName((String)name).get(0);
}

%>
<html>

<head>
<link rel="stylesheet" type="text/css" href="/LibManager/css/top.css">
<title>个人信息</title>


</head>

<body style = "margin:0px; background-color:#CACACA">
	<ul>
  <li><a href="/LibManager/index.jsp">主页</a></li>
  <li><a class="active" href="/LibManager/jsp/personal/personIndex.jsp">个人信息</a></li>
  <li><a href="#contact">联系</a></li>
  <li><a href="/LibManager/html/LibIntroduction.html">关于</a></li>
	</ul>

    <div style="background-color:#CACACA;height:840px;width:1900px;">
        <div id="left" style="background-color:#393D49;height:840px;width:100px;float:left;">
            <div id="fp" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#0E88EB;height:70px;width:100px;"
                onclick="window.location.href='personIndex.jsp'">个人信息</button>
            </div>
            <div id="rule" style="background-color:#393D49;height:70px;width:100px;">
                <button
                    style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"
                     onclick="window.location.href='2/personalRule.jsp'">图书规则</button>
            </div>





        </div>

        <div id="main" style="background-color:rgb(202, 202, 202);height:840px;width:auto;float:left;">
            <div id="mmain"
                style="background-color:rgb(255, 255, 255);height:780px;width:1600px;float:left;position:relative;left:30;top:30;">
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:700px;float:left;text-align:center;">
                    <br><br><br><br><br>
                    <h3>您的账户</h3><br>
                    <p>账号:<%=cur.getId() %></p><br>
                    <p>昵称：<%=cur.getUsername() %></p><br>
                    <p>账号状态：普通用户</p><br>

                </div>
                <div id="mmain" style="background-color:rgb(202, 202, 202);height:780px;width:40px;float:left;">





                </div>
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:800px;float:left;text-align:center;">
                    <br><br><br><br><h2 style="color:#A7C942; ">借阅中</h2>
                    <table  width=850px>
                        <tr style="height:30px">
                            <th></th>
                            <th>书名</th>
                            <th>借书日期</th>
                            <th>最晚还书日期</th>
							<th>还书</th>
                        </tr>
                        <%
                        	List<Borrow> borrows = DbBorrowController.getNotEndBorrows(cur.getId());
                        	int total = borrows.size();
                        	for (int i = 0; i < total; i++){
                        		Borrow e = borrows.get(i);
                        		int after = e.getTime() * 60 * 60 * 24 * 1000;
                        		Date back = new Date(e.getBegin().getTime() + after);
                        		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                        		
                        		out.println("<tr style=\"height:30px\">");
                        		
                        		out.println("<th>" + (i+1) + "</th>");
                        		out.println("<th>" + e.getBookName() + "</th>");
                        		out.println("<th>" + e.getBegin().toString() + "</th>");
                        		out.println("<th>" + ft.format(back) + "</th>");
                        		out.println("<th>");
                        		out.println("<a href=\"../backBook.jsp?name=" + e.getBookName() + "\">去还书</a>");
                        		out.println("</th>");
                        		
                        		out.println("</tr>");
                        	}
                        	
                        	for (int i = total; i<15; i++){
                        		out.println("<tr style=\"height:30px\">");
                        		
                        		out.println("<th>" + (i+1) + "</th>");
                        		out.println("<th></th>");
                        		out.println("<th></th>");
                        		out.println("<th></th>");
                        		out.println("<th></th>");
                        		
                        		out.println("</tr>");
                        	}
                        %>           
                    </table>
                </div>
            </div>
        </div>
    </div>
<div id="all"
		style="margin-top:1px; background-color:#090605;height:210px;width:1900px;clear:both;position:relative;">

		<p style="color:white ;position:absolute;top:25px ;left:80px; ">巴瓦鲁魔法图书馆</p>
		<a href="" style="color:white ;position:absolute;top:70px ;left:80px; text-decoration:none;">关于我们</a>
		<a href="" style="color:white ;position:absolute;top:110px ;left:80px; text-decoration:none;">联系我们</a>
		<a href="" style="color:white ;position:absolute;top:150px ;left:80px; text-decoration:none;">用户协议</a>
		<a href="" style="color:white ;position:absolute;top:70px ;left:205px; text-decoration:none;">加入我们</a>
		<a href="" style="color:white ;position:absolute;top:110px ;left:205px; text-decoration:none;">友情链接</a>
		<a href="" style="color:white ;position:absolute;top:150px ;left:205px;text-decoration:none; ">隐私政策</a>
		<a href="" style="color:white ;position:absolute;top:70px ;left:320px; text-decoration:none;">红魔馆认证</a>
		<div id="all"
			style="margin-top:1px; background-color:rgb(76, 79, 82);height:190px;width:2px;clear:both;position:absolute;top:15px ;left:560px;">
		</div>

		<p style="color:white ;position:absolute;top:25px ;left:750px; ">传送门</p>
		<a href="" style="color:white ;position:absolute;top:70px ;left:750px; text-decoration:none;">帮助中心</a>
		<a href="" style="color:white ;position:absolute;top:110px ;left:750px; text-decoration:none;">活动中心</a>
		<a href="" style="color:white ;position:absolute;top:150px ;left:750px; text-decoration:none;">侵权申诉</a>
		<a href="" style="color:white ;position:absolute;top:70px ;left:870px; text-decoration:none;">用户反馈</a>
		<a href="" style="color:white ;position:absolute;top:110px ;left:870px; text-decoration:none;">当前管理员</a>
		<div id="all"
			style="margin-top:1px; background-color:rgb(76, 79, 82);height:190px;width:2px;clear:both;position:absolute;top:15px ;left:1300px;">
		</div>
		<img src="img/dilan.png" style="height:200px;width:450px;position:absolute;top:10px ;left:1375px;">

	</div>




</body>

</html>