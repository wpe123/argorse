<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.argorse.menu.service.impl.MenuServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
MenuServiceImpl ms = new MenuServiceImpl();
List firstMenuList = ms.findAllFirstMenus();
pageContext.setAttribute("firstMenuList",firstMenuList);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'orderbyFirstMenu.jsp' starting page</title>
  </head>
  
  <body bgcolor="#abcedf">
  <h2><font style="font-size:12px">一级菜单排序</font></h2>
  <form action="<%=path %>/menu.do?cmd=orderbyFirstMenu" method="POST" style="font-size:12px">
   <c:forEach items="${firstMenuList}" var="fmenu">
    ${fmenu.name }
    <input size="5" type="text" name="${fmenu.id }" value="${fmenu.orderby }"/><br/>
   </c:forEach>
   <input type="submit" value="submit">
  </form>
   
  </body>
</html>
