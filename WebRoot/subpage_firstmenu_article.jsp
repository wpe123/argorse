<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="common/includes.jsp"%>
<%
	String path = request.getContextPath();

	String fmenuid = request.getParameter("fmenuid");
	String articleid = request.getParameter("articleid");
	pageContext.setAttribute("articleid", articleid);

	String fmenuName = "";
	Menu fMenu = new MenuServiceImpl().findMenuById(fmenuid);
	if (fMenu != null) {
		fmenuName = fMenu.getName();
	}
	List articles = new ArticleServiceImpl()
			.findArticleByMenuid(fmenuid);
	pageContext.setAttribute("articles", articles);
	String content = "";
	String title = "";
	String img_path = "";
	Article ar = new ArticleServiceImpl().findArticleById(articleid);
	if (ar != null) {
		content = ar.getContent();
		title = ar.getTitle();
		img_path = ar.getImg_path();
		pageContext.setAttribute("img_path", img_path);

	}
%>
<%@ include file="common/getMenu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>北京亚格斯科技发展有限公司</title>
		<link href="<%=path%>/css/style.css" rel="stylesheet" media="screen"
			type="text/css" />
		<script type='text/javascript'
			src='<%=path%>/js/jquery.min.js?ver=1.3.2'></script>
		<script type='text/javascript'
			src='<%=path%>/js/jquery.prettyPhoto.js?ver=20091215'></script>
		<script type='text/javascript'
			src='<%=path%>/js/custom.js?ver=20091215'></script>
		<!--[if IE 6]>
<script type='text/javascript' src='/templets/g2/js/dd_belated_png.js'></script>
<script>DD_belatedPNG.fix('.ie6fix');</script>
<![endif]-->
	</head>
	<body id="subpage">
		<div class="wrap_all">
			<div id="top">
				<div id="head">
					<h1 class='logo'>
						&nbsp;
						<a href="<%=path%>/index.jsp">北京亚格斯科技发展有限公司</a>
					</h1>
					<div class='name'>
						&nbsp;
						<a href="<%=path%>/index.jsp">北京亚格斯科技发展有限公司</a>
					</div>
					<div class='lo'>
						<a
							href="javascript:window.external.AddFavorite('http://www.argorse.com.cn', '北京亚格斯科技发展有限公司');">设为收藏</a>|
					</div>
					<div class='lol'>
						<a href="#"
							onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.argorse.com.cn')">设为首页</a>
					</div>
					<%@ include file="common/showMenus.jsp"%>
					<p class="breadcrumb">
						<strong class="breadcrumb_info">当前位置：</strong>
						<a href='<%=path%>/index.jsp'>首页</a> &raquo;
						<a href='<%=path%>/subpage_firstmenu.jsp?fmenuid=<%=fmenuid%>'><%=fmenuName%></a>
						&raquo;
						<a
							href='<%=path%>/subpage_firstmenu_article.jsp?fmenuid=<%=fmenuid%>&articleid=<%=articleid%>'><%=title%></a>
					</p>
				</div>
				<div id="main">
					<div id="content" class="bg_sidebar">
						<div id="inner_content">
							<div class="entry">
								<h2>
									<a><%=title%></a>
									<table border="0" width="100%">
										<tr>
											<td align="right">
												<a
													href="<%=path%>/subpage_firstmenu.jsp?fmenuid=<%=fmenuid%>"><font
													style="font-size:14px">浏览更多&raquo;</font>
												</a>
											</td>
										</tr>
									</table>
								</h2>
								<div class="entry-content">
									<c:if test="${img_path==null}">
										<p>
											<%=content%>
										</p>
									</c:if>
									<c:if test="${img_path!=null}">
										<p>
											<img width="300px" height="150px"
												src="<%=request.getContextPath()%>/userfiles/upload_img/<%=img_path%>" />
											<%=content%>
										</p>
									</c:if>

								</div>
							</div>
						</div>

						<div id="sidebar">
							<div class="small_box widget_pages">
								<h3>
									<a><%=fmenuName%></a>
								</h3>
								<ul>
									<c:forEach items="${articles}" var="sm">
										<li <c:if test="${sm.id==articleid }">class='current'</c:if>>
											<a
												href='<%=path%>/subpage_firstmenu_article.jsp?fmenuid=<%=fmenuid%>&articleid=${sm.id }'>${sm.title
												}</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<%@ include file="common/contactus.jsp"%>
						</div>
					</div>
				</div>
				<%@ include file="common/footer.jsp"%>
			</div>
		</div>
	</body>
</html>

