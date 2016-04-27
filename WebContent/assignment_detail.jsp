<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
     <div class="zuoyebiaoti"> 标题：${assignment.title }</div>
     <div  class="juzhong" ><span><font size=1px> 发布时间：<fmt:formatDate value="${assignment.date_begin }" type="both"/></span><span>&nbsp;&nbsp;&nbsp;截止时间：<fmt:formatDate value="${assignment.deadline }" type="both"/></font></span></div>
     <div class="zuoyejiezhiriqi">${assignment.content }</div>
     </br>  </br>  </br>
       <div class="zuoyejiezhiriqi"><font color="blue">附件：</font>
         <div class="list1">  <!--列表项 -->
		  <c:forEach var="son" items="${assignment_son_list}">
           <a href="<%=path %>${son.path}/${son.file_name}">${son.file_name}</a>
            </c:forEach>
           </div>
           </div>
    </br></br></br> </br> </br></br>     
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<font color="red">未提交作业：<c:forEach var="stu" items="${uncommitted_list}"></font>
           <span>${stu.name}</span>&nbsp;&nbsp;
            </c:forEach>
      </br></br></br>      
           &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;  <font color="green"> 已提交作业：
        <c:forEach var="son" items="${committed_list}"></font>
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
