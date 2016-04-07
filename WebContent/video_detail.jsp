<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
int teacher_id = t.getId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频播放</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
<style>

#vd{
	margin-top:50px;
	margin-left:90px;
	padding-top:0px;
	background-color:#096
    width=600px;
	height=370px;
}

</style>
</head>

<body>
<div class="logo">课程管理系统</div>
<!--<div class="top"></div>-->
<div class="jiange">
     
</div>
<div class="menu">
    <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" >通知公告</a></li>
           <li><a href="<%=path %>/Teacher/VideoList" >视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" >作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" >学生管理</a></li>
          <li><a href="<%=path %>/Teacher/DocumentList" >资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" >讨论区</a></li>
	 </ul>
</div>
<div class="mainshipin">
     <div class="main">
     <div id="vd">
          <video src="<%=path %>${video.path}/${video.fileName}" width="580" height="330" controls autobuffer></video>
          <div>${video.name}</div>
          
     </div>
     </div>
</div>
</body>
</html>
