<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<%@include file="/student_top.jsp"%> 
<div class="jiange">
     <div class="namekecheng">你正在学习的课程是：
          <a>${course.name}</a>; 授课老师是：
           <a class="bianhua" href="<%=path %>/student_teacher_information.jsp">${course_teacher.name}</a>
     </div>
     <div class="kechengxuanze"><a href="<%=path %>/Student/StudentWelcome"><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
<div class="bigmain">
<div class="alltitle">个人中心</div>
<div class="main">
<form id="meg" name="meg" action="<%=path %>/Student/StudentInformationUpdate?id=${student.student_id }" method="post">
   <c:forEach var="student" items="${student_list}"> 
<div id="btnchange">
          <a href="<%=path %>/student_password_update.jsp"><img src="<%=path %>/image/student/xiugaimima.jpg" /></a>
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
               <span class="neirong"><input type="text" name="email" id="email" class="text" value="${student.email }"/></span>
               <span class="mingcheng">手机：</span>
               <span class="neirong"><input type="text" name="phone" id="phone" class="text" value="${student.phone }"/></span>
           </div>
      </div>
      <div><input type="submit" value="保存" class="btntijiao" onclick="this.disabled='true'" />
      </div>
      </c:forEach>
      </form>
</div>
</div>
</body>
</html>
