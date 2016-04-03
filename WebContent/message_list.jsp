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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知管列表</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="jiange">
     <div class="btnchange">
          <a href="teacherxiugaimima.html"><img src="<%=path %>/image/teacher/xiugaimima.jpg" /></a>
     </div>
     <div class="btnchange">
          <a href="<%=path %>/Teacher/TeacherWelcome"><img src="<%=path %>/image/teacher/kecheng.jpg" /></a>
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
<div class="maintongzhi">
<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span ><input type="button"  value="搜 索"class="btnsousuo" /></span>
            
      </span>
      <!--<span ><input type="button"  class="btnguanli" /></span>-->
      <span class="btnguanli">
          <a href="<%=path %>/Teacher/MessageList?type=manage"><img src="<%=path %>/image/teacher/tongzhiguanli.jpg" /></a>
     </span>
      
</div>
       
      <div class="list">   <!--列表块 -->
          <div class="listtitle">  <!--列表项 -->
               <span class="biaoti">标题</span>   <!--通知标题 -->
               <span class="date">发布时间</span>
          </div>
  
      <c:forEach var="message" items="${message_list}">
       <div class="list1">  <!--列表项 -->
       
               <span class="biaoti"><a href="<%=path %>/Teacher/AssignmentDetail?id=${message.id }">${message.title }</a></span>   <!--通知标题 -->
               <span class="date">${message.date }</span>
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

</body>
</html>
