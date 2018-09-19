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
		<title>showProduct</title>
	</head>

	<body bgcolor="#abcedf">
	   <input type="button" onclick="javascript:history.go(-1)" value="返回" />
		<h3>
			<font style="font-size:12px">${product.title }</font>
			<br />
		</h3>
		<c:if test="${product.path!=null }">
		<font style="font-size:12px">产品图片 :&nbsp;</font>
		<img
			src="<%=request.getContextPath()%>/userfiles/upload_img/${product.path }">
        </c:if>
		<font style="font-size:12px">${product.content }<br/></font>
		<input type="button" onclick="javascript:history.go(-1)" value="返回" />
	</body>
</html>
