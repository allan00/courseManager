<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加课程</title>
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
<div class="top">
     <div class="close"><a title="退出登录" href="#">&#xe900 </a></div>
     <div class="logo">课程管理系统</div>
</div>

<div class="xiugai"></div>
<form name="form" action="<%=path %>/Teacher/CourseAdd" enctype="multipart/form-data">
<div class="mainkecheng">
     <div class="juzhong"></div>
     <div class="juzhong">
          <span class="mingcheng">课程名称：</span>
          <span class="neirong"><input type="text" class="text"id="name" name="name" /></span>
     </div>
     <div class="juzhong">
                <input type="text"  class="text" />
                <input type="button" onmousemove="f.style.pixelLeft=event.x-60;f.style.pixelTop=this.offsetTop;" value="浏览" size="30" onclick="f.click()" class="liulan"/>
                <input type="file" id="f" onchange="txt.value=this.value" name="f" style="height:26px;" class="files"  size="1" hidefocus/>
     </div>
     <div class="btntianjiakecheng">
          <div><input type="submit" name="subm" value="添加课程"  onclick="this.disabled='false'"  /></div>
     </div>
      
  
</div>
</form>



</body>
</html>
