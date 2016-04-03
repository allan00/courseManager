<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
font-size:12px;
}
table,tr,td,input{
border: 1px solid blue;
border-collapse:collapse;
font-size:14px;
vertical-align: middle;
}
td{
height:30px;
}
ul li {
	padding: 0;
	margin: 0;
	display: inline-block;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知公告</title>
</head>
<body align="center">
<input type="hidden" id="msg" name="msg" value="<%=request.getAttribute("message")%>"/>
   	<script type="text/javascript">
 		var msg = document.getElementById('msg').value;
 		if(msg != null && msg != "null"){
			alert(msg);
		}
 	</script>
<center>
<ul>
<li><a href="<%=path %>/MessageAnnounce">下发通知</a></li>
<li><a href="<%=path %>/MessageList">通知管理</a></li>
</ul>
<table>
<tr>

<td>编号</td><td>标题</td><td>发布人</td><td>发布时间</td><td>操作</td>
</tr> 
<c:forEach var="message" items="${message_list}">
    <tr>
      <td >&nbsp;${message.id }</td>  
      <td >&nbsp;${message.title }</td>
      <td >&nbsp;${message.author }</td>
      <td >&nbsp;${message.data }</td>
      
      <td > <a href="<%=path %>/MessageDetail?id=${message.id }">编辑</a>&nbsp;
            <a href="<%=path %>/MessageDelete?id=${message.id }" onclick="
                   if(confirm('你确定要删除吗?')){	
		
	                    }else{
		            return false;
		                } ">删除 </a>&nbsp;
		     <a href="<%=path %>/MessageDetail?id=${message.id }">查看</a>
		                
		                
		    </td> 
      </tr>
</c:forEach>
</table></br>
   </center>
</body>
</html>