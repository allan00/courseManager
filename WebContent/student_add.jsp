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
<title>学生添加</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="jiange">
     <div class="biaogedaoru">
          <a href="student_add_excel.jsp"><img src="<%=path %>/image/teacher/biaogedaoru1.jpg" /></a>
     </div>
</div>
<div class="menu">
      <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" >通知公告</a></li>
           <li><a href="<%=path %>/Teacher/TeacherCourseList" >视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" >作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" >学生管理</a></li>
          <li><a href="<%=path %>/Teacher/FileList" >资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" >讨论区</a></li>
	 </ul>
</div>
<form name="form" action="<%=path %>/Teacher/StudentAdd" method="post">
<div class="mainxuesheng">

     <div class="xinxikuai">
          <div class="xinxi">
               <span class="xueshengmingcheng">学号：</span>
               <span class="xueshengneirong"><input type="text" class="text" id="student_id" name="student_id" /> </span>
               <span class="xueshengmingcheng">姓名：</span>
               <span class="xueshengneirong"><input type="text" class="text" id="name"  name="name"/> </span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">性别：</span>
               <span class="xueshengneirong"><input type="radio" id="sex" name="sex" checked value="man" >男<input type="radio" id="sex" name="sex" value="women" >女</span>
               <span class="xueshengmingcheng">学院：</span>
               <span class="xueshengneirong">
                     <input type="text" class="text" id="academy" name="acdemy" />
               </span>
          </div>
           <div class="xinxi">
               <span class="xueshengmingcheng">专业：</span>
               <span class="xueshengneirong"><input type="text" class="text" id="major" name="major" /> </span>
               <span class="xueshengmingcheng">年级：</span>
               <span class="xueshengneirong">
                     <input type="text" class="text" id="grade" name="grade" />
               </span>
          </div>
      </div>
     
      <div class="juzhong">
          <div><input type="submit" name="but" id="but" " value="添加"  onclick="this.disabled='true'"/></div>
     </div>

</div>

 </form>

</body>
</html>
