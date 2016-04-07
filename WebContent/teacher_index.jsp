<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
request.setAttribute("teacher", t);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程选择</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
<style> 
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
<div class="logo">课程管理系统</div>

<div class="xiugai">
     
</div>
<div class="mainkechengxuanze">
     <div id="btnkechengguanli">
          <a href="<%=path %>/Teacher/TeacherWelcome?type=manage">
             <img src="<%=path %>/image/teacher/btnkechengguanli.jpg" />
          </a>
     </div>
     <div id="content"> 
          <!--数据库原理-->
           <c:forEach var="map" items="${course_list}">
          <article class="post-152 post type-post status-publish format-standard hentry category-people category-photos"> 
                   <div class="post-format-content"> 
                        <div class="post-thumbnail"> 
                             <img width="480" height="480" src="<%=path %>/image/course/1.jpg"   class="attachment-thumbnail wp-post-image" alt="105694702"> 
                        </div> 
                        <div class="content-wrap"> 
                             <h1 class="entry-title"><a href="<%=path %>/Teacher/CourseWelcome?course_id=${map.id }"  class="featured-image" rel="bookmark">${map.name }</a></h1> 
                        </div> 
                   </div> 
          </article> 
          </c:forEach>
         





</div> 
      
  
  
</div>



</body>
</html>
