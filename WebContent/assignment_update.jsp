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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<SCRIPT language=javascript>
function check_file()
{
  var strFileName=form1.FileName.value;
  if (strFileName=="")
  {
    alert("请选择要上传的文件");
    return false;
  }
}
</SCRIPT>
<script language="javascript">
// javascript 动态添加 input type="file"
var i = 1;
function addFile(dvID, inputNamePrefix)
{
  var dv = document.getElementById(dvID);
  var file = document.createElement("input");
  file.type = "file";
  file.id = file.name = inputNamePrefix + i;

  dv.appendChild(file);

  var btn =  document.createElement("input");
  btn.type = "button";
  btn.id = btn.name = "btn" + i;
  btn.value = "删除" ;

  btn.onclick = function() {
var b = document.getElementById(btn.id);
dv.removeChild(b.nextSibling); //remove <BR>
dv.removeChild(b.previousSibling); //file
dv.removeChild(b); //btn
  }
  dv.appendChild(btn);
  dv.appendChild(document.createElement("BR"));

  i++;
}
</script>
<title>通知添加</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
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

<div class="jiange">
     
</div>
<div class="menu">
   <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" >通知公告</a></li>
           <li><a href="<%=path %>/Teacher/VideoList" >视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" >作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" >学生管理</a></li>
          <li><a href="<%=path %>/Teacher/DocumentListt" >资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" >讨论区</a></li>
	 </ul>
</div>

<div class="mainzuoye">
<form id="meg" name="meg" action="<%=path %>/Teacher/AssignmentUpdate?id=${assignment.id }" method="post">
     <div class="zuoyebiaoti">标题：<input type="text" name="title" id="title" class="text" value="${assignment.title }"/></div>
     <div class="zuoyebiaoti"> <label for="meeting">截止日期：</label><input type="date" name="deadline" id="deadline" value="${assignment.deadline}" /></div>
     <div class="zuoyejiezhiriqi"></div> 
   <label for="textarea"></label>
    <textarea id="content" name="content" class="zuoyeneirong" value="${assingnment.content }" ></textarea>
     <div class="juzhong">
          <div><input type="submit" name="but" id="but" " value="发布"  onclick="this.disabled='true'"/>
        <input type="reset" name="but_1" id="but_1" value="重置" /></div>
     
     </form>
     </div>





</body>
</html>
