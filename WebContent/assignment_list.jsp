<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Teacher t = (Teacher)request.getSession().getAttribute("teacher");
if(t==null){
	request.setAttribute("message", "你没有权限查看此页面");
	request.getRequestDispatcher("index.jsp").forward(request, response);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="/teacher_left.jsp"%>
<div class="mainzuoye">
<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span ><input type="button" value="搜 索" class="btnsousuo" /></span>
            
      </span>
      <span class="btnguanli">
          <a href="<%=path %>/Teacher/AssignmentList?type=manage"><img src="<%=path %>/image/teacher/btnzuoyeguanli.jpg" /></a>
     </span>
      
</div>
       
      <div class="list">   <!--列表块 -->
     
          <div class="listtitle">  <!--列表项 -->
               <span class="biaoti">标题</span>   <!--通知标题 -->
               <span class="date">截止日期</span>
          </div>
    
            <c:forEach var="assignment" items="${assignment_list}">
          <div class="list1">  <!--列表项 -->
        
               <span class="biaoti"><a href="<%=path %>/Teacher/AssignmentDetail?id=${assignment.id }">${assignment.title }</a></span>   <!--通知标题 -->
               <span class="date"><fmt:formatDate value="${assignment.deadline}" type="both"/></span>
                
          </div>
           </c:forEach>
          </div>
        
      
      <div class="page">
     <a href="<%=path %>/Teacher/AssignmentList?page=1" >首页</a>
     <c:if test="${page_current>1}"><a href="<%=path %>/Teacher/AssignmentList?page=${page_current-1}" >上一页</a></c:if>
     [
     <c:forEach var="i" begin="${(page_current-2)<1?1:(page_current-2) }" end="${page_current+2}">
     	<c:if test="${i>=1 and i<=page_count}"><a href="<%=path %>/Teacher/AssignmentList?page=${i}" >${i}&nbsp;&nbsp;</a></c:if>
     </c:forEach>
     ]
     
     <c:if test="${page_current<page_count}"><a href="<%=path %>/Teacher/AssignmentList?page=${page_current+1}" >下一页</a></c:if>
     <a href="<%=path %>/Teacher/AssignmentList?page=${page_count}" >尾页</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第${page_current}   页/共  ${page_count}页
  </div>
</div>



</body>
</html>
