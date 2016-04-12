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
<title>作业查看</title>
<link href="<%=path %>/css/studenttop.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="/student_top.jsp"%> 
<div class="jiange">
     <div class="namekecheng">你正在学习的课程是：
          <a>${course.name }</a>; 授课老师是：
         <a class="bianhua" href="<%=path %>/student_teacher_information.jsp">${course_teacher.name}</a>
     </div>
     <div class="kechengxuanze"><a href="<%=path %>/Student/StudentWelcome"><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
<div class="bigmain">
<div class="alltitle">我的作业</div>
<div class="main">
   <div class="gonggaobiaoti">
     <h4>${assignment_answer.title }</h4></div>
     <div class="gonggaoriqi">提交日期：${assignment_answer.uploadTime }</div>
     <div class="gonggaoneirong">
     ${assignment_answer.content}
     </div>
    
     <div class="list1">  <!--列表项 -->
      <c:if test="${assignment_answer_son_list!=null}">附件：</c:if>
		  <c:forEach var="son" items="${assignment_answer_son_list}">
           <a href="<%=path %>${son.path}/${son.fileName}">${son.fileName}</a>
           </c:forEach>
           </div> 	
</div>
</div>
</body>
</html>
