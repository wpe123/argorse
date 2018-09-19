<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List list = (List) session.getAttribute("newsList");
	if (null == list) {
		return;
	}
	String pageSizeStr = request.getParameter("pageSize");
	int pageSize = 10;
	if (null != pageSizeStr && !"".equals(pageSizeStr)) {
		pageSize = Integer.parseInt(pageSizeStr);
	}
	int rows = list.size();
	int pageNow = 1;
	int count;
	String pageNowStr = request.getParameter("pageNow");
	if (null != pageNowStr && !"".equals(pageNowStr)) {
		pageNow = Integer.parseInt(pageNowStr);
	}
	int pageCount = 0;
	if (rows % pageSize == 0) {
		pageCount = rows / pageSize;
	} else {
		pageCount = rows / pageSize + 1;
	}

	int begin = (pageNow - 1) * pageSize;
	int end = begin + (pageSize - 1);
	count = rows - (pageNow - 1) * pageSize;
	//if (rows < end - 1) {
		//end = rows - 1;
	//}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'newsList.jsp' starting page</title>


	</head>
	<script type="text/javascript" defer="defer" src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
  	function iternid(){
  	var str=document.getElementsByName("id");
  	for(i=0;i<str.length;i++)
  	{str[i].checked=true;}
	}
	function uniternid(){
  	var str=document.getElementsByName("id");
  	for(i=0;i<str.length;i++)
  	{str[i].checked=false;}
	}
	function reiternid(){
  	var str=document.getElementsByName("id");
  	for(i=0;i<str.length;i++)
  	{str[i].checked=str[i].checked==true?false:true;}
	}
	function subitern()
	{
	var action="news.do?method=delNewsMore&id=";
	var id="";
	var str=document.getElementsByName("id");
  	for(i=0;i<str.length;i++)
  	{
  	if(str[i].checked==true)
  	{
  	id+=str[i].value+",";
  	}
  	 }
  	 if(id==""){alert("请选择相应记录!");return false;}else{
  	 if(confirm("确定要删除这些记录吗?")){
	location.href=action+id;}}
	}
	function news(msg,action)
	{
	if(confirm(msg)){
	location.href=action;}
	}
	
  </script>
  <script type="text/javascript">
   function goPage(pagenow){
		//document.getElementById('pageNow').value=pagenow;
		//document.getElementById('form').submit();
		window.document.location='<%=path%>/manage/news/newsList.jsp?pageNow='+pagenow+'&pageSize='+<%=pageSize%>
	}
	
	function changePageSize(){
			var pageSize = document.getElementById('pageSize').value;
			window.document.location='<%=path%>/manage/news/newsList.jsp?pageSize='+pageSize;
		}
  </script>
	<body bgcolor="#abcedf">
		<form action="<%=path%>/news.do?method=selectNewsByMap" method="post">
				<table style="font-size:12px" align="center">
					<tr>
						<td>
							标题：
							<input type="text" name="title" id="title" />
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;更新时间：
							从<input type="text" name="begintime" id="begintime" onfocus="WdatePicker()" />
							到<input type="text" name="endtime" id="endtime" onfocus="WdatePicker()" />
						</td>
						<td>
							<input name="submit" id="submit" value="查询" type="submit" />
						</td>
					</tr>

				</table>
			</form>
		
		<table border="1" width="100%" style="font-size:12px">
			<tr style="background: #308DBB; font-weight: bold; color: white">
				<td>
					选择
				</td>
				<td>
					新闻标题
				</td>
				<td>
					新闻内容
				</td>
				<td>
					新闻图片
				</td>
				<td>
					添加时间
				</td>
				<td>
					更新时间
				</td>
				<td>
					操作
				</td>
			</tr>

			<c:forEach items="${newsList}" var="news" varStatus="loop"  begin="<%=begin%>" end="<%=end%>">
				<tr style="background: #ffffff">
					<td>
						<input name="id" value="${news.id}" type="checkbox">
					</td>
					<td>
						<c:choose>
							<c:when test="${fn:length(news.title)>10}">
								<c:out value="${fn:substring(news.title,0,16)}" />...
   												</c:when>
							<c:otherwise>
								<c:out value="${news.title}" />
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a
							href="<%=basePath%>/news.do?method=selectNewsById&id=${news.id}">详情
						</a>
					</td>
					<td>
						<a
							href="<%=basePath%>/news.do?method=selectNewsImgById&id=${news.id}" >查看
						</a>
					</td>
					<td>
						<fmt:formatDate value="${news.createtime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>
						<fmt:formatDate value="${news.updatetime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>
						<input type="button" value="编辑"
							onclick="javascript:location.href='news.do?method=selectNewsById&id=${news.id}'" />
						<input type="button" value="删除"
							onclick="javascript:news('是否确认删除吗?','news.do?method=delNews&id=${news.id}')" />
					</td>
				</tr>
			</c:forEach>
		</table>
		<table height="20px" border="0" cellpadding="0" cellspacing="0"
			align="center">
			<tr>
				<td align="center">
					<input type="button" onclick="iternid()" value="全选" />
				</td>
				<td align="center">
					<input type="button" onclick="uniternid()" value="取消" />
				</td>
				<td align="center">
					<input type="button" onclick="reiternid()" value="反选" />
				</td>
				<td align="center">
					<input type="button" onclick="subitern()" value="删除选中记录" />
				</td>
				<td align="center">
					<input type="button" value="刷新"
						onclick="javascript:location.href='news.do?method=selectNews'" />
				</td>
			</tr>
		</table>
		
		<table align="center" border="0" style="font-size:12px">

				<tr>
					<td>
						总记录数:<%=rows%>
					</td>
					<td>
						本页条数:<%
						if (pageNow == pageCount) {
					%>
						<%=count%>
						<%
							} else {
						%>
						<%=pageSize%>
						<%
							}
						%>
					</td>

					<td>
						每页显示数目:
						<select id="pageSize" name="pageSize" onchange="changePageSize();">

							<option <%
									if(pageSize == 10){
										%> selected
								<%
									}
								 %> value="10">
								10
							</option>
							<option <%
									if(pageSize == 20){
										%> selected
								<%
									}
								 %> value="20">
								20
							</option>
							<option <%
									if(pageSize == 50){
										%> selected
								<%
									}
								 %> value="50">
								50
							</option>
						</select>

					</td>
					<td><%=pageNow%>/<%=pageCount%></td>
					<td>
						<a <%
				if(pageNow != 1){
					%> href="javascript:goPage(1)"
							<%
				}
			 %>>首页</a>|
					</td>
					<td>
						<a <%
				if(pageNow > 1){
					%>
							href="javascript:goPage(<%=pageNow%> - 1)" <%
				}
			 %>>上一页|</a>
					</td>
					<td>
						<a <%
				if(pageNow < pageCount){
				%>
							href="javascript:goPage(<%=pageNow%> + 1)" <%
				}
			 %>>下一页|</a>
					</td>
					<td>
						<a <%
				if(pageNow != pageCount){
				%>
							href="javascript:goPage(<%=pageCount%>)" <%
				}
			 %>>末页</a>
					</td>
				</tr>
			</table>
	</body>
</html>
