<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'firstMenu.jsp' starting page</title>

	</head>
			<script type="text/javascript">
    	function findSecondMenus(){
    		var v = document.getElementById('fMenus').value;
    		if(v != '0'){
    			document.location = '<%=path%>/menu.do?cmd=findSecondMenusByPid&pid='+v;
    		}
    		else{
    			return false;
    		}
    	}
    	
    	function delSecondMenu(id){
    		var v = window.confirm('确定删除当前菜单吗？');
    		if(v){
    			document.location = '<%=path%>/menu.do?cmd=delSecondMenuById&pid=${pid}&id='+id;
    		}
    		else{
    			return false;
    		}
    	}
    	
    	function updateSecondMenu(id,n){
    		if(document.getElementById(id).value == n){
    			alert('未做任何改动！');
    			return false;
    		}
    		document.getElementById("name").value = document.getElementById(id).value;
    		document.getElementById("id").value = id;
    		document.all.updateForm.submit();
    	}
    	
    	function addSecondMenu(){
    		if(document.getElementById('secondMenuName').value==''){
    			alert('菜单名不能为空！');
    			return false;
    		}
    		document.all.addMenuForm.submit();
    	}
    </script>

	<body bgcolor="#abcedf">
		<h3>
			<font style="font-size:12px">二级菜单管理</font>
		</h3>
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
		<c:forEach items="${secondMenus}" var="secondMenu">
			<input type="text" id="${secondMenu.id}" name="${secondMenu.id}"
				value="${ secondMenu.name}">
			<input type="button" value="修 改"
				onclick="updateSecondMenu('${secondMenu.id }','${secondMenu.name}');">
			<input type="button" value="删 除"
				onclick="delSecondMenu('${secondMenu.id }');">
			<br />
		</c:forEach>
		<form action="<%=path%>/menu.do?cmd=updateSecondMenu"
			name="updateForm" method="POST" style="font-size:12px">
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="name" name="name">
			<input type="hidden"  id="pid" name="pid" value="${pid }">
		</form>

		<c:if test="${!empty pid}">
			<hr>
			<form action="<%=path%>/menu.do?cmd=addSecondMenu"
				name="addMenuForm" method="POST" style="font-size:12px">
				<input type="hidden" name="pid" value="${pid }">
				<input type="text" id="secondMenuName" name="secondMenuName">
				<input type="button" value="添加二级菜单" onclick="addSecondMenu();">
			</form>
		</c:if>

	</body>
</html>
