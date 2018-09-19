<%@ page language="java" pageEncoding="utf-8"%>
<div class="navwrap">
	
	<ul id="nav">
		<li class="36">
			<a href="${path }/index.jsp">首页</a>
		</li>
		<li class="36">
			<a href="${path }/product.jsp">产品中心</a>
			<ul >
				<c:forEach items="${productList}" var="product1" varStatus="loop">
					<li >
						<a
							href="${path }/product.jsp?productid=${product1.id }">${product1.title
							}</a>
					</li>
				</c:forEach>
			</ul>
		</li>
		<c:forEach items="${menus}" var="m">
			<li class="36">
				<c:if test="${!empty m.secondMenuList}">
					<a href="${path }/subpage.jsp?fmenuid=${m.firstMenu.id }">${m.firstMenu.name }</a>
					<ul>
						<c:forEach items="${m.secondMenuList}" var="secondMenu">
							<li>
								<a
									href="${path }/subpage.jsp?fmenuid=${m.firstMenu.id }&smenuid=${secondMenu.id }">${secondMenu.name
									}</a>
							</li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${empty m.secondMenuList}">
					<a href="${path }/subpage_firstmenu.jsp?fmenuid=${m.firstMenu.id }">${m.firstMenu.name}</a>
				</c:if>
			</li>
		</c:forEach>
	</ul>
</div>
