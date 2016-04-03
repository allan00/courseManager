<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
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
<center>
<ul>
<li><a href="<%=path %>/StudentList">学生列表</a></li>
<li><a href="<%=path %>/TeacherList">教师列表</a></li>
<li><a href="<%=path %>/CourseList">课程列表</a></li>
</ul>
</br></br>
<form id="tteacher" name="tteacher" action="<%=path %>/TeacherUpdate?id=${teacher.id }" method="post">

姓名：&nbsp;&nbsp;<input id="name" name="name" value="${teacher.name }"/></br></br>
性别：&nbsp;&nbsp;<input id="sex" name="sex" value="${teacher.sex }"/></br></br>
手机：&nbsp;&nbsp;<input id="phone" name="phone" value="${teacher.phone }"/></br></br>
密码：&nbsp;&nbsp;<input id="password" name="password" value="${teacher.password }"/></br></br>
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