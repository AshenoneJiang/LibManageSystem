<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/top.css">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		.box1 {
			height: 700px;
			width: 1500px;
			margin-left: 100px;
			margin-top: 150px;

		}

		.box2 {
			height: 80px;
			width: 800px;

			margin-left: 480px;

		}

		.box3 {
			height: 450px;
			width: 1000px;

			margin-top: 50px;
			margin-left: 300px;
		}

		.box4 {
			height: 100px;
			width: 400px;
			border: solid 0px red;
			font-family: "Microsoft YaHei", 微软雅黑;
			font-size: 32px;
			margin-left: 750px;
		}

		a {
			text-decoration: none
		}

		.one {
			width: 100px;
			height: 30px;
			border-radius: 5px;
			border-style: solid;
			border-width: 0px;
			border-color: #DDDFF3;
			cursor: pointer;
			font-family: "Microsoft YaHei", 微软雅黑;
			font-size: 16px;
			color: white;
			background-color: #3385FF;
		}

		.two {
			width: 600px;
			height: 30px;
			border-radius: 5px;
			border-style: solid;
			border-width: 0px;

		}

		.three {
			width: 1000px;
			height: 400px;
			align: center;
			border-width: 1px;
			border-style: solid;
			border-color: #F9F9F9;
			background-color: white;
			border-radius: 5px;


		}

		.five {
			font-family: "Microsoft YaHei", 微软雅黑;
			font-size: 16px;
		}

		body {
			background-color: #F9F9F9
		}
	</style>
	<title>首页</title>
</head>

<%
	String scroll = "";
	String name = (String)session.getAttribute("username");
	if (name == null){
		scroll = "你尚未登录," + "<a href=\"jsp/Login.jsp\">点击登录</a>";
	}
	else{
		scroll = "欢迎你，"+name + "<a href=\"jsp/Logout.jsp\">点击注销</a>";
	}
	
	Notice lNotice = DbNoticeControler.getLastNotice();
	String date = lNotice.getDate().toString();
%>
<body style = "margin:0px">
	<ul>
  <li><a class="active" href="/LibManager/index.jsp">主页</a></li>
  <li><a href="/LibManager/jsp/personal/personIndex.jsp">个人信息</a></li>
  <li><a href="#contact">联系</a></li>
  <li><a href="/LibManager/html/LibIntroduction.html">关于</a></li>
	</ul>
	
	<div class="box1">
		<div class="box4">
			<p>巴瓦鲁图书馆</p><br>
		</div>
		<div class="box2">
			<form action="jsp/QueryResult.jsp">
				<input name="search" type="text" id="search1" class="two">
				<input type="submit" id="sumbit1" value="搜索" class="one">
			</form>
			<marquee behavior="scroll" direction="right" class="five">
				<%= scroll%>
			</marquee>
		</div>
		<div class="box3">
		<textarea cols="150" rows="20"><%
			List<Notice> notices = DbNoticeControler.getAllNotices();
			for (Notice e : notices){
				out.println(e.getDate());
				out.println(e.getNotice());
				out.print("\n");
			}
		%>
		</textarea>

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