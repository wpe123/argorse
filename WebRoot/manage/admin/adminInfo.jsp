<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'adminInfo.jsp' starting page</title>
    <script type="text/javascript">
    	function updateAdmin(){
    		document.getElementById('adminForm').submit();
    	}
    </script>
  </head>
  
  <body bgcolor="#abcedf">
   <h3><font style="font-size:12px">修改用户密码</font></h3>
   <form name="adminForm" action="<%=path %>/admin.do?cmd=updateAdmin" method="POST" style="font-size:12px">
   	原密码：<input type="password" name="oldpassword"><br>
   	新密码：<input type="password" name="newpassword"><br>
   	<input type="button" value="确 认" onclick="updateAdmin();"><br><br>
   	<font color="green">${msg }</font>
   </form>
  </body>
</html>
