<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="common/includes.jsp"%>
<%
	String path = request.getContextPath();

	MenuServiceImpl ms = new MenuServiceImpl();

	List articles = new ArrayList();
	Article article = new Article();

	//一级菜单的名字和二级菜单的名字
	String fmenuName = "";
	String smenuName = "";
	String img_path = "";
	//传过来一级菜单的id和二级菜单的id
	String fmenuid = request.getParameter("fmenuid");
	String smenuid = request.getParameter("smenuid");
	pageContext.setAttribute("smenuid", smenuid);
	List sMenuList = new ArrayList();
	if (fmenuid != null && !"".equals(fmenuid)) {
		sMenuList = ms.findSecondMenusByPid(fmenuid);
		pageContext.setAttribute("sMenuList", sMenuList);
		Menu fmenu = ms.findMenuById(fmenuid);
		if (fmenu != null) {
			fmenuName = fmenu.getName();
		}

	}
	if (smenuid != null && !"".equals(smenuid)) {
		Menu smenu = ms.findMenuById(smenuid);
		if (smenu != null) {
			smenuName = smenu.getName();
		}

		if (null != new ArticleServiceImpl()
				.findArticleByMenuid(smenuid)) {
			articles = new ArticleServiceImpl()
					.findArticleByMenuid(smenuid);

			if (articles.size() == 0) {
				pageContext.setAttribute("articleCount", "0");
			} else if (articles.size() == 1) {
				pageContext.setAttribute("articleCount", "1");
				article = (Article) articles.get(0);
				img_path = article.getImg_path();
				pageContext.setAttribute("img_path", img_path);
			} else {
				pageContext.setAttribute("articleCount", "2");
				pageContext.setAttribute("articles", articles);
			}
		}
	} else {
		pageContext.setAttribute("articleCount", "3");
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
						<a href="<%=path%>/subpage.jsp?fmenuid=<%=fmenuid%>"><%=fmenuName%></a>
						&raquo;
						<a
							href="<%=path%>/subpage.jsp?fmenuid=<%=fmenuid%>&smenuid=<%=smenuid%>"><%=smenuName%></a>
					</p>
				</div>
				<div id="main">
					<div id="content" class="bg_sidebar">
						<div id="inner_content">

							<div class="entry">
								<h2>
									<a><%=smenuName%></a>
								</h2>
								<div class="entry-content">
									<p>
										<c:if test="${articleCount=='0'}">
											暂无内容！
										</c:if>
										<c:if test="${articleCount=='1'}">
											<c:if test="${img_path==null}">
												<p>
													<%=article.getContent()%>
												</p>
											</c:if>
											<c:if test="${img_path!=null}">
												<p>
													<img
														src="<%=request.getContextPath()%>/userfiles/upload_img/<%=img_path%>" />
													<br />
													<%=article.getContent()%>
												</p>
											</c:if>
											<table align="right">
												<tr>
													<td>
														更新时间：
														<fmt:formatDate value="<%=article.getUpdatetime()%>"
															pattern="yyyy-MM-dd " />
													</td>
												</tr>
											</table>

										</c:if>
										<c:if test="${articleCount=='2'}">
											<ul>
												<c:forEach items="${articles}" var="ar">
													<li>
														<a
															href="<%=path%>/subpage_articles.jsp?fmenuid=<%=fmenuid%>&smenuid=<%=smenuid%>&articleid=${ar.id }">${ar.title
															} &nbsp;&nbsp;<fmt:formatDate value="${ar.updatetime}"
																pattern="yyyy-MM-dd " />
														</a>
													</li>
												</c:forEach>
											</ul>
										</c:if>
										<c:if test="${articleCount=='3'}">
											<ul>
												<c:forEach items="${sMenuList}" var="smenu">
													<li>
														<a
															href="<%=path%>/subpage.jsp?fmenuid=<%=fmenuid%>&smenuid=${smenu.id }">${smenu.name
															}</a>
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
									<c:forEach items="${sMenuList}" var="sm">
										<li <c:if test="${sm.id==smenuid }">class='current'</c:if>>
											<a
												href='<%=path%>/subpage.jsp?fmenuid=<%=fmenuid%>&smenuid=${sm.id }'>${sm.name
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
