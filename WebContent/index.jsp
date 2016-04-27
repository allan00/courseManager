<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="<%=path %>/css/main.css" rel="stylesheet" type="text/css" />
<style>
.photo{
	overflow:hidden;
	position:relative;
	float:left;
	width:580px;
	height:360px;
	margin-left:-39px;
	margin-top:-13px;
}
.photo .step{
	position:absolute;
	bottom:10px;
	right:15px;
	height:23px;
	z-index:2;
	color:#fff;
	font-size:14px;
	font-weight:bold;
	vertical-align:middle;
	cursor:pointer;
}
.photo .step em{margin:0 5px;}
.photo ul{
	float:left;
	position:absolute;
	top:0;
	left:0;
	width:2160px;
	list-style-type:none;
}
.photo li{
	float:left;
	background:#09e;
}
.photo li img{
	display:block;
	width:580px;
	height:360px;
}
.login_box{
	height:360px;
	width:480px;
	float:left;
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
      <span id="logo1">课程管理系统</span>
     <span id="logo2">Course Management System </span>
</div>
<div id="top">
    
</div>
<form id="loginForm" name="loginForm" method="post">
<div id="login">
    <div id="login-logo">Login</div>
    <div id="user">用户名：
         <span><input type="text"  name="username" id="user-text" value=""  /></span>
    </div>
    <div id="password">密   码：
         <span><input id="password-text" name="password" type="password" value=""  /></span>
    </div>
    <div id="change">
   
         <input type="radio" id="usertype" name="usertype" value="1" />学生
         <input type="radio" id="usertype" name="usertype" value="2" />教师
         <input type="radio" id="usertype" name="usertype" value="3" />管理员
      
    </div>
    <div id="btn">
         <span>
              <input type="button" name="subm" id="subm" value="登陆" onclick="return save_submit()"  class="btn1"/>         
         </span>
         <span>
              <input type="reset" name="reset" id="reset"  value="重  置" class="btn1"/>         
         </span>
    </div>
    
</div>
</form>
<div id="top">
    
</div>
<div id="main">
         <div class="photo" id="photo">
           <ul class="clear" id="photo-sub" style="width:2944px;">
               <li><a href="#" title="图片说明一" target="_blank"><img src="<%=path %>/image/main/1.jpg" alt="1"></a></li>
               <li><a href="#" title="图片说明二" target="_blank"><img src="<%=path %>/image/main/2.jpg" alt="2"></a></li>
               <li><a href="#" title="图片说明三" target="_blank"><img src="<%=path %>/image/main/3.jpg" alt="3"></a></li>
               <li><a href="#" title="图片说明四" target="_blank"><img src="<%=path %>/image/main/4.jpg" alt="4"></a></li>
           </ul>
           <div class="step" id="step-num"><span>上一页</span><em>1</em>/<em>3</em><span>下一页</span></div>
          </div>
</div>
<script type="text/javascript">
function photoAlbumn(photoObj,btnObj,numObj){
var moveNum = 1,
 _void=true,
 cloneObj,nums,
 voidClone=false,
 d=document,
 elem = d.getElementById(photoObj),
 btnObj=d.getElementById(btnObj),
 numObj=d.getElementById(numObj);
if (!elem) return false;
if (!btnObj) return false;
var elemObj = elem.getElementsByTagName("li"),
 autoWidth = elemObj[0].offsetWidth,
 btns = btnObj.getElementsByTagName("span"),
 max=elemObj.length;
 elem.style.width = (max+1)*autoWidth + "px";
var numElement =function(){
if(numObj){
 nums = numObj.getElementsByTagName("em");
 nums[1].innerHTML = max;
 nums[0].innerHTML = moveNum;
 }
}
var moveElement =function(final_x,final_y,interval){
 _void = false;
 var step = function () {
  if (elem.movement) clearTimeout(elem.movement);
  if (!elem.style.left) elem.style.left = "0px";
  if (!elem.style.top) elem.style.top = "0px";
  var xpos = parseInt(elem.style.left);
  var ypos = parseInt(elem.style.top);
  //alert(xpos)
  if (xpos == final_x && ypos == final_y) {
   _void = true;
if(voidClone){
  elem.style.left = (moveNum > 2)?(-(max-1)*autoWidth +"px"):"0px";
  elem.removeChild(cloneObj);
  voidClone = false;
 }
   return true;
  }
  if (xpos < final_x) {
    var dist = Math.ceil((final_x - xpos)/10);
    xpos = xpos + dist;
  }
  if (xpos > final_x) {
    var dist = Math.ceil((xpos - final_x)/10);
    xpos = xpos - dist;
  }
  if (ypos < final_y) {
    var dist = Math.ceil((final_y - ypos)/10);
    ypos = ypos + dist;
  }
  if (ypos > final_y) {
    var dist = Math.ceil((ypos - final_y)/10);
    ypos = ypos - dist;
  }
  elem.style.left = xpos + "px";
  elem.style.top = ypos + "px";
  elem.movement = setTimeout(function(){step()},interval);
}
 elem.movement = setTimeout(function(){step()},interval);
} ;
var moveAutoShow = function (){
 moveNum++;
 if(moveNum > max){
  cloneObj = elemObj[0].cloneNode(true);
  elem.appendChild(cloneObj);
  voidClone = true;
 }
 moveElement(-autoWidth*(moveNum-1),0,5);
 if(moveNum > max) moveNum=1;
 numElement();
};
var prepareSlideshow = function (){
 var moveAuto = setInterval(function(){moveAutoShow()},5000);
 btns[0].onmousedown = function() {
  if(!_void) return false;
  clearInterval(moveAuto);
  moveNum--;
    if(moveNum < 1){
  cloneObj = elemObj[(max-1)].cloneNode(true);
  cloneObj.style.cssText=";position:absolute;left:-" + autoWidth +"px";
  elem.insertBefore(cloneObj,elemObj[0]);
  voidClone = true;
 }
  moveElement(-autoWidth*(moveNum-1),0,5);
  moveAuto = setInterval(function(){moveAutoShow()},5000);
   if(moveNum < 1) moveNum=max;
  numElement();
 }
 btns[1].onmousedown = function() {
  if(!_void) return false;
  clearInterval(moveAuto);
  moveNum++;
   if(moveNum > max){
  cloneObj = elemObj[0].cloneNode(true);
  elem.appendChild(cloneObj);
  voidClone = true;
 }
  moveElement(-autoWidth*(moveNum-1),0,5);
  moveAuto = setInterval(function(){moveAutoShow()},5000);
  if(moveNum > max) moveNum=1;
  numElement();
 }
};
numElement();
prepareSlideshow();
}
photoAlbumn("photo-sub","photo","step-num");
</script>

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
	var usertype = 1;
	
	
	 var chkObjs = document.getElementsByName("usertype");
     for(var i=0;i<chkObjs.length;i++){
         if(chkObjs[i].checked){
        	 usertype =  chkObjs[i].value;    
        	 break;
         }
     }

     if(usertype==1){		
    		loginForm.action="<%=path%>/StudentLogin";}
    		
    	else if(usertype==2){
    			loginForm.action="<%=path%>/TeacherLogin";
    		}
    	else  if(usertype==3){
    		loginForm.action="<%=path%>/ManagerLogin";}
     
	loginForm.submit();
}
</script>

</body>
</html>
