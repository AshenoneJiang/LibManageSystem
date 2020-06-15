<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "classes.DbManager.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<html>

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

String code = request.getParameter("code");
if(code != null){
	out.print("<script>");
	out.print("alert(\"");
	
	if (code.equals("0")){
		out.print("*为必填项");
	}
	else if(code.equals("1")){
		out.print("添加成功");
	}

	out.print("\");");
	out.print("</script>");
}
%>
<head>

<style>
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
        }
         
</style>
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
                <button style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"
                    onclick="window.location.href='adminRule.jsp'">图书规则</button>
            </div>
            <div id="paper" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#393D49;height:70px;width:100px;"
                    onclick="window.location.href='card.jsp'">借书证管理</button>
            </div>
            <div id="book" style="background-color:#393D49;height:70px;width:100px;">
                <button style="border:none; color: white;background-color:#267EEB;height:70px;width:100px;"
                    onclick="window.location.href='bookModify.jsp'">增减书本</button>
            </div>
        </div>

        <div id="main" style="background-color:rgb(202, 202, 202);height:840px;width:1800px;float:left;">
            <div id="mmain"
                style="background-color:rgb(255, 255, 255);height:780px;width:1740px;float:left;position:relative;left:30;top:30;">
                <div id="mmain"
                    style="background-color:rgb(255, 255, 255);height:780px;width:850px;float:left;text-align:center;">
                    <br><br><br>
                    <h3>当前藏书</h3><br>
                    <table border="1" style="width:850px;">
                        <caption>
                            <center>借书记录</center>
                        </caption>
                        <tr style="height:30px">
                        
                            <th>书名</th>
                            <th>借书人</th>
                            <th>借书人卡号</th>
                            <th>借书记录号</th>
                            <th>借阅时间</th>
                            <th>最晚还书时间</th>
                        </tr>
                         <%
                        	List<Borrow> borrows = DbBorrowController.getNotEndBorrows();
                        	int total = borrows.size();
                        	for (int i = 0; i < total; i++){
                        		Borrow e = borrows.get(i);
                        		int after = e.getTime() * 60 * 60 * 24 * 1000;
                        		Date back = new Date(e.getBegin().getTime() + after);
                        		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                        		int id = e.getUserId();
                        		out.println("<tr style=\"height:30px\">");
                        		
                        		out.println("<th>" + e.getBookName() + "</th>");
                        		out.println("<th>" + DbUserControler.QueryById(id).get(0).getUsername() + "</th>");
                        		out.println("<th>" + id + "</th>");
                        		out.println("<th>" + e.getId() + "</th>");
                        		out.println("<th>" + e.getBegin().toString() + "</th>");
                        		out.println("<th>" + ft.format(back)+ "</th>");
                        		out.println("</tr>");
                        	} 
                        	
                        	for (int i = total; i<15; i++){
                        		out.println("<tr style=\"height:30px\">");
                        		
                        		out.println("<th></th>");
                        		out.println("<th></th>");
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
                    <h1>增添书本</h1>
                    <div >
                         <form action = "addBook.jsp">
                      		  *新书名:<input type="text" name="name" value=""><br>
                     		   *出版日期:<input type="date" name="pdate" value="" size="50"><br>
                      		  *该书卡号:<input type="text" name="isbn" value="" size="50"><br>
                   	    	     *作者:<input type="text" name="author" value="" size="50"><br>
                 			   *出版社:<input type="text" name="publish" value="" size="50"><br>
                 			       关键字:<input type="text" name="keyword" value="" size="50"><br>
          	        		      摘要:<input type="text" name="summary" value="" size="50"> <br>
                   				*本数:<input type="text" name="count" value="" size="50"><br><br>
					
                        <input type="submit" value="确认" style="background-color: #1074E7 ">
                        <input type="reset" value="重置" style="background-color: #1074E7 ">
                    </form>
                    </div>
                </div>
            </div>
        </div>






    </div>





</body>

</html>