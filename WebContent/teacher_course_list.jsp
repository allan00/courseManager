<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
font-size:12px;
}
table,tr,td,input{
border: 1px solid blue;
border-collapse:collapse;
font-size:14px;
vertical-align: middle;
}
td{
height:30px;
}
ul li {
	padding: 0;
	margin: 0;
	display: inline-block;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程列表</title>
</head>
<body align="center">
<input type="hidden" id="msg" name="msg" value="<%=request.getAttribute("message")%>"/>
   	<script type="text/javascript">
 		var msg = document.getElementById('msg').value;
 		if(msg != null && msg != "null"){
			alert(msg);
		}
 	</script>
<center>


<table>
<tr>
<td>课程名</td><td>状态</td><td>操作</td>
</tr>
<c:forEach var="map" items="${map_list}">
    <tr>
      

      <td >&nbsp;${map.name }</td>
      <td >&nbsp;${map.state }</td>
      <td><a href="<%=path %>/Teacher/CourseDelete?id=${map.id }"  onclick="
 if(confirm('你确定要删除吗?')){	
		
	}else{
		return false;
		}	

 "}">删除</a>
        <a href="<%=path %>/Teacher/SourseManager?id=${map.id }">资源管理</a>
        <a href='<%=path %>/Teacher/AbleCourse?id=${map.id }&state=<c:if test="${map.state=='开启'}" >0</c:if><c:if test="${map.state=='关闭'}" >1</c:if>
        '>
        <c:if test="${map.state=='开启'}" > <c:out value="关闭" /> </c:if>
        <c:if test="${map.state=='关闭'}" > <c:out value="开启" /> </c:if>
     	</a>
        </td>
		        
      </tr>
</c:forEach>
</table>

</br></br></br>
<form action="<%=path %>/Teacher/TeacherCourseAdd" method="post">
课程名称：<input type="text" name="courseName" style="margin-left:100px"/>
<input type="submit" name="subm" value="添加"  onclick="this.disabled='true'" style="margin-left:100px"/>
<form>
</center>
</body>
</html>