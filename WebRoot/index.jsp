<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/includes.jsp"%>

<%
	String path = request.getContextPath();

	//新闻
	NewsServiceImpl service = new NewsServiceImpl();
	List newslist = service.selectNews();
	pageContext.setAttribute("newslist", newslist);
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
	<body id="home">
		<div class="wrap_all">
			<div id="top">

				<div id="head">
					<h1 class='logo'>
						&nbsp;
						<a href="<%=path%>/index.jsp">北京亚格斯科技发展有限公司</a>
					</h1>
					<div  class='name' >
						&nbsp;
						<a href="<%=path%>/index.jsp">北京亚格斯科技发展有限公司</a>
					</div>
					<div class='lo'>
					   <a href="javascript:window.external.AddFavorite('http://www.argorse.com.cn', '北京亚格斯科技发展有限公司');">设为收藏</a>|
					</div>
					<div class='lol'>
					    <a href="#" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.argorse.com.cn')">设为首页</a>
					</div>
					<%@ include file="common/showMenus.jsp"%>
				</div>
				<div id="main">
					<div id="featured">
						<c:forEach items="${productList}" var="product1" varStatus="loop">
							<div
								<c:if test="${loop.count==1 }">class="featured_item current"</c:if>
								<c:if test="${loop.count!=1 }">class="featured_item"</c:if>>
								<div class="featured_image">
									<a href="<%=path%>/product.jsp?productid=${product1.id }"><img
											src="<%=path%>/userfiles/upload_img/${product1.path }" alt=""
											width="940" height="350" /> </a>
								</div>
							</div>
						</c:forEach>
						<div id="featured_bottom">
							<div class="ticker">
								<c:forEach items="${newslist}" var="n" varStatus="loop">
									<span
										<c:if test="${loop.count==1 }">class='active_ticker'</c:if>><a
										href="<%=path%>/news.do?method=selectNewsToShowById&id=${n.id}"><strong>公司动态：</strong>${n.title
											} <em>&nbsp;&nbsp;<fmt:formatDate
													value="${n.updatetime}" pattern="yyyy-MM-dd " /> </em> </a> </span>
								</c:forEach>
							</div>
							<div class="preview_images">
								<c:forEach items="${productList}" var="product" varStatus="loop">

									<a <c:if test="${loop.count==1 }">class='current_prev'</c:if>
										href="/"><img
											src="<%=path%>/userfiles/upload_img/${product.path }" alt=""
											width="44" height="30" /> </a>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="content_top"></div>
					<div id="content">
						<div class="small_box box1 business" id="webb">
							<span class="meta">News</span>
							<h3>
								<a href="<%=path%>/news.jsp">企业动态</a><a
									href="<%=path%>/news.jsp" title="查看更多动态" class="morecase">查看更多动态&raquo;</a>
							</h3>
							<ul>
								<c:forEach items="${newslist}" var="n" varStatus="loop"
									begin="0" end="3">
									<li>
										<a style="cursor: hand"
											href="<%=path%>/news.do?method=selectNewsToShowById&id=${n.id}">${n.title
											} </a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<div class="small_box box1 business">
							<span class="meta">Solutions</span>
							<h3>
								<a href="<%=path%>/subpage.jsp?fmenuid=${solutionMenuId }">解决方案</a>
								<a href="<%=path%>/subpage.jsp?fmenuid=${solutionMenuId }"
									title="查看更多解决方案" class="morecase">更多解决方案&raquo;</a>
							</h3>
							<ul class="alist">
								<c:forEach items="${solutions}" var="product" begin="0" end="6">
									<li>
										<a
											href="<%=path%>/subpage.jsp?fmenuid=${solutionMenuId }&smenuid=${product.id }">${product.name}<span
											class="sdate"> </span> </a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<div class="small_box box1 business">
							<span class="meta">Success Stories</span>
							<h3>
								<a href="<%=path%>/subpage.jsp?fmenuid=${SuccessStoriesMenuId }">成功案例</a>
								<a href="<%=path%>/subpage.jsp?fmenuid=${SuccessStoriesMenuId }"
									title="查看更多成功案例" class="morecase">更多成功案例&raquo;</a>
							</h3>
							<ul class="alist">
								<c:forEach items="${SuccessStories}" var="product" begin="0"
									end="6">
									<li>
										<a
											href="<%=path%>/subpage.jsp?fmenuid=${SuccessStoriesMenuId }&smenuid=${product.id }">${product.name}<span
											class="sdate"> </span> </a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<%@ include file="common/footer.jsp"%>
			</div>
		</div>
	</body>
</html>

