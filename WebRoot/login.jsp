<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户登录</title>
    <script type="text/javascript">
    	function login(){
    		document.getElementById('adminForm').submit();
    	}
    </script>
  </head>
  
  <body>
  <h2>用户登录</h2>
    <form action="<%=path %>/admin.do?cmd=login" method="POST" name="adminForm">
    用户名:<input type="text" name="name"><br>
    密码:<input type="password" name="password"><br>
    <input type="button" value="登录" onclick="login();">
    </form>
  </body>
</html>
