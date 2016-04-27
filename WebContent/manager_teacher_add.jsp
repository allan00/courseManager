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
<title>老师添加</title>
<link href="<%=path %>/css/manager.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="bigmain">教师管理
<form name="form" action="<%=path %>/Manager/TeacherAdd" method="post">
     <div class="main">
          <div class="btnchange">
               <a href="<%=path %>/manager_excel_add.jsp"> 
                  <img src="<%=path %>/image/manager/biaogedaoru.jpg" />
               </a>
          </div>
          <div class="mess">
               <div class="messlist">
                    <span class="messname">账号：</span>
                    <span class="message">
                          <input type="text" class="text" id="account" name="account"/>
                    </span>
                    <span class="messname">姓名：</span>
                    <span class="message">
                          <input type="text" class="text" id="name" name="name" />
                    </span>
               </div>
               <div class="messlist">
                    <span class="messname">性别：</span>
                    <span class="message">
                          <input type="radio"  in="sex" name="sex" checked value="男" />男
                          <input type="radio" id="sex" name="sex" value="女" />女
                    </span>
                    <span class="messname">地址：</span>
                    <span class="message">
                          <input type="text" class="text" id="address" name="address"/>
                    </span>
               </div>
               <div class="messlist">
                    <span class="messname">邮箱：</span>
                    <span class="message">
                          <input type="text" class="text" id="email" name="email"/>
                    </span>
                    <span class="messname">手机：</span>
                    <span class="message">
                          <input type="text" class="text" id="phone" name="phone" />
                    </span>
               </div>
                <div class="messlist">
                    
                    <span class="messname">学院：</span>
                    <span class="message">
                          <input type="text" class="text" id="academy" name="academy"/>
                    </span>
               </div>
          </div>
          <div class="middle">
               <div><input type="submit" value="提 交" class="btnOK" onclick="this.disabled='true'"/></div>
          </div>
      </div>
      </form>
</div>
</body>
</html>
