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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知列表</title>
<link href="<%=path %>/css/teacher.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="logo">课程管理系统</div>


<div class="xianzhi">
      <span class="sousuo">
            <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
            <span ><input type="button"  value="搜 索"class="btnsousuo" /></span>
            
      </span>
      <!--<span ><input type="button"  class="btnguanli" /></span>-->
      <span class="btnguanli">
          <a href="<%=path %>/Manager/TeacherList?type=manage"><img src="<%=path %>/image/teacher/tongzhiguanli.jpg" /></a>
     </span>
      
</div>

      <div class="xianzhi"></div>
 <div class="list">   <!--列表块 -->
         <form name="studentListForm" id="studentListForm" action="<%=path %>/Teacher/AssignmentDeleteChecked?type=manage" method="post" >
             
          <div class="listtitle">  <!--列表项 -->
               <span><input type='checkbox' name='selectAll' id="selectAll"  onclick='CheckAll(this.form)'  /></span>    <!--复选框 -->
               <span class="tongzhititle">标题</span> 
               <span class="tongzhiaction">操作</span>
               <span class="tongzhidate">发布时间</span>
               <span class="tongzhidate"> 截止时间</span>
          </div>
             <c:forEach var="assignment" items="${assignment_list}">
          <div class="list1">  <!--列表项 -->
               <span><input type="checkbox"   id="checkList" name="checkList"  onclick='select()' value="${assignment.id }"/></span>    <!--复选框 -->
               <span class="tongzhititle">${assignment.title }</span> 
               <span class="tongzhiaction">
                     <span class="btntongzhiaction">
                           <a href="<%=path %>/Teacher/AssignmentDetail?id=${assignment.id }"><img src="<%=path %>/image/teacher/chakan.png" /></a>
                     </span>
                     <span class="btntongzhiaction">
                          <a href="<%=path %>/Teacher/AssignmentDetail?id=${assignment.id }&type=update"><img src="<%=path %>/image/teacher/bianji.png" /></a>
                     </span>
               </span>
               <span class="tongzhidate">2016/4/2</span>
               <span class="tongzhidate">2016/4/2</span>
          </div>
          </c:forEach>
          </form>
     </div>



</body>
</html>
