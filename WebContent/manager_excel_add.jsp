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
          <div id="duiqi">
                <form method="post" action="<%=path %>/Manager/TeacherImport" enctype="multipart/form-data">
<input type="file" id="f" onchange="txt.value=this.value" name="f" style="height:26px;" class="files"  size="1" hidefocus />

<div class="juzhong">
          <div><input type="submit" value="导 入" class="btntijiao" /></div>
     </div>
     
     </form>
     </div>
</div>
</div>
</body>
</html>
