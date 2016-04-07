<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Manager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message = request.getParameter("message");
Manager m = (Manager)request.getSession().getAttribute("manager");
int manager_id = m.getId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/manager.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="bigmain">教师管理
     <div class="main">
          <div class="btnchange">
               <a> 
                  <img src="<%=path %>/image/manager/bianji.jpg" />
               </a>
          </div>
          <div class="mess">
               <div class="messlist">
                    <span class="messname">账号：</span>
                    <span class="message">${teacher.account}</span>
                    <span class="messname">姓名：</span>
                    <span class="message">${teacher.name}</span>
               </div>
               <div class="messlist">
                    <span class="messname">性别：</span>
                    <span class="message">${teacher.sex}</span>
                    <span class="messname">地址：</span>
                    <span class="message">${teacher.address}</span>
               </div>
               <div class="messlist">
                    <span class="messname">邮箱：</span>
                    <span class="message">${teacher.email}</span>
                    <span class="messname">手机：</span>
                    <span class="message">${teacher.phone}</span>
               </div>
          </div>
      </div>
</div>
</body>
</html>
