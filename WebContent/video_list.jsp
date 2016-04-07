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
<title>视频列表</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
<style> 
#content{
	margin-top:30px;
	margin-left:50px;
}
#content article { 
float: left; 
margin-right: 4%; 
max-width: 236px; 
position: relative; 
width: 20%; 
margin-bottom: 3.5%; 
} 
#content article:nth-child(4n+4) { 
margin-right: 0; 
} 
.post-format-content { 
position: relative; 
background: #111; 
} 
.post-thumbnail { 
max-width: 100%; 
height: auto; 
overflow: hidden; 
} 
.content-wrap { 
padding: 0; 
position: absolute; 
text-align: center; 
width: 100%; 
top: 0; 
bottom: 0; 
display: table-cell; 
vertical-align: middle; 
overflow: hidden; 
} 
.content-wrap h1.entry-title { 
display: table; 
font-size: 90%; 
height: 100%; 
text-transform: uppercase; 
width: 100%; 
margin:0; 
} 
.edit-link { 
z-index: 2; 
} 
.featured-image { 
display: table-cell; 
position: relative; 
transition: opacity .25s ease-in-out, background .25s ease-in-out; 
-moz-transition: opacity .25s ease-in-out, background .25s ease-in-out; 
-webkit-transition: opacity .25s ease-in-out, background .25s ease-in-out; 
vertical-align: middle; 
z-index: 1; 
color: #fff; 
text-decoration: none; 
opacity: 0; 
padding: 10%; 
} 
.featured-image:hover { 
opacity: 0.9; 
color:#FFF; 
background: rgba(0,0,0,0.8); 
} 
.post-thumbnail img { 
display: block; 
} 
img { 
max-width: 100%; 
height: auto; 
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

<div class="logo">课程管理系统</div>
<div class="jiange">
     <div class="btnchange">
         <a href="<%=path %>/Teacher/TeacherInformationList"><img src="<%=path %>/image/teacher/gerenzhongxin.jpg" /></a>
     </div>
     <div class="btnchange">
          <a href="teacherxiugaimima.html"><img src="<%=path %>/image/teacher/kecheng.jpg" /></a>
     </div>
</div>
<div class="menu">
     <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" >通知公告</a></li>
           <li><a href="<%=path %>/Teacher/VideoList" >视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" >作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" >学生管理</a></li>
          <li><a href="<%=path %>/Teacher/DocumentList" >资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" >讨论区</a></li>
	 </ul>
</div>
<div class="mainshipin">
     <div class="xianzhi">
          <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span ><input type="button"  value="搜 索"class="btnsousuo" /></span>
            
      </span>
      <!--<span ><input type="button"  class="btnguanli" /></span>-->
      <span class="btnshipinguanli">
          <a href="<%=path %>/Teacher/VideoList?type=manage"><img src="<%=path %>/image/teacher/btnshipinguanli.jpg" /></a>
     </span>
     <div id="content"> 
          <!--数据库原理-->
          <c:forEach var="V" items="${video_list}">
          <article class="post-152 post type-post status-publish format-standard hentry category-people category-photos"> 
                   <div class="post-format-content"> 
                        <div class="post-thumbnail"> 
                             <img width="480" height="480" src="<%=path %>/image/course/1.jpg"   class="attachment-thumbnail wp-post-image" alt="105694702"> 
                        </div> 
                        <div class="content-wrap"> 
                             <h1 class="entry-title"><a href="<%=path %>/Teacher/VideoDetail?id=${V.id }" class="featured-image" rel="bookmark">${V.name}</a></h1> 
                        </div> 
                   </div> 
          </article> 
          </c:forEach>
          
     </div>
</div>
</div>
</body>
</html>
