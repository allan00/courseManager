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
<title>课程管理</title>
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

<div class="xiugai"></div>
<div class="mainkecheng">
    <div id="btngroup">
         <div class="btn">
             <div class="shanchu"><a href=javascript:studentListForm.submit();><img src="<%=path %>/image/teacher/shanchu.png"  /></a></div>
            <div class="shanchu"><a href="<%=path %>/course_add.jsp" ><img src="<%=path %>/image/teacher/tianjia.png"  /></a></div>
         </div>
     </div>
     <div class="list">   <!--列表块 -->
       	<form name="studentListForm" id="studentListForm" action="<%=path %>/Teacher/CourseDeleteChecked" method="post" >
     <c:forEach var="map" items="${course_list}">
          <div class="list1">  <!--列表项 -->
               <span><input type="checkbox"   id="checkList" name="checkList"  onclick='select()' value="${map.id }"/>
               </span>    <!--复选框 -->
               <span> <a href="<%=path %>/Teacher/CourseWelcome?course_id=${map.id }" >${map.name }</a></span>   <!--通知标题 -->  
          </div>
          
          </c:forEach>
          </form>
     </div>
      
     <div class="page">
     <a href="<%=path %>/Teacher/TeacherWelcome?page=1" >首页</a>
     <c:if test="${page_current>1}"><a href="<%=path %>/Teacher/TeacherWelcome?page=${page_current-1}" >上一页</a></c:if>
     [
     <c:forEach var="i" begin="${(page_current-2)<1?1:(page_current-2) }" end="${page_current+2}">
     	<c:if test="${i>=1 and i<=page_count}"><a href="<%=path %>/Teacher/TeacherWelcome?page=${i}" >${i}&nbsp;&nbsp;</a></c:if>
     </c:forEach>
     ]
     
     <c:if test="${page_current<page_count}"><a href="<%=path %>/Teacher/TeacherWelcome?page=${page_current+1}" >下一页</a></c:if>
     <a href="<%=path %>/Teacher/TeacherWelcome?page=${page_count}" >尾页</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第${page_current}   页/共  ${page_count}页
  </div>
  
</div>



</body>
</html>
