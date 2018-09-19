<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="common/includes.jsp"%>
<%
	String path = request.getContextPath();

	MenuServiceImpl ms = new MenuServiceImpl();

	List articles = new ArrayList();
	Article article = new Article();

	//一级菜单的名字
	String fmenuName = "";

	//传过来一级菜单的id
	String fmenuid = request.getParameter("fmenuid");

	if (fmenuid != null && !"".equals(fmenuid)) {
		articles = new ArticleServiceImpl()
				.findArticleByMenuid(fmenuid);
		Menu fmenu = ms.findMenuById(fmenuid);
		if (fmenu != null) {
			fmenuName = fmenu.getName();
		}

	}

	if (articles.size() == 0) {
		pageContext.setAttribute("articleCount", "0");
	} else if (articles.size() == 1) {
		pageContext.setAttribute("articleCount", "1");
		article = (Article) articles.get(0);
		pageContext.setAttribute("articles", articles);
	} else {
		pageContext.setAttribute("articleCount", "2");
		pageContext.setAttribute("articles", articles);
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
					</p>
				</div>
				<div id="main">

					<div id="content" class="bg_sidebar">
						<div id="inner_content">
							<div class="entry">
								<h2>
									<a><%=fmenuName%></a>
								</h2>
								<div class="entry-content">
									<p>
										<c:if test="${articleCount=='0'}">
											暂无内容！
										</c:if>
										<c:if test="${articleCount=='1'}">
											<c:if test="${ar.img_path!=null}">
												<img
													src="<%=request.getContextPath()%>/userfiles/upload_img/<%=article.getImg_path()%>" />
												<%=article.getContent()%>
											</c:if>
											<c:if test="${ar.img_path==null}">
												<%=article.getContent()%>
											</c:if>
										</c:if>
										<c:if test="${articleCount=='2'}">
											<ul>
												<c:forEach items="${articles}" var="ar">
													<li>
														<c:if test="${ar.img_path!=null}">
															<a title="${ar.title}"
																href="<%=path%>/subpage_firstmenu_article.jsp?fmenuid=<%=fmenuid%>&articleid=${ar.id }">
																${ar.title}<img width="180px" height="90px"
																	src="<%=request.getContextPath()%>/userfiles/upload_img/${ ar.img_path}" />
															</a>
														</c:if>

														<c:if test="${ar.img_path==null}">
															<a title="${ar.title}"
																href="<%=path%>/subpage_firstmenu_article.jsp?fmenuid=<%=fmenuid%>&articleid=${ar.id }">
																${ar.title} </a>
														</c:if>
													</li>
												</c:forEach>
											</ul>
										</c:if>
									</p>
								</div>
							</div>
						</div>

						<div id="sidebar">
							<div class="small_box widget_pages">
								<h3>
									<a><%=fmenuName%></a>
								</h3>
								<ul>
									<c:if test="${articleCount=='1'}">
										<li>
											<a><%=article.getTitle()%></a>
										</li>
									</c:if>
									<c:if test="${articleCount=='2'}">
										<c:forEach items="${articles}" var="ar">
											<li>
												<a
													href='<%=path%>/subpage_firstmenu_article.jsp?fmenuid=<%=fmenuid%>&articleid=${ar.id }'>${ar.title
													}</a>
											</li>
										</c:forEach>
									</c:if>
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

