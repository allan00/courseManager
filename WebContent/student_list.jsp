<%@page import="model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher teacher = (Teacher)request.getSession().getAttribute("teacher");
//request.getSession().setAttribute("teacher", null);//注销语句
request.setAttribute("teacher", teacher);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生管理</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
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
<%@include file="/teacher_left.jsp"%>
<div class="mainxuesheng">
<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span ><input type="button" value="搜 索" class="btnsousuo" /></span>
            
      </span>
      <div class="btn">
      <div class="shanchu"><a href=javascript:studentListForm.submit();><img src="<%=path %>/image/teacher/shanchu.png"  /></a></div>
            <div class="shanchu"><a href="<%=path %>/student_add.jsp"><img src="<%=path %>/image/teacher/tianjia.png"  /></a></div>
       </div>
</div>
      <form name="studentListForm" id="studentListForm" action="<%=path %>/Teacher/StudentDeleteChecked" method="post" >
      <div class="list">   <!--列表块 -->
          <div class="listtitle">  <!--列表项 -->
               <span><input type='checkbox' class="fuxuankuang" name='selectAll' id="selectAll"  onclick='CheckAll(this.form)'  /> </span>    <!--复选框 -->
               <span class="stuname">姓名</span>
               <span class="stunum">学号</span>
               <span class="stusex">性别</span>
               <span class="stumajor">专业</span>
               <span class="stuclass">班级</span>
               <span class="stuaction">操作</span>
          </div>
          <c:forEach var="student" items="${student_list}">
          <div class="list1">  <!--列表项 -->
               <span><input type="checkbox"  class="fuxuankuang" id="checkList" name="checkList"  onclick='select()' value="${student.student_id }"/> </span>    <!--复选框 -->
               <span class="stuname">${student.name }</span>
               <span class="stunum">${student.student_id }</span>
               <span class="stusex">${student.sex }</span>
               <span class="stumajor">${student.major }</span>
               <span class="stuclass">${student.clazz }</span>
               <span class="stuaction">
                     <span class="btntongzhiaction" title="查看">
                          <a href="<%=path %>/Teacher/StudentDetail?student_id=${student.student_id }"><img src="<%=path %>/image/teacher/chakan.png" /></a>
                     </span>
                     <span class="btntongzhiaction" title="编辑">
                          <a href="<%=path %>/Teacher/StudentDetail?id=${student.student_id }"><img src="<%=path %>/image/teacher/bianji.png" /></a>
                     </span>
               </span>
          </div>
          </c:forEach>
     
     </div>
      </form>
     <div class="page">
     <a href="<%=path %>/Teacher/StudentList?page=1" >首页</a>
     <c:if test="${page_current>1}"><a href="<%=path %>/Teacher/StudentList?page=${page_current-1}" >上一页</a></c:if>
     [
     <c:forEach var="i" begin="${(page_current-2)<1?1:(page_current-2) }" end="${page_current+2}">
     	<c:if test="${i>=1 and i<=page_count}"><a href="<%=path %>/Teacher/StudentList?page=${i}" >${i}&nbsp;&nbsp;</a></c:if>
     </c:forEach>
     ]
     
     <c:if test="${page_current<page_count}"><a href="<%=path %>/Teacher/StudentList?page=${page_current+1}" >下一页</a></c:if>
     <a href="<%=path %>/Teacher/StudentList?page=${page_count}" >尾页</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第${page_current}   页/共  ${page_count}页
  </div>
</div>



</body>
</html>
