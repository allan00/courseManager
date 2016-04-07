<%@page import="model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
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
<input type="hidden" id="msg" name="msg" value="<%=request.getAttribute("message")%>"/>
<script type="text/javascript">
 		var msg = document.getElementById('msg').value;
 		if(msg != null && msg != "null"){
			alert(msg);
		}
</script>
<div class="logo">课程管理系统</div>

<div class="jiange">
     <div class="biaogedaoru">
          <a href="/student_update.jsp"><img src="<%=path %>/image/teacher/xueshengbianji.jpg" /></a>
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
