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
<title>资源列表</title>
<link href="<%=path %>/css/studenttop.css" rel="stylesheet" type="text/css" />
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
          <a>数据结构</a>; 授课老师是：
         <a class="bianhua" href="<%=path %>/student_teacher_information.jsp">${course_teacher.name}</a>
     </div>
     <div class="kechengxuanze"><a href="<%=path %>/Student/StudentWelcome"><img src="<%=path %>/image/student/kechengxuanze.jpg" /></a></div>
</div>
<div class="bigmain">
     <div class="alltitle">资源下载</div>
     <div class="main">        <!--网页主体 -->
          <span class="sousuo">
                <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
                <span><input type="button" value="搜 索" class="btnsousuo" /></span>
          </span>
          <span id="btndownload"><img src="<%=path %>/image/student/xiazai1.png"/></span>
    
    
          <div class="list">   <!--列表块 -->
          <div class="listtitle">  <!--列表项 -->
            <span><input type="checkbox"/></span>    <!--复选框 -->
            <span >标题</span>   <!--通知标题 -->
            <span class="datetitle">操作</span>  <!--发布日期 -->
          </div>
      <c:forEach var="doc" items="${document_list}">
          <div class="list1"> <!--列表项 --> 
               <span><input type="checkbox" /></span>    <!--复选框 -->
               <span><a href="#" =>${doc.file_name}</a></span>          <!--通知标题 -->
               <span class="date"><a href="<%=path %>${doc.path}/${doc.file_name}">下载</a></span>                        <!--发布日期 -->
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

</div>
</body>
</html>
