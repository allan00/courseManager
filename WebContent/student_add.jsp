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
		   <li><a href="<%=path %>/Teacher/MessageList" target=frmright>通知公告</a></li>
           <li><a href="<%=path %>/Teacher/TeacherCourseList" target=frmright>视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" target=frmright>作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" target=frmright>学生管理</a></li>
          <li><a href="<%=path %>/Teacher/FileList" target=frmright>资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" target=frmright>讨论区</a></li>
	 </ul>
</div>
<form name="form" action="<%=path %>/Teacher/StudentAdd" method="post">s
<div class="mainxuesheng">

     <div class="xinxikuai">
          <div class="xinxi">
               <span class="xueshengmingcheng">学号：</span>
               <span class="xueshengneirong"><input type="text" class="text" id="studet_id" name="student_id" /> </span>
               <span class="xueshengmingcheng">姓名：</span>
               <span class="xueshengneirong"><input type="text" class="text" id="name"  name="name"/> </span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">性别：</span>
               <span class="xueshengneirong"><input type="radio" id="sex" name="sex" checked value="man" >男<input type="radio" id="sex" name="sex" value="women" >女</span>
               <span class="xueshengmingcheng">学院：</span>
               <span class="xueshengneirong">
                     <select name="academy" id="academy" size="1" class="text">
                         <option>计算机学院</option>
                         <option>心理学院学院</option>
                         <option>数学科学学院</option>
                         <option>文学院</option>
                  </select>
               </span>
          </div>
           <div class="xinxi">
               <span class="xueshengmingcheng">专业：</span>
               <span class="xueshengneirong"><input type="text" class="text" id="major" name="major" /> </span>
               <span class="xueshengmingcheng">年级：</span>
               <span class="xueshengneirong">
                     <select name="grade" id="grade" size="1" class="text">
                         <option>2012级</option>
                         <option>2013级</option>
                         <option>2014级</option>
                         <option>2015级</option>
                  </select>
               </span>
          </div>
      </div>
     
      <div class="juzhong">
          <div><input type="button" value="提 交" class="btntijiao" /></div>
     </div>

</div>

 </form>

</body>
</html>
