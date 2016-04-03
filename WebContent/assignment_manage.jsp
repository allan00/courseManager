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
<title>无标题文档</title>
<link href="../css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="jiange">
     <div class="btnchange">
          <a href="teacherxiugaimima.html"><img src="<%=path %>/image/teacher/xiugaimima.jpg" /></a>
     </div>
     <div class="btnchange">
          <a href="teacherkecheng.html"><img src="<%=path %>/image/teacher/kecheng.jpg" /></a>
     </div>
</div>
<div class="menu">
     <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" target=frmright>通知公告</a></li>
           <li><a href="<%=path %>/Teacher/TeacherCourseList" target=frmright>视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" target=frmright>作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" target=frmright>学生管理</a></li>
          <li><a href="<%=path %>/Teacher/FileList" target=frmright>资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" target=frmright>讨论区</a></li>
	 </ul>
</div>
<div class="mainzuoye">
<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span><input type="button" value="搜 索" class="btnsousuo" /></span>
            
      </span>
      <div class="btn">
      <div class="shanchu"><a href="<%=path %>/Teacher/AssignmentDeleteChecked?type=manage"><img src="<%=path %>/image/teacher/shanchu.png"  /></a></div>
            <div class="shanchu"><a href="<%=path %>/assignment_add.jsp"><img src="<%=path %>/image/teacher/tianjia.png"  /></a></div>
       </div>
</div>
       
      <div class="list">   <!--列表块 -->
                
          <div class="listtitle">  <!--列表项 -->
               <span><input type="checkbox" /></span>    <!--复选框 -->
               <span class="tongzhititle">标题</span> 
               <span class="tongzhiaction">操作</span>
               <span class="tongzhidate">截止时间</span>
               <span class="tongzhidate">发布时间</span>
          </div>
            <c:forEach var="assignment" items="${assignment_list}">
          <div class="list1">  <!--列表项 -->
               <span><input type="checkbox" /></span>    <!--复选框 -->
               <span class="tongzhititle">${assignment.title }</span> 
               <span class="tongzhiaction">
                     <span class="btntongzhiaction">
                           <a href="<%=path %>/Teacher/AssignmentDetail?id=${assignment.id }"><img src="<%=path %>/image/teacher/chakan.png" /></a>
                     </span>
                     <span class="btntongzhiaction">
                           <a href="<%=path %>/Teacher/AssignmentDetail?id=${assignment.id }&type=update"><img src="<%=path %>/image/teacher/bianji.png" /></a>
                     </span>
               </span>
               <span class="tongzhidate">${assignment.date }</span>
               <span class="tongzhidate">${assignment.deadline }</span>
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
