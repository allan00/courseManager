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
<title>教师列表</title>
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
<ul>
<li><a href="<%=path %>/StudentList">学生列表</a></li>
<li><a href="<%=path %>/TeacherList">教师列表</a></li>
<li><a href="<%=path %>/CourseList">课程列表</a></li>
</ul>
<table>
<tr>
<td>姓名</td><td>性别</td><td>电话</td><td>密码</td><td>操作</td>
</tr>
<c:forEach var="teacher" items="${teacher_list}">
    <tr>
      <td >&nbsp;${teacher.name }</td>
      <td >&nbsp;${teacher.sex }</td>
      <td >&nbsp;${teacher.phone}</td>
      <td >&nbsp;${teacher.password }</td>
      <td><a href="<%=path %>/TeacherDelete?id=${teacher.id }"  onclick="
 if(confirm('你确定要删除吗?')){	
		
	}else{
		return false;
		}	

 "}">删除</a>
        <a href="<%=path %>/TeacherDetail?id=${teacher.id }">修改</a></td>
      </tr>
</c:forEach>
</table></br>
<form id="tteacher" name="tteacher" action="<%=path %>/TeacherAdd" method="post">

姓名：&nbsp;&nbsp;<input id="name" name="name"/></br></br>
性别：&nbsp;&nbsp;<input id="sex" name="sex"/></br></br>
手机：&nbsp;&nbsp;<input id="phone" name="phone"/></br></br>
<input type="submit" name="subm" value="提交"  onclick="this.disabled='true'" style="margin-left:100px"/>
<input type="reset" name="res" value="重置" style="margin-left:100px"  onclick="
 if(confirm('你确定要重置吗?')){	
		
	}else{
		return false;
		}	

 "
/>
</form>
</center>

</body>
</html>