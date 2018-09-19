<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'firstMenu.jsp' starting page</title>
    <script type="text/javascript">
    	function delInfo(){
    		if(document.getElementById('name').value='在此添加一级菜单'){
    			document.getElementById('name').value='';
    		}
    	}
    	
    	function addMenu(){
    		if(document.getElementById('name').value==''){
    			alert('菜单名不能为空！');
    			document.getElementById('name').focus();
    			return false;
    		}
    		document.getElementById('menuForm').submit();
    	}
    	
    	function delMenu(id){
    		var v = window.confirm('确定删除当前记录吗？');
    		if(v){
    			document.location='<%=path%>/menu.do?cmd=delMenu&id='+id;
    		}
    		else{
    			return false;
    		}
    		
    	}
    	
    	function updateMenu(id,n){
    		var name=document.getElementById(id).value;
    		if(name == n){
    			alert('未做任何改动！');
    			return false;
    		}
    		document.getElementById('menuName').value=name;
    		document.getElementById('id').value=id;
    		document.getElementById('updateForm').submit();
    	}
    </script>
  </head>
  
  <body bgcolor="#abcedf">
    <h3><font style="font-size:12px">一级菜单管理</font></h3>
    <form action="<%=path %>/menu.do?cmd=addMenu" name="menuForm" method="POST" style="font-size:12px">
    	<input type="text" id="name" name="name" value="在此添加一级菜单" onclick="delInfo();">
    	<input type="button" value="添 加" onclick="addMenu();">
    </form>
    <hr>
    
    <form name="updateForm" action="<%=path%>/menu.do?cmd=updateMenu" method="POST" style="font-size:12px">
    	<input type="hidden" id="menuName" name="menuName">
    	<input type="hidden" id="id" name="id">
    </form>
    <c:forEach items="${firstMenus}" var="menu">
    	<input type="text" value="${menu.name }" name="${menu.id }">
    	<input type="button" value="修 改" onclick="updateMenu('${menu.id }','${menu.name }');">
    	<input type="button" value="删 除" onclick="delMenu('${menu.id }');">
    	<br/>
    </c:forEach>
  </body>
</html>
