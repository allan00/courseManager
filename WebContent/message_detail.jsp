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
<title>通知详情</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
<style>
#biaoti{
	margin-top:50px;
	margin-bottom:30px;
	text-align:center;
}
#namefujian{
	color:#03C;
	text-decoration:none;
	font-size:14px;
}
.btn2{
	text-align:center;
	margin-top:5px;
	padding:0;
}
</style>
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
     <div id="biaoti">${message.title }</div>
     <div  class="juzhong" ><span>发布人：${message.author }</span><span>发布时间：<fmt:formatDate value="${message.date }" type="both"/></span></div> 
     <div class="zuoyejiezhiriqi">内容：${message.content }</div>
    <div class="fujian">附件：<c:forEach var="son" items="${message_son_list}">
         <a href="<%=path %>${son.path}/${son.file_name}">${son.file_name}</a>
          </c:forEach></div>
</div>   




</body>
</html>
