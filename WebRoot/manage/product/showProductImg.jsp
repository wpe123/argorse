<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.argorse.product.domain.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">


		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>

	<body bgcolor="#abcedf">
		<form
			action="<%=request.getContextPath()%>/product.do?cmd=delImg&id=${product.id}"
			method="post" style="font-size:12px">
			<table align="center" style="font-size:12px">
				<tr>
					<td>
					 <c:if test="${product.path!=null}">
						<img
							src="<%=request.getContextPath()%>/userfiles/upload_img/<%=product.getPath()%>">
					</c:if></td>
				</tr>
			</table>
			<table align="center" style="font-size:12px">
				<tr>
					<td>
						<input type="button" onclick="javascript:history.go(-1)" value="返回" />
						<input type="submit" value="删除" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
