<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path1 = request.getContextPath();
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
String message = request.getParameter("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>消息列表</title>
<link href="<%=path1 %>/css/teacher.css" rel="stylesheet" type="text/css" />
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
     <div class="close"><a title="退出登录" href="#">&#xe900 </a></div>
     <div class="logo">课程管理系统</div>
</div>
<div class="jiange">
     <div class="btnchange">
          <a href="<%=path1 %>/Teacher/TeacherInformationList"><img src="<%=path1 %>/image/teacher/gerenzhongxin.jpg" /></a>
     </div>
     <div class="btnchange">
         <a href="<%=path1 %>/Teacher/TeacherWelcome"><img src="<%=path1 %>/image/teacher/kecheng.jpg" /></a>
     </div>
</div>

<div class="menu">
     <ul>
     <li>
        <a href="<%=path1 %>/Teacher/MessageList" >通知公告</a>
         <dl>
             <dt><a href="<%=path1 %>/Teacher/MessageList" >通知列表</a></dt>
             <dt> <a href="<%=path1 %>/Teacher/MessageList?type=manage">通知管理</a></dt>
             <dt><a href="<%=path1 %>/message_add.jsp" >通知添加</a></dt>
             
         </dl>
     </li>
		<li >
          <a href="<%=path1 %>/Teacher/VideoList" >视频管理</a>
           <dl>
             <dt><a href="<%=path1 %>/Teacher/VideoList" >视频列表</a></dt>
             <dt> <a href="<%=path1 %>/Teacher/VideoList?type=manage">视频管理</a></dt>
             <dt><a href="<%=path1 %>/video_add.jsp" >视频添加</a></dt>
           </dl>
       </li>
		<li>
           <a href="<%=path1 %>/Teacher/AssignmentList">作业管理</a>
            <dl>
             <dt><a href="<%=path1 %>/Teacher/AssignmentList">作业列表</a></dt>
             <dt> <a href="<%=path1 %>/Teacher/AssignmentList?type=manage">作业管理</a></dt>
             <dt><a href="<%=path1 %>/assignment_add.jsp" >作业添加</a></dt>
            
            </dl>
        </li>
		<li>
            <a href="<%=path1 %>/Teacher/StudentList" >学生管理</a>
            <dl id="dl2">
             <dt><a href="<%=path1 %>/Teacher/StudentList" >学生列表</a></dt>
             <dt><a href="<%=path1 %>/Teacher/StudentList" >学生管理</a></dt>
             <dt><a href="<%=path1 %>/student_add.jsp" >学生添加</a></dt>
            
            </dl>
        </li>
		<li>
           <a href="<%=path1 %>/Teacher/DocumentList" >资源管理</a>
           <dl id="dl2">
             <dt><a href="<%=path1 %>/Teacher/DocumentList" >资源列表</a></dt>
             <dt><a href="<%=path1 %>/document_manage.jsp" >资源管理</a></dt>
             <dt><a href="<%=path1 %>/document_add.jsp" >资源添加</a></dt>
            </dl>
        </li>
       
	 </ul>
</div>




</body>
</html>
