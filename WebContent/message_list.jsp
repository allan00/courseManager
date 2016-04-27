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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>消息列表</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%@include file="/teacher_left.jsp"%> 
<div class="maintongzhi">
<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span ><input type="button"  value="搜 索"class="btnsousuo" /></span>
            
      </span>
      <!--<span ><input type="button"  class="btnguanli" /></span>-->
      <span class="btnguanli">
          <a href="<%=path %>/Teacher/MessageList?type=manage"><img src="<%=path %>/image/teacher/tongzhiguanli.jpg" /></a>
     </span>
      
</div>
       
      <div class="list">   <!--列表块 -->
          <div class="listtitle">  <!--列表项 -->
               <span class="biaoti">标题</span>   <!--通知标题 -->
               <span class="date">发布时间</span>
          </div>
     
           <c:forEach var="message" items="${message_list}">
       <div class="list1"> 
       
               <span class="biaoti"><a href="<%=path %>/Teacher/MessageDetail?id=${message.id }">${message.title }</a></span>   
               <span class="date"><fmt:formatDate value="${message.date}" pattern="yyyy/MM/dd " /></span>
          </div>
              </c:forEach>
     </div>
      
     <div class="page">
     <a href="<%=path %>/Teacher/MessageList?page=1" >首页</a>
     <c:if test="${page_current>1}"><a href="<%=path %>/Teacher/MessageList?page=${page_current-1}" >上一页</a></c:if>
     [
     <c:forEach var="i" begin="${(page_current-2)<1?1:(page_current-2) }" end="${page_current+2}">
     	<c:if test="${i>=1 and i<=page_count}"><a href="<%=path %>/Teacher/MessageList?page=${i}" >${i}&nbsp;&nbsp;</a></c:if>
     </c:forEach>
     ]
     
     <c:if test="${page_current<page_count}"><a href="<%=path %>/Teacher/MessageList?page=${page_current+1}" >下一页</a></c:if>
     <a href="<%=path %>/Teacher/MessageList?page=${page_count}" >尾页</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第${page_current}   页/共  ${page_count}页
  </div>
</div>



</body>
</html>
