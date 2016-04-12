<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Teacher t = (Teacher)request.getSession().getAttribute("teacher");
int teacher_id = t.getId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>作业详情</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="/teacher_left.jsp"%>

<div class="mainzuoye">
     <div class="zuoyebiaoti">标题：${assignment.title }</div>
     <div  class="juzhong" ><span>发布时间：${assignment.date_begin }</span><span>截止时间：${assignment.deadline }</span></div>
     <div class="zuoyejiezhiriqi">${assignment.content }</div>
       <div class="zuoyejiezhiriqi">附件：
         <div class="list1">  <!--列表项 -->
		  <c:forEach var="son" items="${assignment_son_list}">
           <a href="<%=path %>${son.path}/${son.file_name}">${son.file_name}</a>
            </c:forEach>
           </div>
           </div>
    </br></br></br>              
          未提交作业：<c:forEach var="stu" items="${uncommitted_list}">
           <span>${stu.name}</span>&nbsp;&nbsp;
            </c:forEach>
      </br></br></br>      
            已提交作业：
          <c:forEach var="son" items="${committed_list}">
          <span>
          <a href="<%=path %>/Teacher/AssignmentAnswerDetail?assignmentAnswerId=${son.id}">${son.studentName}</a>
          <font color="red"><c:if test="${son.state==0}">(未批改)</c:if></font>
          <c:if test="${son.state==1}">(${son.score})</c:if>
          </span>
          </c:forEach>
	</div>

</div>
</body>
</html>
