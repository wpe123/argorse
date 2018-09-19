<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'newsList.jsp' starting page</title>


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
	var action="customer.do?method=delCustomerMore&id=";
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
	function customer(msg,action)
	{
	if(confirm(msg)){
	location.href=action;}
	}
	
  </script>
	<body bgcolor="#abcedf">
		
		<table border="1" width="100%" style="font-size:12px">
			<tr style="background: #308DBB; font-weight: bold; color: white">
				<td>
					选择
				</td>
				<td>
					客户名称
				</td>
				<td>
					客户电话
				</td>
				<td>
					客户地址
				</td>
				<td>
					内容
				</td>
				<td>
					操作
				</td>
			</tr>

			<c:forEach items="${customerList}" var="customer">
				<tr style="background: #ffffff">
					<td>
						<input name="id" value="${customer.id}" type="checkbox">
					</td>
					<td>
						<a
							href="<%=basePath%>/customer.do?method=selectCustomerById&id=${customer.id}">${customer.cname}
						</a>
					</td>
					<td>
						${customer.tel}
					</td>
					<td>
						${customer.address}
					</td>
					<td>
						<c:choose>
							<c:when test="${fn:length(customer.content)>12}">
								 ${fn:substring(customer.content,0,12)}
									...
							</c:when>
							<c:otherwise>
								${customer.content} 
							</c:otherwise>
						</c:choose>
					</td>


					<td>
						<input type="button" value="编辑"
							onclick="javascript:location.href='customer.do?method=selectCustomerById&id=${customer.id}'" />
						<input type="button" value="删除"
							onclick="javascript:customer('是否确认删除吗?','customer.do?method=delCustomer&id=${customer.id}')" />
					</td>
				</tr>
			</c:forEach>
		</table>
		<table height="20px" border="0" cellpadding="0" cellspacing="0"
			align="center"  style="font-size:12px">
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
						onclick="javascript:location.href='customer.do?method=selectCustomer'" />
				</td>
			</tr>
		</table>
	</body>
</html>
