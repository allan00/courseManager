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
<title>作业提交</title>
<link href="<%=path %>/css/studenttop.css" rel="stylesheet" type="text/css" />
<style>
#duiqi{
	margin-bottom:50px;
	margin-top:50px;
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
     <div class="kechengxuanze"><a><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
<div class="bigmain">
<div class="alltitle">我的作业</div>
<div class="main">
     <div id="duiqi">
     <form method="post" action="" enctype="multipart/form-data">
<input type="text" id="txt" name="txt" class="input"><input type="button" onmousemove="f.style.pixelLeft=event.x-60;f.style.pixelTop=this.offsetTop;" value="浏览" size="30" onclick="f.click()" class="liulan">
<input type="file" id="f" onchange="txt.value=this.value" name="f" style="height:26px;" class="files"  size="1" hidefocus>
</form>
     </div>
     <div><input type="button" value="提 交" class="btntijiao" />
      </div>

</div>
</div>
</body>
</html>
