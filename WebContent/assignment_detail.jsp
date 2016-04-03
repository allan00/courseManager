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
<title>作业详情</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="jiange">
 <div class="zuoyeshangjiao">
          <a href="teacherxiugaimima.html"><img src="<%=path %>/image/teacher/yijiaozuoye.jpg" /></a>
     </div>
     <div class="zuoyeshangjiao">
          <a href="teacherxiugaimima.html"><img src="<%=path %>/image/teacher/weijiaoxuesheng.jpg" /></a>
     </div>  
     </div>

<div class="menu">
    <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" target=frmright>通知公告</a></li>
           <li><a href="<%=path %>/Teacher/TeacherCourseList" target=frmright>视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" target=frmright>作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" target=frmright>学生管理</a></li>
          <li><a href="<%=path %>/Teacher/FileList" target=frmright>资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" target=frmright>讨论区</a></li>
	 </ul>
</div>

<div class="mainzuoye">
     <div class="zuoyebiaoti">标题：${assignment.title }</div>
     <div  class="juzhong" ><span>发布时间：${assignment.date_begin }</span><span>截止时间：${assignment.deadline }</span></div>
     <div class="zuoyejiezhiriqi">${assignment.content }</div>
</div>

</body>
</html>
