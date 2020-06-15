<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>

<html>
<head>
<title>图书馆后台</title>
<style type="text/css">
           table {
               /*设置相邻单元格的边框间的距离*/
               border-spacing: 0;
               /*表格设置合并边框模型*/
               border-collapse: collapse;
               text-align: center;
           }
           /*关键设置 tbody出现滚动条*/
           table tbody {
              display: block;
                 height: 600px;
               overflow-y: scroll;
            }
         
          table thead,
          tbody tr {
              display: table;
             width: 100%;
             table-layout: fixed;
          }
       /*关键设置：滚动条默认宽度是16px 将thead的宽度减16px*/
          table thead {
              width: calc( 100% - 1em)
       }
         
          
          table thead th {
             background: #ccc;
        }</style>
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
                <button style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"
                    onclick="window.location.href='adminRule.jsp'">图书规则</button>
            </div>
            <div id="paper" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#267EEB;height:70px;width:100px;"
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
                    <h3>所有账户</h3><br>
                    <table border="1" width=850px height:780px;>
                        <tr style="height:30px">
                            <th>昵称</th>
                            <th>账号</th>
                            <th>借书数</th>
                            <th>逾期次数</th>
                        </tr>
                         <%
                        	List<User> users = DbUserControler.getAllUser();
                        	int total = users.size();
                        	for (int i = 0; i < total; i++){
                        		User e = users.get(i);
                        		out.println("<tr style=\"height:30px\">");
                        		
                        		out.println("<th>" + e.getUsername() + "</th>");
                        		out.println("<th>" + e.getId() + "</th>");
                        		out.println("<th>" + DbBorrowController.getNotEndBorrows(e.getId()).size() + "</th>");
                        		out.println("<th>0</th>");
                        		out.println("</tr>");
                        	}
                        	
                        	for (int i = total; i<15; i++){
                        		out.println("<tr style=\"height:30px\">");
                        		
                        		out.println("<th></th>");
                        		out.println("<th></th>");
                        		out.println("<th></th>");
                        		out.println("<th></th>");
                        		
                        		out.println("</tr>");
                        	}
                        %>     

                    </table>
                </div>
                <div id="mmain" style="background-color:rgb(202, 202, 202);height:780px;width:40px;float:left;">





                </div>
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:850px;float:left;text-align:center;">
                    <br><br><br><br><br>
                    <h1>增添新账户</h1>
                    <form action="addUser.jsp">
                    		    输入新账户名:<br>
                        <input type="text" name="name" value=""><br>
                     		   输入密码:<br>
                        <input type="text" name="comment" value="" size="50"><br><br><br>
                        <input type="submit" value="确认" style="background-color: #1074E7 ">
                        <input type="reset" value="重置" style="background-color: #1074E7 ">
                    </form>




                </div>



            </div>





        </div>






    </div>





</body>

</html>