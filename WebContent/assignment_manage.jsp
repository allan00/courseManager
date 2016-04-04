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
<script language=javascript>
function select(){
if(document.studentListForm.selectAll.checked){
document.studentListForm.selectAll.checked = document.studentListForm.selectAll.checked&0;
}
}
function CheckAll(form){
for (var i=0;i<form.elements.length;i++){
var e = form.elements[i];
if (e.Name != 'selectAll'&&e.disabled==false)
e.checked = form.selectAll.checked;
}
}
</script>
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
		   <li><a href="<%=path %>/Teacher/MessageList" >通知公告</a></li>
           <li><a href="<%=path %>/Teacher/TeacherCourseList" >视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" >作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" >学生管理</a></li>
          <li><a href="<%=path %>/Teacher/FileList" >资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" >讨论区</a></li>
	 </ul>
</div>
<div class="mainzuoye">
<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span><input type="button" value="搜 索" class="btnsousuo" /></span>
            
      </span>
      <div class="btn">
      <div class="shanchu"><a href=javascript:studentListForm.submit();><img src="<%=path %>/image/teacher/shanchu.png"  /></a></div>
            <div class="shanchu"><a href="<%=path %>/assignment_add.jsp"><img src="<%=path %>/image/teacher/tianjia.png"  /></a></div>
       </div>
</div>
      <div class="xianzhi"></div>
 <div class="list">   <!--列表块 -->
         <form name="studentListForm" id="studentListForm" action="<%=path %>/Teacher/AssignmentDeleteChecked?type=manage" method="post" >
             
          <div class="listtitle">  <!--列表项 -->
               <span><input type='checkbox' name='selectAll' id="selectAll"  onclick='CheckAll(this.form)'  /></span>    <!--复选框 -->
               <span class="tongzhititle">标题</span> 
               <span class="tongzhiaction">操作</span>
               <span class="tongzhidate">发布时间</span>
               <span class="tongzhidate"> 截止时间</span>
          </div>
             <c:forEach var="assignment" items="${assignment_list}">
          <div class="list1">  <!--列表项 -->
               <span><input type="checkbox"   id="checkList" name="checkList"  onclick='select()' value="${assignment.id }"/></span>    <!--复选框 -->
               <span class="tongzhititle">${assignment.title }</span> 
               <span class="tongzhiaction">
                     <span class="btntongzhiaction">
                           <a href="<%=path %>/Teacher/AssignmentDetail?id=${assignment.id }"><img src="<%=path %>/image/teacher/chakan.png" /></a>
                     </span>
                     <span class="btntongzhiaction">
                          <a href="<%=path %>/Teacher/AssignmentDetail?id=${assignment.id }&type=update"><img src="<%=path %>/image/teacher/bianji.png" /></a>
                     </span>
               </span>
               <span class="tongzhidate">2016/4/2</span>
               <span class="tongzhidate">2016/4/2</span>
          </div>
          </c:forEach>
          </form>
     </div>



</body>
</html>
