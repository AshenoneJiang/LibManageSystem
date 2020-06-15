<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "classes.DbManager.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String name = request.getParameter("name");
	String code = request.getParameter("code");
	if(code != null){
		out.print("<script>");
		out.print("alert(\"");
		
		if (code.equals("0")){
			out.print("你已经借了一本同样的书，请归还后再借第二本");
		}
		else if(code.equals("1")){
			out.print("借书成功");
		}
		else {
			out.print("借书已达上限，看完一些再来借新的吧" );
		}
		
		out.print("\");");
		out.print("</script>");
	}
	//name = new String(name.getBytes("ISO-8859-1"), "utf-8");
	List<Book> rs = DbBookControler.QueryByName(name);
	Book book = rs.get(0);
%>
<html>
<head>
<style>
	.box1{
			width:1000px;
			height:1500px;
			margin-top:100px;
			margin-left:450px;
			border:solid 0px red;
			background-color:white;
		}
	.box2{
			width:170px;
			height:50px;
			margin-left:700px;
			margin-top:50px;
			border:solid 0px red;
		}
a{text-decoration:none}
	.box3{
			width:100%;
			height:auto;
			margin-top:50x;
			border:solid 0px red;
		}
	.box4{
			width:800px;
			height:250px;
			margin-top:50px;
			margin-left:100px;
			border:solid 0px red;
		}
	.box5{
	
			float:left;
			width:200px;
			height:300px;
			border:solid 0px red;
		}
	.box6{
			float:left;
			width:400px;
			height:200px;
			margin-left:200px;
			border:solid 0px red;
		}
	.pic{
			width:200px;
			height:300px;
		}
	.zy{
		 font-family:"Microsoft YaHei",微软雅黑; 
 		 font-size:24px; 
 		 color:green;
		}
	.two{
			font-family:"Microsoft YaHei",微软雅黑; 
 		 	font-size:16px;	
		}
	.three{
			font-family:"Microsoft YaHei",微软雅黑; 
 		 	font-size:20px;
 		 	background-color:#2EBC4F;
 		 	border:solid 0px red;
 		 	color:white;
 		 	border-radius:3px;
		 }
	.four{
			padding-top:10px;
			padding-left:250px;
			font-family:"Microsoft YaHei",微软雅黑; 
 		 	font-size:12px;
 		 	border:solid 0px red;
		}
	body{background-color:#F9F9F9}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/LibManager/css/top.css">
<title>书本详情</title>
</head>
<body style="margin:0px">
		<ul>
  <li><a href="/LibManager/index.jsp">主页</a></li>
  <li><a href="/LibManager/jsp/personal/personIndex.jsp">个人信息</a></li>
  <li><a href="#contact">联系</a></li>
  <li><a href="/LibManager/html/LibIntroduction.html">关于</a></li>
	</ul>
	<div class = "box1">
		 <div class = "box4">
		 	<div class = "box5">
				<img src = "/LibManager/img/book.png" witdh="100%" height="100%">
		 	</div>
			<div class = "box6">
			<ul style="background-color:white">
				书名：<%=book.getName() %><br>
				作者：<%=book.getAuthor() %><br>
				出版社：<%=book.getPublish() %><br>
				关键词：<%=book.getKeyword() %><br>
				出版日期：<%=book.getPdate() %><br>
				ISBN：<%=book.getISBN() %><br> 
				剩余本数：<%=book.getCount() %>本
			</ul>
			</div> 
		</div>
		<div class = "box2">
		<%
			if(book.getCount() != 0){
				out.print("<a href = \"Borrowed.jsp?name=" + name + "\">");
				out.print("<input type = \"button\" value = \"借阅\" class = \"three\" ></a>");
			}
		%>
		<br>
		</div>
		<hr></hr>
		<div class = "box3">
		<p class = "zy">&nbsp;&nbsp;&nbsp;&nbsp;  摘要.  .  .  .  .  .</p>
		<div>
		<%=book.getSummary() %>
		</div>
		

		</div>
		
	</div>


<div id="all" style="margin-top:1px; background-color:#090605;height:210px;width:1900px;clear:both;position:relative;">
    
    <p style="color:white ;position:absolute;top:25px ;left:80px; ">巴瓦鲁魔法图书馆</p>
    <a href="" style="color:white ;position:absolute;top:70px ;left:80px; text-decoration:none;">关于我们</a>
    <a href="" style="color:white ;position:absolute;top:110px ;left:80px; text-decoration:none;">联系我们</a>
    <a href="" style="color:white ;position:absolute;top:150px ;left:80px; text-decoration:none;">用户协议</a>
    <a href="" style="color:white ;position:absolute;top:70px ;left:205px; text-decoration:none;">加入我们</a>
    <a href="" style="color:white ;position:absolute;top:110px ;left:205px; text-decoration:none;">友情链接</a>
    <a href="" style="color:white ;position:absolute;top:150px ;left:205px;text-decoration:none; ">隐私政策</a>
    <a href="" style="color:white ;position:absolute;top:70px ;left:320px; text-decoration:none;">红魔馆认证</a>
     <div id="all" style="margin-top:1px; background-color:rgb(76, 79, 82);height:190px;width:2px;clear:both;position:absolute;top:15px ;left:560px;"></div>
   
        <p style="color:white ;position:absolute;top:25px ;left:750px; ">传送门</p>
        <a href="" style="color:white ;position:absolute;top:70px ;left:750px; text-decoration:none;">帮助中心</a>
        <a href="" style="color:white ;position:absolute;top:110px ;left:750px; text-decoration:none;">活动中心</a>
        <a href="" style="color:white ;position:absolute;top:150px ;left:750px; text-decoration:none;">侵权申诉</a>
        <a href="" style="color:white ;position:absolute;top:70px ;left:870px; text-decoration:none;">用户反馈</a>
        <a href="" style="color:white ;position:absolute;top:110px ;left:870px; text-decoration:none;">当前管理员</a>
        <div id="all" style="margin-top:1px; background-color:rgb(76, 79, 82);height:190px;width:2px;clear:both;position:absolute;top:15px ;left:1300px;"></div>
        <img src="dilan.png" style="height:200px;width:450px;position:absolute;top:10px ;left:1375px;">
    
</div>

</body>
</html>