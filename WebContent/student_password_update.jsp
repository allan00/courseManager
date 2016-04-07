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
<title>修改密码</title>
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
<div class="biaotigeren"></div>
<div class="main">
     <div class="mimachange">
          <span class="mingcheng">新密码：</span>
          <span class="neirong"><input type="password" class="text" /></span>
     </div>
     <div class="mimachange">
          <span class="mingcheng">密码确认：</span>
          <span class="neirong"><input type="password" class="text" /></span>
      </div>
      <div><input type="button" value="修 改" class="btntijiao" /></div>
</div>
<div class="footer">design by Remember</div>
</body>
</html>
