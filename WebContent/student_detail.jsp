<%@page import="model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Teacher teacher = (Teacher)request.getSession().getAttribute("teacher");
//request.getSession().setAttribute("teacher", null);//注销语句
request.setAttribute("teacher", teacher);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="/teacher_left.jsp"%>
<div class="mainxuesheng">
     <div class="xinxikuai">
          <div class="xinxi">
               <span class="xueshengmingcheng">学号：${student.student_id }</span>
               <span class="xueshengneirong"></span>
               <span class="xueshengmingcheng">姓名：${student.name}</span>
               <span class="xueshengneirong"></span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">性别：${student.sex}</span>
               <span class="xueshengneirong"></span>
               <span class="xueshengmingcheng">学院：${student.academy}</span>
               <span class="xueshengneirong"></span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">专业：${student.major}</span>
               <span class="xueshengneirong"></span>
               <span class="xueshengmingcheng">班级：${student.clazz}</span>
               <span class="xueshengneirong"></span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">邮箱：${student.email}</span>
               <span class="xueshengneirong"></span>
               <span class="xueshengmingcheng">手机：${student.phone}</span>
               <span class="xueshengneirong"></span>
          </div>
      </div>

</div>



</body>
</html>
