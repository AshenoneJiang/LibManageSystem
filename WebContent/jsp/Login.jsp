<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>

<%
	if ((String)request.getAttribute("error") == "ERROR"){
		out.println("<script>");
		out.print("alert(\"");
		out.print("用户名不存在或密码错误");
		out.print("\")");
		out.println("</script>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 欢迎光临图书管理系统</title>

<style>
	div1{
		width:300px;
		height:315px;	
		border-width:1px ;
		border-color:#DCDEE2;
		border-style:solid;
		display: inline-block;
		padding:10px;
		margin: 50px 770px;
		background-color:white;
		border-radius:10px;
	}
	div2{
			width:400px;
			height:400px;
			margin:	0px 770px;
			font-family:"Microsoft YaHei",微软雅黑; 
 			font-size:32px;
	}
 .one{
 		font-family:"Microsoft YaHei",微软雅黑; 
 		font-size:8px;
 	}
 .two{width:200px;}
  body{background-color:#F9F9F9}
</style>
<script language = "javascript">
	function check(){
		if(document.getElementById("name").value == ""){
			alert("用户名为空，请输入用户名");document.getElementById("name").focus();return;
		}
		else if(document.getElementById("password").value == ""){
			alert("密码为空，请输入密码");document.getElementById("password").focus();return;
		}
		else{
				loginform.submit();
		}
	}
</script>
</head>
<body>
 <br><br><br><br><br><br>
<div2>欢迎光临图书管理系统<br></div2>
  <div1>
 <form action = "/LibManager/jsp/LoginJudge.jsp" method = "post" name = "loginform">
 	 <p class = "one">用户名：</p>
 	 <input name = "username" type = "text" id = "name" maxlength = "40" style = "width:300px ; height:30px;border-radius:3px;border-style:solid;border-width:1px ;border-color:#DDDFF3">
 	 <p class = "one">密码：    </p>
 	 <input name = "password" type = "password" id = "password" maxlength = "40" style = "width:300px ; height:30px;border-radius:3px;border-style:solid;border-width:1px ;border-color:#DDDFF3">
 	<br><br><br><br><br><br>
 	 <input name = "login" type = "button" class = "btn_grey" value = "登录" style = "width:300px ; height:30px;color:white;background-color:#2EBC4F;outline:none;border-radius:3px;border:none" onclick = "check()" ><br><br>
 	<center> 还没有帐号?<a href = "/LibManager/html/signIn.html">注册一个账号</a></center>
 </div1>
 </form>
</body>
</html>