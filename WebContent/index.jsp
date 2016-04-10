<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>课程管理系统</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="css/mylove.css" type="text/css" rel="stylesheet" />
 <link type="text/css" href="css/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
 <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <script type="text/javascript" src="js/jquery-ui-1.8.2.custom.min.js"></script>
 </head>

<body>
<input type="hidden" id="msg" name="msg" value="<%=request.getAttribute("message")%>"/>
<script type="text/javascript">
 		var msg = document.getElementById('msg').value;
 		if(msg != null && msg != "null"){
			alert(msg);
		}
</script>
   	
	<table width="1005" border="0" align="center">
		<tr>
			<td height="100" colspan="3" class="bg"><img
				src="images/top1.jpg" width="1002" height="186" /></td>
		</tr>
		<tr>
			<td height="9" colspan="3" bgcolor="#FFFFFF"><img src="" alt=""
				name="a" width="2" height="2" id="a" /></td>
		</tr>
		<tr valign="top">
			<td width="221" height="211" align="center" valign="top"
				bgcolor="#FFFFFF">
				<form id="loginForm" name="loginForm" method="post">
					<table width="219" border="0">
						<tr>
							<td width="69" height="37" align="right" bgcolor="#306BC7"
								class="wz">登录名：</td>
							<td width="117" height="37" bgcolor="#306BC7">
							<input
								name="username" id="username" type="text" size="15" value="20122101035"/></td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="35" align="right" bgcolor="#306BC7" class="wz">密码：</td>
							<td height="35" bgcolor="#306BC7"><input id="password"
								name="password" type="password" size="15" value="123456"/></td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="31" align="right" bgcolor="#306BC7" class="wz">身份：</td>
							<td height="31" bgcolor="#306BC7">
							<select name="userType"
								id="userType">
								<option value="1">学生</option>
									<option value="2">教师</option>
								    <option value="3">管理员</option>
							</select></td>
						</tr>
						<tr align="center" bgcolor="#FFFFFF">
							<td height="10" colspan="2" bgcolor="#306BC7">
							<input type="button" name="subm" id="subm" value="登陆" onclick="return save_submit()" action="" /> 
							<input type="reset" name="reset" id="reset" value="重置" /></td>
						</tr>
					</table>
					<p class="bg"></p>
					<p class="bg"></p>
				</form>
			</td>
			<td width="487" height="155" rowspan="2" bgcolor="#FFFFFF"><div>
					<iframe src="slide.html" width="480" height="280" frameborder="0"
						scrolling="no"></iframe>
				</div>
				<div id="buttons" onmouseout="startChange();"></td>
			<td width="286" height="155" rowspan="2" align="center"
				bgcolor="#99CCFF"><table width="283" height="280" border="0">
					<tr bgcolor="#33FF66">
						<td width="277" height="54" bgcolor="#B5D4F0"><img
							src="images/gonggao.png" width="280" height="49" /></td>
					</tr>
					<tr>
						<td height="124" bgcolor="#BDD1EC" class="wz"><marquee
								direction="up" height="124" scrollamount="3"
								onmouseover="this.stop()" onmouseout="this.start()">本周五课程将调至下周一，时间地点不变，广而告之！</marquee></td>
					</tr>
				</table></td>
		</tr>
		<tr valign="top">
			<td width="221" height="73" align="center" valign="top"
				bgcolor="#28579E"><img src="images/ptjj.png" width="199"
				height="73" /></td>
		</tr>
		<tr>
			<td height="30" valign="top" bgcolor="#28579E" class="wz">
				该平台供学生查看自己课程，作业完成情况，可下载资源，可参与老师与学生的互动。</td>
			<td width="487" height="267" valign="top" bgcolor="#FFFFFF"><table
					width="479" height="279" border="0">
					<tr>
						<td width="489" height="275" align="left" valign="top"><p>
								<img src="images/tz.jpg" width="479" height="43" />
							</p>
							<ul>
								<li class="wz"><a href="#" target="_blank">关于放假的通知</a></li>
								<li class="wz"><a href="#" target="_blank">关于期末考试答疑的相关安排</a></li>
								<li class="wz"><a href="#" target="_blank">第十四章的课件已经上传</a></li>
								<li class="wz"><a href="#" target="_blank">关于本周数据库课程的调课通知</a></li>
								<li class="wz"><a href="#" target="_blank">关于放假的通知</a></li>
								<li class="wz"><a href="#" target="_blank">关于期末考试答疑的相关安排</a></li>
								<li class="wz"><a href="#" target="_blank">第十四章的课件已经上传</a></li>
								<li class="wz"><a href="#" target="_blank">关于本周数据库课程的调课通知</a></li>
								<li class="wz"><a href="#" target="_blank">关于放假的通知</a></li>
							</ul>
							<p>&nbsp;</p></td>
					</tr>
				</table></td>
			<td width="286" height="267" align="center" valign="top"
				bgcolor="#99CCFF">
				<div id="calender">
					<div id="datepicker"></div>
				</div>
			</td>
		</tr>
		<tr>
			<td height="90" colspan="3" bgcolor="#BDD1EC">&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td height="49" colspan="3" align="center" bgcolor="#99CCFF"
				class="bg"><span class="wz">版权所有 2016 华南师范大学计算机学院 张静 林倩贤<br />
					Copyright ? School of computer Zhang jing Lin Qianxian
			</span></td>
		</tr>
	</table>
	

<script>
function checkLogin(){
    var username = loginForm.username.value;
    var password = loginForm.password.value;
		
	   if(username==""||username==null){
		alert("用户名不能为空");
		document.getElementById("username").value="";
		document.getElementById("username").focus();	
		return false;
		}
	   if(password==""||password==null){
		alert('密码不能为空');
		document.getElementById("password").value="";
		document.getElementById("password").focus();
		return false;
	}	
}

function save_submit(){
	if(checkLogin()==false){
		return false;
	}
		
	var loginForm = document.getElementById("loginForm");
	var userType = document.getElementById("userType").value;
	if(userType==1){		
	loginForm.action="<%=path%>/StudentLogin";}
	
	else if(userType==2){
		loginForm.action="<%=path%>/TeacherLogin";
		   }
	else  if(userType==3)
		{loginForm.action="<%=path%>/ManagerLogin";}
	loginForm.submit();
}
</script>
	
</body>


</html>
