<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.argorse.news.domain.News"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	News news = (News) request.getAttribute("news");
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
			action="<%=request.getContextPath()%>/news.do?method=delImg&id=${news.id}"
			method="post">
			<table align="center" style="font-size:12px">
				<tr>
					<td>
					   <c:if test="${news.img_path!=null}">
						<img
							src="<%=request.getContextPath()%>/userfiles/upload_img/<%=news.getImg_path()%>">
							</c:if>
					</td>
				</tr>
			</table>
			<table align="center">
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
