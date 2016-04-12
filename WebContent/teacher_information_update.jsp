<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher t = (Teacher)request.getSession().getAttribute("teacher");
int teacher_id = t.getId();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="/teacher_left.jsp"%>

<div class="maingerenzhongxin">
 <div class="biaogedaoru">
          <a href="<%=path %>/teacher_password_update.jsp"><img src="<%=path %>/image/teacher/xiugaimima.jpg" /></a>
     </div>
<form id="meg" name="meg" action="<%=path %>/Teacher/TeacherInformationUpdate?id=${teacher.id }" method="post">
     <div class="xinxikuaixinxixiugai">
          <div class="xinxi">
               <span class="xueshengmingcheng">账号：</span>
               <span class="xueshengneirong"><input type="text" name="account" id="account" class="text" value="${teacher.account }"/></span>
               <span class="xueshengmingcheng">姓名：</span>
               <span class="xueshengneirong"><input type="text" name="name" id="name" class="text" value="${teacher.name }"/></span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">性别：</span>
               <span class="xueshengneirong"><input type="text" name="sex" id="sex" class="text" value="${teacher.sex }"/></span>
               <span class="xueshengmingcheng">学院：</span>
               <span class="xueshengneirong"><input type="text" name="academy" id="academy" class="text" value="${teacher.academy }"/></span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">学历：</span>
               <span class="xueshengneirong"></span>
               <span class="xueshengmingcheng">地址：</span>
               <span class="xueshengneirong"><input type="text" name="address" id="address" class="text" value="${teacher.address }"/></span>
          </div>
          <div class="xinxi">
               <span class="xueshengmingcheng">邮箱：</span>
               <span class="xueshengneirong"><input type="text" name="email" id="email" class="text" value="${teacher.email }"/></span>
               <span class="xueshengmingcheng">手机：</span>
               <span class="xueshengneirong"><input type="text" name="phone" id="phone" class="text" value="${teacher.phone }"/></span>
          </div>
          <div><input type="submit" value="修 改" class="btntijiao"   onclick="this.disabled='true'"/>
      </div>
      
   
</div>

</form>
</div>

</body>
</html>
