<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@page import="com.argorse.admin.domain.Admin;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Admin admin = (Admin)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect(basePath+"manage/admin/login.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>亚格斯网站后台管理系统</title>
<style>
body
{
  scrollbar-base-color:#C0D586;
  scrollbar-arrow-color:#FFFFFF;
  scrollbar-shadow-color:DEEFC6;
}
</style>
</head>
<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=path%>/manage/top.jsp" name="topFrame" scrolling="no">
  <frameset cols="180,*" name="btFrame" frameborder="NO" border="0" framespacing="0">
    <frame src="<%=path%>/manage/menu.jsp" noresize name="menu" scrolling="yes">
    <frame src="<%=path%>/manage/main.jsp" noresize name="main" scrolling="yes">
  </frameset>
</frameset>
<noframes>
	<body></body>
</noframes>
</html>