<%@page import="model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Teacher teacher = (Teacher)request.getSession().getAttribute("teacher");
//request.getSession().setAttribute("teacher", null);//注销语句
request.setAttribute("teacher", teacher);
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
<title>学生列表</title>
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
<body align="center">
<input type="hidden" id="msg" name="msg" value="<%=request.getAttribute("message")%>"/>
   	<script type="text/javascript">
 		var msg = document.getElementById('msg').value;
 		if(msg != null && msg != "null"){
			alert(msg);
		}
 	</script>
<center>
<form action="<%=path %>/CourseStudentList" method="post" >
选择课程<select id="course" name="course">
<c:forEach var="map" items="${map_list}">
<option value=${map.id}>${map.name}</option>
</c:forEach>
</select>&nbsp;&nbsp;&nbsp;<input type="submit" value="确定"/></br>
</form>
<form name="studentListForm" id="studentListForm" action="<%=path %>/StudentAdd" method="post" >
<input type='checkbox' name='selectAll' id="selectAll" onclick='CheckAll(this.form)'  />全选/取消全选&nbsp;&nbsp;&nbsp;&nbsp;
<a  href="<%=path %>/StudentDeleteAll?student_id=${student.student_id }">批量删除</a></br>
<table>
<tr>
<td>选择</td><td>学号</td><td>姓名</td><td>性别</td><td>电话</td><td>邮箱</td><td>学院</td><td>年级</td><td>班级</td><td>专业</td><td>操作</td>
</tr>
<c:forEach var="student" items="${student_list}">
    <tr>
     <td ><input type="checkbox" value="${student.id }" name="checkList"  onclick='select()'/></td>    
      <td >&nbsp;${student.student_id }</td>
      <td >&nbsp;${student.name }</td>
      <td >&nbsp;${student.sex }</td>
      <td >&nbsp;${student.phone }</td>
      <td >&nbsp;${student.email }</td>
      <td >&nbsp;${student.academy }</td>
      <td >&nbsp;${student.grade }</td>
      <td >&nbsp;${student.clazz }</td>
      <td >&nbsp;${student.major }</td>
      <td ><a href="<%=path %>/StudentDelete?student_id=${student.student_id }"  onclick="
 if(confirm('你确定要删除吗?')){	
		
	}else{
		return false;
		}	

 ">删除</a>&nbsp;&nbsp;
      <a href="<%=path %>/StudentDetail?student_id=${student.student_id }">修改</a></td> 
      </tr>
</c:forEach>
</table></br>
<form id="tstudent" name="tstudent" action="<%=path %>/StudentAdd" method="post">
学号：&nbsp;&nbsp;<input id="student_id" name="student_id"/></br></br>
姓名：&nbsp;&nbsp;<input id="name" name="name"/></br></br>
性别：&nbsp;&nbsp;<input id="sex" name="sex"/></br></br>
手机：&nbsp;&nbsp;<input id="phone" name="phone"/></br></br>
邮箱：&nbsp;&nbsp;<input id="email" name="email"/></br></br>
学院：&nbsp;&nbsp;<input id="academy" name="academy"/></br></br>
年级：&nbsp;&nbsp;<input id="grade" name="grade"/></br></br>
班级：&nbsp;&nbsp;<input id="clazz" name="clazz"/></br></br>
专业：&nbsp;&nbsp;<input id="major" name="major"/></br></br>
<input type="submit" name="subm" value="提1交"  onclick="this.disabled='true'" style="margin-left:100px"/>
<input type="reset" name="res" value="重置" style="margin-left:100px"  onclick="
 if(confirm('你确定要重置吗?')){	
		
	}else{
		return false;
		}	
 "/>                                                                                 
</form>
</center>
</body>
</html>