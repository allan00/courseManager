<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
if(t==null){
	request.setAttribute("message", "你没有权限查看此页面");
	request.getRequestDispatcher("index.jsp").forward(request, response);
}
request.setAttribute("teacher", t);
String course_map_id = request.getParameter("course_map_id");
request.setAttribute("course_map_id", course_map_id);
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
<title>教师列表</title>
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

<form id="assignment" name="assignment" action="<%=path %>/AssignmentAdd?course_map_id=${course_map_id}" method="post">

标题：&nbsp;&nbsp;<input id="title" name="title"/></br></br>
内容：&nbsp;&nbsp;<textarea id="content" name="content" class="ckeditor" rows="10" cols="80"></textarea></br></br>
截止时间：&nbsp;&nbsp;<input id="deadline" name="deadline"/></br></br>
<input type="submit" name="subm" value="提交"  onclick="this.disabled='true'" style="margin-left:100px"/>

</form>
</center>

</body>
</html>