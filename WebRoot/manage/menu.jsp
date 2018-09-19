<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>menu</title>
		<link rel="stylesheet" href="skin/css/base.css" type="text/css" />
		<link rel="stylesheet" href="skin/css/menu.css" type="text/css" />
		<script language='javascript'>var curopenItem = '1';</script>
		<script language="javascript" type="text/javascript"
			src="skin/js/frame/menu.js"></script>
	</head>
	<body>
		<table width='99%' height="100%" border='0' cellspacing='0'
			cellpadding='0'>
			<tr>
				<td style='padding-left: 3px; padding-top: 8px' valign="top">
					
					
					<dl class='bitem'>
						<dt onClick='showHide("items1_1")'>
							<b>产品管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items1_1'>
							<ul class='sitemu'>
								<li>
											<a href='<%=path %>/manage/product/addProduct.jsp' target='main'>添加产品</a>
								</li>
								<li>
									<a href='<%=path %>/product.do?cmd=findAllProduct' target='main'>产品列表</a>
								</li>

							</ul>
						</dd>
					</dl>
					
					
					<dl class='bitem'>
						<dt onClick='showHide("items2_1")'>
							<b>文章管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items2_1'>
							<ul class='sitemu'>
								<li>
											<a href='<%=path %>/article.do?cmd=addArticle' target='main'>添加文章</a>
								</li>
								<li>
									<a href='<%=path %>/article.do?cmd=findAllArticles' target='main'>文章列表</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					
					<dl class='bitem'>
						<dt onClick='showHide("items3_1")'>
							<b>菜单管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items3_1'>
							<ul class='sitemu'>
								<li>
											<a href='<%=path %>/menu.do?cmd=findFirstMenus' target='main'>一级菜单</a>
								</li>
								<li>
									<a href='<%=path %>/menu.do?cmd=secondMenus' target='main'>二级菜单</a>
								</li>
								<li>
									<a href='<%=path %>/manage/menu/orderbyFirstMenu.jsp' target='main'>一级菜单排序</a>
								</li>
								<li>
									<a href='<%=path %>/menu.do?cmd=secondMenus&m=updateSecondMenu' target='main'>二级菜单排序</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					
					<dl class='bitem'>
						<dt onClick='showHide("items4_1")'>
							<b>新闻管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items4_1'>
							<ul class='sitemu'>
								<li>
											<a href='<%=path %>/manage/news/addNews.jsp' target='main'>添加新闻</a>
								</li>
								<li>
									<a href='<%=path %>/news.do?method=selectNews' target='main'>新闻列表</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					
					<dl class='bitem'>
						<dt onClick='showHide("items5_1")'>
							<b>客户管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items5_1'>
							<ul class='sitemu'>
								<li>
											<a href='<%=path %>/manage/customer/addCustomer.jsp' target='main'>添加客户</a>
								</li>
								<li>
									<a href='<%=path %>/customer.do?method=selectCustomer' target='main'>客户列表</a>
								</li>
							</ul>
						</dd>
					</dl>
					
					
					<dl class='bitem'>
						<dt onClick='showHide("items6_1")'>
							<b>用户管理</b>
						</dt>
						<dd style='display: none' class='sitem' id='items6_1'>
							<ul class='sitemu'>
								<li>
											<a href='<%=path %>/manage/admin/adminInfo.jsp' target='main'>信息维护</a>
								</li>
							</ul>
						</dd>
					</dl>


				</td>
			</tr>
		</table>
	</body>
</html>