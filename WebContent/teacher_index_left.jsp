<%@page import="model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<title>教师管理</title>
</head>
<body >

${teacher.name},&nbsp;欢迎您
<ul align="left">

<li><a href="<%=path %>/Teacher/MessageList" target=frmright>通知公告</a></li></br></br></br></br>
<li><a href="<%=path %>/Teacher/TeacherCourseList" target=frmright>课程管理</a></li></br></br></br></br>
<li><a href="<%=path %>/Teacher/AssignmentList" target=frmright>作业管理</a></li></br></br></br></br>
<li><a href="<%=path %>/Teacher/StudentList" target=frmright>学生管理</a></li></br></br></br></br>
<li><a href="<%=path %>/Teacher/FileList" target=frmright>资源管理</a></li></br></br></br></br>
<li><a href="<%=path %>/Teacher/Discussion" target=frmright>讨论区</a></li></br></br></br></br>
</ul>
                                                                                


</body>
</html>