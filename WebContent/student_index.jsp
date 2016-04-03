<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1002" border="0" align="center">
  <tr>
    <td colspan="2"><img src="images/top1.jpg" width="1002" height="186" /></td>
  </tr>
  <tr>
    <td width="210" height="556" background="images/left.jpg">
    <div id="templatemo_menu">
      <ul>  <li>  <a href="main.html" target="in" >通知公告</a></li>
            <li><a href="xx.html" target="in">个人信息</a></li>
            <li><a href="kc.html" target="in">我的课程</a></li>
            <li><a href="zy.html" target="in">我的作业</a></li>
            <li><a href="tl.html" target="in">讨论区</a></li>
          </ul>    	
    </div></td>
    <td width="788" align="center" valign="top">
    <iframe  width="100%" height="100%" frameborder="0" scrolling="no" src="main.html" name="in"></iframe></td>
  </tr>
  
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" background="images/below.jpg" class="wz">版权所有.维权必究</td>
  </tr>
</table>
 

<map name="Map" id="Map">
  <area shape="rect" coords="49,100,144,126" href="main.html" target="in" />
  <area shape="rect" coords="49,172,144,192" href="xx.html" target="in" />
  <area shape="rect" coords="53,237,143,258" href="kc.html" target="in" />
  <area shape="rect" coords="53,299,142,325" href="zy.html" target="in" />
  <area shape="rect" coords="55,363,143,394" href="tl.html" target="in" />
</map>
</body>
</html>
