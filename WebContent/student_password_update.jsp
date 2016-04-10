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
<title>无标题文档</title>
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
<div class="alltitle">个人中心</div>
<div class="main">
<form id="meg" name="meg" action="<%=path %>/Student/StudentPasswordUpdate?id=${student.student_id }" method="post">
     <div class="mimachange">
          <span class="mingcheng">新密码：</span>
          <span class="neirong"><input type="password" class="text" id="password" name="password"/></span>
     </div>
     <div class="mimachange">
          <span class="mingcheng">密码确认：</span>
          <span class="neirong"><input type="password" class="text"  id="password_sure" name="password_sure"/></span>
      </div>
      <div><input type="submit" value="修 改" class="btntijiao"  onclick="this.disabled='true'"/></div>
      </form>
</div>
</div>

</body>
</html>