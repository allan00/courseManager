<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加课程</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="logo">课程管理系统</div>

<div class="jiange">
     <div class="btnchange">
          <a href="teacherxiugaimima.html"><img src="<%=path %>/image/teacher/xiugaimima.jpg" /></a>
     </div>
</div>
 <form name="form" action="<%=path %>/Teacher/CourseAdd" method="post">
<div class="mainkecheng">
     <div class="juzhong"></div>
    
     <div class="juzhong">
          <span class="mingcheng">课程名称：</span>
          <span class="neirong"><input type="text" class="text"id="name" name="name" /></span>
     </div>
     <div class="btntianjiakecheng">
          <div><input type="submit" name="subm" value="添加课程"  onclick="this.disabled='false'"  /></div>
      </div>      
</div>

 </form>
      

</body>
</html>
