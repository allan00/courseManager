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
border: 1px solid ;
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
<ul>
<li><a href="<%=path %>/MessageAnnounce">下发通知</a></li>
<li><a href="<%=path %>/MessageList">通知管理</a></li>
</ul>

<form name="form" action="<%=path %>/Teacher/MessageAdd?course_id=${course.id}" method="post" enctype="multipart/form-data">

 标题：<input type="text" name="title" id="title" size="30" /></br></br>
发布人：<input type="text" name="author" id="author"/></br></br>
<textarea id="content" name="content" class="ckeditor" rows="10" cols="80"></textarea></br></br>
  <div id = "dvTitles"></div>
  <input type="button" value="添加文件" onclick="addFile('dvTitles','file')"/>  &nbsp;&nbsp;</br>  
 <input type="submit" name="but" id="but" " value="发布通知"  onclick="this.disabled='true'"/>&nbsp;&nbsp;
 <input type="reset" name="but_1" id="but_1" value="重新填写" />
 </form>
			
   </center>
</body>
</html>