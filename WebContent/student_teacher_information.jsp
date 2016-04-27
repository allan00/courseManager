<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student t = (Student)request.getSession().getAttribute("student");
request.setAttribute("student", t);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/studenttop.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="/student_top.jsp"%> 
<div class="jiange">
     <div class="namekecheng">你正在学习的课程是：
          <a>${course.name }</a>; 授课老师是：
          <a class="bianhua" href="<%=path %>/student_teacher_information.jsp">${course_teacher.name}</a>
     </div>
<div class="jiange">
     <div class="kechengxuanze"><a href="<%=path %>/Student/StudentWelcome"><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
</div>
<div class="bigmain">
<div class="alltitle">教师信息</div>
<div class="main">
     <div class="xinxikuai">
          <div class="xinxi">
               <span class="mingcheng">姓名：</span>
               <span class="neirong">${course_teacher.name} </span>
               <span class="mingcheng">性别：</span>
               <span class="neirong">${course_teacher.sex}  </span>
          </div>
          <div class="xinxi">
               <span class="mingcheng">学院：</span>
               <span class="neirong">${course_teacher.academy} </span>
               <span class="mingcheng">地址：</span>
               <span class="neirong">${course_teacher.address} </span>
          </div>
          <div class="xinxi">
               <span class="mingcheng">邮箱：</span>
               <span class="neirong">${course_teacher.email} </span>
               <span class="mingcheng">手机：</span>
               <span class="neirong">${course_teacher.phone} </span>
           </div>
      </div>
</div>
</div>
</body>
</html>
