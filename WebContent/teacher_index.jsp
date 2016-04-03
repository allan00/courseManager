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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程选择</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="xiugai">
     <div class="btnchange">
          <a href="teacherxiugaimima.html"><img src="<%=path %>/image/teacher/xiugaimima.jpg" /></a>
     </div>
</div>
<div class="mainkecheng">
    <div class="xianzhi">
         <div class="btn">
            <div class="shanchu"><a href="<%=path %>/Teacher/CourseDeleteChecked"><img src="<%=path %>/image/teacher/shanchu.png"  /></a></div>
            <div class="shanchu"><a href="<%=path %>/course_add.jsp" ><img src="<%=path %>/image/teacher/tianjia.png"  /></a></div>
         </div>
     </div>
     <div class="list">   <!--列表块 -->
     <c:forEach var="map" items="${course_list}">
          <div class="list1">  <!--列表项 -->
               <span><input type="checkbox" id="fuxuankuang" />
               </span>    <!--复选框 -->
               <span ><a href="<%=path %>/Teacher/CourseWelcome?course_id=${map.id }" >${map.name }</a></span>   <!--通知标题 -->    
          </div>
           </c:forEach>
     </div>
      
     <div class="page">
          <a href="#" >上一页</a>
          <a href="#" >1</a>
          <a href="#" >2</a>
          <a href="#" >3</a> 
          <a href="#" >...</a>
          <a href="#" >n</a>
          <a href="#" >下一页</a>    第   页/共  页
  </div>
  
</div>



</body>
</html>
