<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.argorse.menu.service.impl.MenuServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	MenuServiceImpl ms = new MenuServiceImpl();
	List firstMenuList = ms.findAllFirstMenus();
	pageContext.setAttribute("firstMenuList", firstMenuList);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'orderbyFirstMenu.jsp' starting page</title>
		<script type="text/javascript">
    	function findSecondMenus(){
    		var v = document.getElementById('fMenus').value;
    		if(v != '0'){
    			document.location = '<%=path%>/menu.do?cmd=findSecondMenusByPid&m=updateSecondMenu&pid='+v;
    		}
    		else{
    			return false;
    		}
    	}
    </script>
	</head>

	<body bgcolor="#abcedf">
		<h2> 
			<font style="font-size:12px">二级菜单排序</font> 
		</h2>
		<form action="<%=path %>/menu.do?cmd=orderbySecondMenu" method="post" style="font-size:12px">
			<select id="fMenus" onchange="findSecondMenus();">
				<option value="0">
					选择一级菜单
				</option>
				<c:forEach items="${firstMenus}" var="firstMenu">
					<option <c:if test="${firstMenu.id==pid }">selected</c:if>
						value="${firstMenu.id }">
						${firstMenu.name }
					</option>
				</c:forEach>
			</select>
			<font style="font-size:12px">(一级菜单)</font>
			<hr>
			<br>
			<table style="font-size:12px">
			<c:forEach items="${secondMenus}" var="secondMenu">
				<tr>
					<td>${ secondMenu.name}</td>
					<td><input size="5" type="text" name="${secondMenu.id }" value="${secondMenu.orderby }"/></td>
				</tr>
			</c:forEach>
			</table>
			
			<input type="hidden" name="fid" value="${pid }">
			<input type="submit" value="submit">
		</form>
	</body>
</html>
