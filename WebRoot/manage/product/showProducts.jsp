<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List list = (List) session.getAttribute("productList");
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
    <title>showProducts</title>
    <script type="text/javascript">
    	function delProductById(id){
    		var v = window.confirm('确定删除当前记录吗？');
    		if(v){
    			document.location='<%=path%>/product.do?cmd=delProductById&id='+id;
    		}
    		else{
    			return false;
    		}
    		
    	}
    	
    	function showProductById(id){
    		document.location='<%=path%>/product.do?cmd=showProductById&id='+id;
    	}
    </script>
  </head>
  <script type="text/javascript">
  function goPage(pagenow){
		//document.getElementById('pageNow').value=pagenow;
		//document.getElementById('form').submit();
		window.document.location='<%=path%>/manage/product/showProducts.jsp?pageNow='+pagenow+'&pageSize='+<%=pageSize%>
	}
	
	function changePageSize(){
			var pageSize = document.getElementById('pageSize').value;
			window.document.location='<%=path%>/manage/product/showProducts.jsp?pageSize='+pageSize;
		}
  </script>
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
	var action="<%=path%>/product.do?cmd=delProductMoreById&id=";
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
  <body bgcolor="#abcedf">
  <center>
    <table border="1" width="100%" cellpadding="0" cellspacing="0" style="font-size:12px">
    	<tr style="background: #308DBB; font-weight: bold; color: white" align="center">
    		<td>选择</td>
    		<td>产品名称</td>
    		<td>产品图片</td>
    		<td>创建时间</td>
    		<td>更新时间</td>
    		<td>操作</td>
    		
    	</tr>
    	<c:forEach items="${productList}" var="product" varStatus="loop" begin="<%=begin%>" end="<%=end%>">
    		<tr style="background: #ffffff">
    			<td align="center"><input name="id" value="${product.id}" type="checkbox"></td>
    			<td><a href="<%=path %>/product.do?cmd=showProduct&id=${product.id }">${product.title }</a></td>
    			<td><a href="<%=path %>/product.do?cmd=showProductImg&id=${product.id }">查看</a></td>
    			<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${product.createTime }"></fmt:formatDate></td>
    			<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${product.updateTime }"></fmt:formatDate></td>
    			<td align="center"><input onclick="showProductById('${product.id}')" type="button" value="修 改"><input onclick="delProductById('${product.id }')" type="button" value="删 除"></td>
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
						onclick="javascript:location.href='product.do?cmd=findAllProduct'" />
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
    </center>
  </body>
</html>
