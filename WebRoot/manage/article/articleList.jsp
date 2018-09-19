<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List list = (List) session.getAttribute("articleList");
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
    	function delArticleById(id){
    		var v = window.confirm('确定删除当前记录吗？');
    		if(v){
    			document.location='<%=path%>/article.do?cmd=delArticleById&id='+id;
    		}
    		else{
    			return false;
    		}
    		
    	}
    	
    	function showArticleById(id){
    		document.location='<%=path%>/article.do?cmd=showArticleById&id='+id;
    	}
    </script>
	</head>
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
	var action="<%=path%>/article.do?cmd=delArticleMoreById&id=";
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
    	var xmlHttp=false;
		try {
		   xmlHttp = new XMLHttpRequest();
		} catch (trymicrosoft) {
		     try {
		       xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		     } catch (othermicrosoft) {
		       try {
		         xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		       } catch (failed) {
		         }  
		     }
		   }
    	function showSecondMenusById(){
    		var vid=(document.getElementById('firstMenus')).value;
    		if(vid == '0'){
    			var twoSelect = document.all.secondMenus;
		        twoSelect.options.length=0;
		        twoSelect.add(new Option('...','0'));
		        return ;
    		}
    		var info = vid.split(",");
    		if(info[1]==1){
    			
    			 var twoSelect = document.all.secondMenus;
		         twoSelect.options.length=0;
		         twoSelect.add(new Option('...','0'));
    		}
    		if(info[1]==0){
	    		var url="<%=path%>/article.do?cmd=findSecondMenus&id="+info[0];
			    xmlHttp.open("get",url,"true");
			    xmlHttp.onreadystatechange =showSecondMenus;
			    xmlHttp.send(null);
    		}
		    
    	}
    	
    	function showSecondMenus(){
    		if(xmlHttp.readyState == 4){
		        if(xmlHttp.status==200){
		        
		            var twoSelect = document.all.secondMenus;
		            twoSelect.options.length=0;
		            twoSelect.add(new Option('全部','all'));
		            var arr=xmlHttp.responseText.split("|");
		            for(var i=0;i<arr.length-1;i++){
		            	var vt=arr[i].split(",");
		                twoSelect.add(new Option(vt[1],vt[0]));
		            }
		        }
		    }
    	}
    	function goPage(pagenow){
		//document.getElementById('pageNow').value=pagenow;
		//document.getElementById('form').submit();
		window.document.location='<%=path%>/manage/article/articleList.jsp?pageNow='+pagenow+'&pageSize='+<%=pageSize%>
	}
	
	function changePageSize(){
			var pageSize = document.getElementById('pageSize').value;
			window.document.location='<%=path%>/manage/article/articleList.jsp?pageSize='+pageSize;
		}
    </script>
	<body bgcolor="#abcedf">
		<center>
			<form action="<%=path%>/article.do?cmd=selectArticleByMap" method="post">
				<table style="font-size:12px">
					<tr>
						<td>
							菜单：
							<select id="firstMenus" name="firstMenus"
								onchange="showSecondMenusById();">
								<option value="0">
									选择一级菜单
								</option>
								<c:forEach items="${firstMenus}" var="firstMenu">
									<option value="${firstMenu.id },${firstMenu.isleaf }">
										${firstMenu.name }
									</option>
								</c:forEach>
							</select>

							<select id="secondMenus" name="secondMenus">
								<option value="0">
									...
								</option>
							</select>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;标题：
							<input type="text" name="title" id="title" />
						</td>
						<td>
							<input name="submit" id="submit" value="查询" type="submit" />
						</td>
					</tr>

				</table>
			</form>
			<table border="1" width="100%"  style="font-size:12px">
				<tr style="background: #308DBB; font-weight: bold; color: white" align="center">
					<td>
						选择
					</td>
					<td>
						文章标题
					</td>
					<td>
						所属菜单
					</td>
					<td>
						创建时间
					</td>
					<td>
						修改时间
					</td>
					<td>
						操作
					</td>

				</tr>
				<c:forEach items="${articleList}" var="map" varStatus="loop" begin="<%=begin%>" end="<%=end%>">

					<tr style="background: #ffffff">
						<td align="center">
							<input name="id" value="${map.article.id}" type="checkbox">
						</td>
						<td>
							<a
								href="<%=path%>/article.do?cmd=showArticle&id=${map.article.id }">${map.article.title
								}</a>
						</td>
						<td>
							${map.menuName }(${map.menulevel })
						</td>
						<td align="center">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
								value="${map.article.createtime }"></fmt:formatDate>
						</td>
						<td align="center">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
								value="${map.article.updatetime }"></fmt:formatDate>
						</td>
						<td align="center">
							<input onclick="showArticleById('${map.article.id}')"
								type="button" value="修 改">
							<input onclick="delArticleById('${map.article.id }')"
								type="button" value="删 除">
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
						onclick="javascript:location.href='article.do?cmd=findAllArticles'" />
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
