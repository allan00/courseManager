<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
if(t==null){
	request.setAttribute("message", "你没有权限查看此页面");
	request.getRequestDispatcher("index.jsp").forward(request, response);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
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
<style>
#vd{
	margin-top:50px;
	margin-left:30px;
}
#duiqi{
	margin-bottom:50px;
	margin-top:150px;
	text-align:center;
}
input{border:none;border:1px solid #CCC;vertical-align:middle; }
.input {height:24px; line-height:24px; border-right:none; width:200px;}
.liulan {
	width:100px;height:26px;
	background-color:#7fbbdd;
    cursor:pointer;
}
.liulan:hover{
	-moz-opacity:0.68 !important; 
	filter:alpha(opacity=68); 
	opacity: 0.68; 
	 _-moz-opacity:0.68;
}
.files{	position:absolute; left:202px; top:52px; heigth:26px;cursor:pointer;
		 filter: Alpha(opacity=0);    
 			 -moz-opacity:0;    
 			 opacity:0;  
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
<div class="logo">课程管理系统</div>

<div class="jiange">
     
</div>
<div class="menu">
    <ul>
		   <li><a href="<%=path %>/Teacher/MessageList" >通知公告</a></li>
           <li><a href="<%=path %>/Teacher/VideoList" >视频管理</a></li>
            <li><a href="<%=path %>/Teacher/AssignmentList" >作业管理</a></li>
           <li><a href="<%=path %>/Teacher/StudentList" >学生管理</a></li>
          <li><a href="<%=path %>/Teacher/DocumentList" >资源管理</a></li>
           <li><a href="<%=path %>/Teacher/Discussion" >讨论区</a></li>
	 </ul>
</div>
<form name="form" action="<%=path %>/Teacher/VideoAdd" method="post" enctype="multipart/form-data">
<div class="mainshipin">
     <div class="juzhong"></div>
     <div class="juzhong"></div>
     <div class="juzhong">
          <span class="mingcheng">视频名称：</span>
          <span class="neirong"><input type="text" class="text" id="videoname" name="videoname"/></span>
     </div>
     
     <div class="juzhong">
     <div id = "dvTitles"></div>
      <input type="button" value="添加文件" onclick="addFile('dvTitles','file')"/> 
           <div class="btntianjiakecheng">
          <div><input type="submit" value="添加" class="btntijiao" /></div>
          </div>      
     </div> 
</div>
 </form>
     
</body>
</html>
