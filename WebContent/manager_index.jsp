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
<script language=javascript>
function select(){
if(document.studentListForm.selectAll.checked){
document.studentListForm.selectAll.checked = document.studentListForm.selectAll.checked&0;
}
}
function CheckAll(form){
for (var i=0;i<form.elements.length;i++){
var e = form.elements[i];
if (e.Name != 'selectAll'&&e.disabled==false)
e.checked = form.selectAll.checked;
}
}
</script>


<body>
<div class="bigmain">教师管理
     <div class="main">
          <span><input type="text" value="请输入关键字" class="textsousuo" /></span>
          <span><input type="button" value="搜 索" class="btnsousuo" /></span>
          <div class="btn">
               <div class="shanchu"><a href=javascript:studentListForm.submit();><img src="<%=path %>/image/manager/shanchu.png"  /></a></div>
               <div class="shanchu"><a href="<%=path %>/manager_teacher_add.jsp"><img src="<%=path %>/image/manager/tianjia.png"  /></a></div>
          </div>
          <div class="listtitle">  <!--列表项 -->
               <span><input type='checkbox' name='selectAll' id="selectAll"  onclick='CheckAll(this.form)' class="fuxuankuang"/> </span>    <!--复选框 -->
               <span class="teachnum">账号</span>
               <span class="teachname">姓名</span>
               <span class="teachsex">性别</span>
               <span class="teachschool">学院</span>
               <span class="teachtel">手机</span>
               <span class="teachaddr">地址</span>
               <span class="teachemail">邮箱</span>
               <span class="teachaction">操作</span>
          </div>
           <form name="studentListForm" id="studentListForm" action="<%=path %>/Manager/TeacherDeleteChecked" method="post" > 
            <c:forEach var="teacher" items="${teacher_list}">
          <div class="list">  <!--列表项 -->
              
               <span><input type="checkbox"   id="checkList" name="checkList"  onclick='select()' value="${teacher.id }" class="fuxuankuang"/> </span>    <!--复选框 -->
               <span class="teachnum">${teacher.account}</span>
               <span class="teachname">${teacher.name}</span>
               <span class="teachsex">${teacher.sex}</span>
               <span class="teachschool">${teacher.academy}</span>
               <span class="teachtel">${teacher.phone}</span>
               <span class="teachaddr">${teacher.address}</span>
               <span class="teachemail">${teacher.email}</span>
               <span class="teachaction">
                     <span class="btnaction" title="查看">
                           <a href="<%=path %>/Manager/TeacherDetail?id=${teacher.id}"><img src="<%=path %>/image/manager/chakan.png" /></a>
                     </span>
                     <span class="btnaction" title="编辑">
                           <a><img src="<%=path %>/image/manager/bianji.png" /></a>
                     </span>
               </span>
               
          </div>
          </c:forEach>
          </form>
          
          </div>
     </div>
</div>
</body>
</html>
