<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<html>
<head>
<style>
	.box1{
		height:700px;
		width:1500px;
		margin-left:300px;
		margin-top:150px;
		border:solid 0px red;
	}
	.box2{
			border:solid 0px red;
			height:70px;
			width:800px;	
			margin-left:200px;
			margin-top:100px;
		}
	.box3{
			
	
		}
	body{background-color:#F9F9F9}
	.one{
		white-space: nowrap;
		height:500px;
		width:1200px;
		border-collapse:collapse;
		white-space: nowrap;
		text-align:left;
		margin-top:0px;
		
	}
	.two{
		 font-family:"Microsoft YaHei",微软雅黑; 
		 color:white;
 		 font-size:8px;
 		 height:5px;	
 		 width:100px;
 		 white-space: nowrap;
 		 background-color:#A7C942;
 		 text-align:left;
		}
	.three{		
			font-family:"Microsoft YaHei",微软雅黑; 
 		 	font-size:8px;
 		 	white-space: nowrap;
 		 	text-align:left;
		}
	.four{
		 width:100px;
		 height:30px;
		 border-radius:3px;
		 border-style:solid;
		 border-width:0px ;
		 border-color:#DDDFF3;
		 cursor:pointer;
		 font-family:"Microsoft YaHei",微软雅黑; 
 		 font-size:16px;
 		 color:white;
 		 background-color:#3385FF;
 
	}
	a{text-decoration:none}
	.five{
		 width:600px ;
		 height:30px;
		 border-radius:3px;
		 border-style:solid;
		 border-width:0px ;

	}
	.six{
			background-color:#EAF2D3;
		}
	.se{
			padding:20px;
	
		}
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String target = (String)request.getParameter("search");
	String current = (String)request.getParameter("page");
	int currentPage;
	int prePage;
	int losPage;
	if (current == null || current.equals("1")){
		currentPage = 1;
		prePage = currentPage + 1;
		losPage = currentPage - 1;
	}
	else{
		currentPage = Integer.parseInt(current);
		prePage = currentPage + 1;
		losPage = currentPage - 1;
	}
	
	prePage = currentPage + 1;
	losPage = currentPage - 1;
	
	//target = new String(target.getBytes("ISO-8859-1"), "utf-8");
	List<Book> Result = null;
	int total = 0;
	if (target.equals("")){
		total = 0;
	}
	else{		
		Result = DbBookControler.QueryByName(target);
		total = Result.size();
	}
	
	int pageSize = 10;
	int maxPage = (total-1) / pageSize + 1;
%>
<link rel="stylesheet" type="text/css" href="/LibManager/css/top.css">
<title>搜索结果</title>
</head>
<body style="margin:0px">
		<ul>
  <li><a href="/LibManager/index.jsp">主页</a></li>
  <li><a href="/LibManager/jsp/personal/personIndex.jsp">个人信息</a></li>
  <li><a href="#contact">联系</a></li>
  <li><a href="/LibManager/html/LibIntroduction.html">关于</a></li>
	</ul>
	<div class = "box1">
		<div class = "box2">
		<form action = "QueryResult.jsp">
		<input name = "search" type = "text" id ="search1" class = "five">
		<input type = "submit" id = "sumbit1" value = "搜索" class = "four">
		</form>
		</div>
		搜索  <%= target%> 共找到<%= total%> 条记录：共<%=maxPage %>页
		<table class = "one" border = "1">
		<%
			if (total != 0) {
				out.println("<tr class = \"six\">");
				out.println("<td class = \"two\" align = \"center\" valign = \"middle\" width = \"20%\">书名</td>");
				out.println("<td class = \"two\" align = \"center\" valign = \"middle\" width = \"20%\">作者</td>");
				out.println("<td class = \"two\" align = \"center\" valign = \"middle\" width = \"20%\">出版社</td>");
				out.println("<td class = \"two\" align = \"center\" valign = \"middle\" width = \"20%\">详情</td>");
				out.println("</tr>");
			}
		%>
			
			
		
		<%
			int index = (currentPage-1)*pageSize;
		
			for (int temp = index; temp < total && temp < index + pageSize; temp++){
				Book cu = Result.get(temp);
				String name = cu.getName();
				String author = cu.getAuthor();
				String Publish = cu.getPublish();
				/*if (name.length() > 15){
					name = name.substring(0,14) + "...";	
				}*/
				
				if (author.length() > 15){
					author = author.substring(0,14) + "...";	
				}
				
				if (Publish.length() > 15){
					Publish = Publish.substring(0,14) + "...";	
				}
				
				
				
				if (temp % 2 == 0){
					out.print("<tr>");
				}
				else{
					out.print("<tr class = \"six\">");
				}
				
				//Book Name
				out.print("<td class = \"three\" align = \"center\" valign = \"middle\">");
				out.print(name);
				out.print("</td>\n");
				//Book Author
				out.print("<td class = \"three\" align = \"center\" valign = \"middle\">");
				out.print(author);
				out.print("</td>\n");
				//Book Publish
				out.print("<td class = \"three\" align = \"center\" valign = \"middle\">");
				out.print(Publish);
				out.print("</td>\n");
				//Detial
				out.print("<td class = \"three\" align = \"center\" valign = \"middle\">");
				out.print("<a href = \"Detail.jsp?name=" + name + "\" target=\"view_window\">"+"详细信息</a>");
				out.print("</td>\n");
				
				out.print("</tr>");
			}
		%>

		</table>
<% if (losPage != 0){
	out.print("<a href = \"" + "QueryResult.jsp?search=" + target + "&page="+losPage + "\"");
	out.print("class = \"se\">上一页</a>");
	}
	out.print("第" + currentPage + "页");
	if (prePage != maxPage+1){
		out.print("<a href = \"" + "QueryResult.jsp?search=" + target + "&page="+prePage + "\"");
		out.print("class = \"se\">下一页</a>");
	}
		
%>
	
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