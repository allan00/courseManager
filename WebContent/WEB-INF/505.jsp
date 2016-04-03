<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Hibernate"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>505</title>
    <meta http-equiv="imagetoolbar" content="no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body oncontextmenu="window.event.returnValue=false" style="margin-top:0px;background: url(<%=request.getContextPath()%>/images/error/505.gif);background-repeat: no-repeat;">
  </body>
</html>
