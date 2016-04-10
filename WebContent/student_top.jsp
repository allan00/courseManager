<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path1 = request.getContextPath();
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
String message = request.getParameter("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>...</title>
<link href="<%=path1 %>/css/studenttop.css" rel="stylesheet" type="text/css" />
<style>
#duiqi{
	margin-bottom:50px;
	margin-top:50px;
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
<div class="top">
    <div class="logo">
		<h1>课程管理系统</h1>
	</div>
    <div class="menu">
		<ul>
			<li><a href="<%=path1 %>/Student/StudentVideoList">课程学习</a></li>
			<li><a href="<%=path1 %>/Student/StudentAssignmentList">我的作业</a></li>
			<li><a href="<%=path1 %>/Student/StudentMessageList">通知公告</a></li>
			<li><a href="<%=path1 %>/Student/StudentDocumentList">资源下载</a></li>
			<li><a href="<%=path1 %>/Student/StudentDisscussionList">讨论区</a></li>
            <li><a href="<%=path1 %>/Student/StudentInformationList">个人中心</a></li>
		</ul>
    </div>
</div>
</body>
</html>
