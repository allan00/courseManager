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
<div class="logo">课程管理系统</div>
<div class="top"></div>
<div class="jiange">
     
</div>
<div class="menu">
     <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" >通知公告</a></li>
           <li><a href="<%=path %>/Teacher/TeacherCourseList" >视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" >作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" >学生管理</a></li>
          <li><a href="<%=path %>/Teacher/FileList" >资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" >讨论区</a></li>
	 </ul>
</div>
<form name="form" action="<%=path %>/Teacher/MessageAdd" method="post" enctype="multipart/form-data">
<div class="maintongzhi">
     <div class="zuoyebiaoti">标题：<input type="text" name="title" id="title" class="text" /></div>
     <div class="zuoyebiaoti">发布人：<input type="text" name="author" id="author"/></div>
     <div class="zuoyejiezhiriqi"></div> 
   <label for="textarea"></label>
    <textarea id="content" name="content" class="zuoyeneirong" ></textarea>
     <div id = "dvTitles"></div>
      <input type="button" value="添加文件" onclick="addFile('dvTitles','file')"/>   
     <div class="juzhong">
          <div><input type="submit" name="but" id="but" " value="发布通知"  onclick="this.disabled='true'"/>
        <input type="reset" name="but_1" id="but_1" value="重新填写" /></div>
     </div>
</div>
</form>



</body>
</html>
