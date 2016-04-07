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
<title>个人信息</title>
<link href="<%=path %>/css/studenttop.css" rel="stylesheet" type="text/css" />
</head>

<body>
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
          <a>${course.name}</a>; 授课老师是：
          <a class="bianhua" href="#">小潘</a>
     </div>
     <div class="kechengxuanze"><a href="<%=path %>/Student/StudentWelcome"><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
<div class="bigmain">
<div class="alltitle">个人中心</div>
<div class="main">
<form id="meg" name="meg" action="<%=path %>/Student/StudentInformationUpdate?id=${student.student_id }" method="post">
   <c:forEach var="student" items="${student_list}"> 
<div id="btnchange">
          <a href="xueshengxiugaimima.html"><img src="<%=path %>/image/student/xiugaimima.jpg" /></a>
     </div>
     <div class="xinxikuai">
          <div class="xinxi">
               <span class="mingcheng">学号：</span>
               <span class="neirong">${student.student_id } </span>
               <span class="mingcheng">姓名：</span>
               <span class="neirong">${student.name} </span>
          </div>
          <div class="xinxi">
               <span class="mingcheng">性别：</span>
               <span class="neirong"> ${student.sex }</span>
               <span class="mingcheng">学院：</span>
               <span class="neirong">${student.academy }</span>
          </div>
          <div class="xinxi">
               <span class="mingcheng">专业：</span>
               <span class="neirong">${student.major }</span>
               <span class="mingcheng">班级：</span>
               <span class="neirong">${student.clazz }</span>
           </div>
           <div class="xinxi">
               <span class="mingcheng">邮箱：</span>
               <span class="neirong">${student.email }</span>
               <span class="mingcheng">手机：</span>
               <span class="neirong">${student.phone }</span>
           </div>
      </div>
      <div><input type="submit" value="修 改" class="btntijiao" />
      </div>
      </c:forEach>
      </form>
</div>
</div>
</body>
</html>
