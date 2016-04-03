<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
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
<center>
<form id="meg" name="meg" action="<%=path %>/MessageUpdate?id=${message.id }" method="post">
标题：&nbsp;&nbsp;<input id="title" name="title" value="${message.title }"/></br></br>
发布人：&nbsp;&nbsp;<input id="author" name="author" value="${message.author }"/></br></br>
内容：&nbsp;&nbsp;<input id="textarea" name="textarea" value="${message.textarea }"/></br></br>
<input type="submit" name="subm" value="提交"  onclick="this.disabled='true'" style="margin-left:100px"/>
<input type="reset" name="res" value="重置" style="margin-left:100px"  onclick="
 if(confirm('你确定要重置吗?')){	
		
	}else{
		return false;
		}	

 "
/>
</form>
</center>

</body>
</html>