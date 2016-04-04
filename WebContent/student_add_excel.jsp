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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>学生导入</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
<style>
#duiqi{
	margin-bottom:50px;
	margin-top:150px;
	text-align:center;
}
input{border:none;border:1px solid #CCC;vertical-align:middle; }
.input {height:24px; line-height:24px; border-right:none; width:200px;}
.liulan {
	width:100px;height:26px;
	background-color:#7fbbdd;
    cursor:pointer;
}
.liulan:hover{
	-moz-opacity:0.68 !important; 
	filter:alpha(opacity=68); 
	opacity: 0.68; 
	 _-moz-opacity:0.68;
}
.files{	position:absolute; left:202px; top:52px; heigth:26px;cursor:pointer;
		 filter: Alpha(opacity=0);    
 			 -moz-opacity:0;    
 			 opacity:0;  
		} 

</style>
</head>

<body>
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="jiange"></div>
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
<div id="duiqi">
     <form method="post" action="" enctype="multipart/form-data">
<input type="text" id="txt" name="txt" class="input"><input type="button" onmousemove="f.style.pixelLeft=event.x-60;f.style.pixelTop=this.offsetTop;" value="浏览" size="30" onclick="f.click()" class="liulan">
<input type="file" id="f" onchange="txt.value=this.value" name="f" style="height:26px;" class="files"  size="1" hidefocus>
</form>
     </div>
     <div class="juzhong">
          <div><input type="button" value="导 入" class="btntijiao" /></div>
     </div>

</div>



</body>
</html>
