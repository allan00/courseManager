<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Teacher t = (Teacher)request.getSession().getAttribute("teacher");


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
<form id="meg" name="meg" action="<%=path %>/Teacher/TeacherPasswordUpdate?id=${teacher.id }" method="post">
<div class="maingerenzhongxin">
     <div class="mimachange">
          <span class="mingcheng">新密码：</span>
          <span class="neirong"><input type="password" class="text" id="password" name="password" /></span>
     </div>
     <div class="mimachange">
          <span class="mingcheng">密码确认：</span>
          <span class="neirong"><input type="password" class="text"  id="password_sure" name="password_sure"/></span>
      </div>
      <div class="juzhong">
      <div><input type="submit" value="修 改" class="btntijiao" onclick="this.disabled='true'"/></div></div>
      </div>
      </form>
</body>
</html>
