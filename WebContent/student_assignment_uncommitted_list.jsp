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
          <a>${course.name}</a>; 授课老师是：
        <a class="bianhua" href="<%=path %>/student_teacher_information.jsp">${course_teacher.name}</a>
     </div>
     <div class="kechengxuanze"><a href="<%=path %>/Student/StudentWelcome"><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
<div class="bigmain">
<div class="alltitle">我的作业
<div>
	<a href="<%=path %>/Student/StudentAssignmentUncommittedList">未提交</a>
	<a href="<%=path %>/Student/StudentAssignmentCommittedList">已提交</a>
	<a href="<%=path %>/Student/StudentAssignmentAllList">所有</a>
</div>
</div>
<div class="main">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span ><input type="button" value="搜 索" class="btnsousuo" /></span>
      </span>
      <div class="list">   <!--列表块 -->
      
          
               <span >标题</span>   <!--通知标题 -->
               <span class="datetitle">截止日期</span>  <!--发布日期 -->
               <span class="datetitle">发布日期</span>  <!--发布日期 -->
     <c:forEach var="assignment" items="${assignment_list}"> 
          <div class="list1">  <!--列表项 -->
               <span ><a href="<%=path %>/Student/StudentAssignmentDetail?id=${assignment.id }">${assignment.title }</a></span>   <!--通知标题 -->
               <span class="overdate">${assignment.deadline}</span>  <!--截止日期 -->
               <span class="date">${assignment.date_begin}</span>  <!--发布日期 -->
         </div>
         </c:forEach>
     </div>
     
     <div class="page">
          <a href="#" >上一页</a>
          <a href="#" >1</a>
          <a href="#" >2</a>
          <a href="#" >3</a> 
          <a href="#" >...</a>
          <a href="#" >n</a>
          <a href="#" >下一页</a>    第   页/共  页
      </div>
</div>
</div>
</body>
</html>
