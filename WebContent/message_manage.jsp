<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
request.setAttribute("teacher", t);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知管理</title>
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
<%@include file="/teacher_left.jsp"%>
<div class="maintongzhi">
<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span><input type="button" value="搜 索" class="btnsousuo" /></span>
            
      </span>
      <div class="btn">
      <div class="shanchu"><a href=javascript:studentListForm.submit();><img src="<%=path %>/image/teacher/shanchu.png"  /></a></div>
            <div class="shanchu"><a href="<%=path %>/message_add.jsp"><img src="<%=path %>/image/teacher/tianjia.png"  /></a></div>
       </div>
</div>
          	<form name="studentListForm" id="studentListForm" action="<%=path %>/Teacher/MessageDeleteChecked?type=manage" method="post" >
       
      <div class="list">   <!--列表块 -->
          <div class="listtitle">  <!--列表项 -->
               <span><input type='checkbox' name='selectAll' id="selectAll"  onclick='CheckAll(this.form)'  /></span>    <!--复选框 -->
               <span class="tongzhititle">标题</span> 
               <span class="tongzhidate">操作</span>
                <span class="tongzhiaction">发布时间</span>
          </div>
           
       
        <c:forEach var="message" items="${message_list}">
          <div class="list1">  <!--列表项 -->
               <span><input type="checkbox"   id="checkList" name="checkList"  onclick='select()' value="${message.id }"/></span>    <!--复选框 -->
               <span class="tongzhititle">${message.title }</span> 
               <span class="tongzhiaction">
                     <span class="btntongzhiaction">
                           <a href="<%=path %>/Teacher/MessageDetail?id=${message.id }"><img src="<%=path %>/image/teacher/chakan.png" /></a>
                     </span>
                     <span class="btntongzhiaction">
                           <a href="<%=path %>/Teacher/MessageDetail?id=${message.id }&type=update"><img src="<%=path %>/image/teacher/bianji.png" /></a>
                     </span>
               </span>
               <span class="tongzhidate"><fmt:formatDate value="${message.date}" pattern="yyyy/MM/dd " /></span>
    
          </div>
          </c:forEach>
         
     </div>
       </form>
         <div class="page">
     <a href="<%=path %>/Teacher/MessageList?type=manage&page=1" >首页</a>
     <c:if test="${page_current>1}"><a href="<%=path %>/Teacher/MessageList?type=manage&page=${page_current-1}" >上一页</a></c:if>
     [
     <c:forEach var="i" begin="${(page_current-2)<1?1:(page_current-2) }" end="${page_current+2}">
     	<c:if test="${i>=1 and i<=page_count}"><a href="<%=path %>/Teacher/MessageList?type=manage&page=${i}" >${i}&nbsp;&nbsp;</a></c:if>
     </c:forEach>
     ]
     
     <c:if test="${page_current<page_count}"><a href="<%=path %>/Teacher/MessageList?type=manage&page=${page_current+1}" >下一页</a></c:if>
     <a href="<%=path %>/Teacher/MessageList?type=manage&page=${page_count}" >尾页</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第${page_current}   页/共  ${page_count}页
  </div>
</div>



</body>
</html>
