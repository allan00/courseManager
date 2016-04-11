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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程选择</title>
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
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="xiugai">
    
</div>
<div class="mainkecheng">
    标题：${assignment_answer.title }
 学号：${assignment_answer.studentId }姓名：${assignment_answer.studentName }
 内容：${assignment_answer.content }
 附件：<c:forEach var="son" items="${son_list}">
           <a href="<%=path %>${son.path}/${son.fileName}">${son.fileName}</a>
     </c:forEach>
<form action="<%=path %>/Teacher/TeacherScoreAssignmentAnswer?assignmentId=${assignment_answer.assignmentId}&assignmentAnswerId=${assignment_answer.id}" method="post">
<input type="text" id="score" name="score"/>
<input type="submit" value="提交"/>
</form>
  
</div>



</body>
</html>
