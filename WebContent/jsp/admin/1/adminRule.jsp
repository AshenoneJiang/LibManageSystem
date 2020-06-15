<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>

<html>
<%	
String name = (String)session.getAttribute("username");
if (name == null){
	request.getRequestDispatcher("/LibManager/jsp/Login.jsp").forward(request, response);
}
 %>
<head>
    <style>

    </style>
    <script>
        var day = 10;
        var fig = 20;
        var go = "暂无";

    
    
    </script>
<title>图书馆后台</title>
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
            <div id="fp" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"
                    onclick="window.location.href='../adminIndex.jsp'">首页</button>
            </div>
            <div id="rule" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#267EEB;height:70px;width:100px;"
                    onclick="window.location.href='adminRule.jsp'">图书规则</button>
            </div>
            <div id="paper" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"
                    onclick="window.location.href='card.jsp'">借书证管理</button>
            </div>
            <div id="book" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"
                    onclick="window.location.href='bookModify.jsp'">增减书本</button>
            </div>
        </div>

        <div id="main" style="background-color:rgb(202, 202, 202);height:840px;width:1800px;float:left;">
            <div id="mmain"
                style="background-color:rgb(255, 255, 255);height:780px;width:1740px;float:left;position:relative;left:30;top:30;">
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:850px;float:left;text-align:center;">
                    <br><br><br><br><br>
                    <h3>当前读书规则</h3><br>
                    <b>最长借阅时间:</b>
                   <%=DbRuleController.getMaxTime() %>天<br>
                    <b>最多可借本数:</b><%=DbRuleController.getMaxBook() %>本<br>
                <b>当前公告</b><br>
 				<%=DbNoticeControler.getLastNotice().getNotice() %><br>
            
            
            
            
            </div>
                <div id="mmain" style="background-color:rgb(202, 202, 202);height:780px;width:40px;float:left;">





                </div>
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:850px;float:left;text-align:center;">
                    <br><br><br><br><br>
                    <h3>修改读书规则</h3><br>
                    <form action="/LibManager/jsp/adminModify.jsp">输入新的最大天数:<br>
                        <input id="nday" type="text" name="day" >
                        <br> 输入新的做多可借本数:<br>
                        <input id="nfig" type="text" name="bookcount" ><br>
                        	 新公告:<br>
                        <textarea id="nggg" name="notice" id="" cols="50" rows="10" style="vertical-align:top;outline:none;"></textarea><br><br><br>
                        <input type="submit" value="确认" style="background-color: #1074E7 ">
                        <input type="reset" value="重置" style="background-color: #1074E7 ">
                    </form>


                </div>



            </div>





        </div>






    </div>





</body>

</html>