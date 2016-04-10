<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Student t = (Student)request.getSession().getAttribute("student");
request.setAttribute("student", t);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>作业查看</title>
<link href="<%=path %>/css/studenttop.css" rel="stylesheet" type="text/css" />
</head>

<body>
<input type="hidden" id="msg" name="msg" value="<%=request.getAttribute("message")%>"/>
<script type="text/javascript">
 		var msg = document.getElementById('msg').value;
 		if(msg != null && msg != "null"){
			alert(msg);
		}
</script>
<div class="top">
    <div class="logo">
		<h1>课程管理系统</h1>
	</div>
    <div class="menu">
		<ul>
			<li><a href="<%=path %>/Student/StudentVideoList">课程学习</a></li>
			<li><a href="<%=path %>/Student/StudentAssignmentList">我的作业</a></li>
			<li><a href="<%=path %>/Student/StudentMessageList">通知公告</a></li>
			<li><a href="<%=path %>/Student/StudentDocumentList">资源下载</a></li>
			<li><a href="<%=path %>/Student/StudentDisscussionList">讨论区</a></li>
            <li><a href="<%=path %>/Student/StudentInformationList">个人中心</a></li>
		</ul>
    </div>
</div>
<div class="jiange">
     <div class="namekecheng">你正在学习的课程是：
          <a>${course.name }</a>; 授课老师是：
         <a class="bianhua" href="<%=path %>/student_teacher_information.jsp">${course_teacher.name}</a>
     </div>
     <div class="kechengxuanze"><a href="<%=path %>/Student/StudentWelcome"><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
<div class="bigmain">
<div class="alltitle">我的作业</div>
<div class="main">
   <div id="btnupload"><a href="<%=path %>/student_assignment_add.jsp?assignmentId=${assignment.id }"><img src="<%=path %>/image/student/shangchuan1.png"  /></a></div>
   <div class="gonggaobiaoti">
     <h4>${assignment.title }</h4></div>
     <div class="gonggaoriqi">发布日期：${assignment.date_begin }</div>
     <div class="gonggaojiezhiriqi">截止日期：${assignment.deadline }</div>
     <div class="gonggaoneirong">
     ${assignment.content}
     </div>
</div>
</div>
</body>
</html>
