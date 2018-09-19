<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.argorse.customer.domain.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Customer customer = (Customer) request.getAttribute("customer");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'newsList.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
<script type="text/javascript">
   var rs=true;
   function validate()
    {
    if(rs){
    if(confirm("确定要执行这个操作吗？")){
    var frm=document.forms[0];
    var name=frm.name.value;
    var tel=frm.tel.value;
    var address=frm.address.value;
    if(name==""){alert("客户名称不能为空.");return false;}
    if(tel==""){alert("电话号码不能为空.");return false;}
    if(!IsNum(tel)){alert("电话号码不是数字.");return false;}
    if(address==""){alert("地址不能为空.");return false;}
    var  pEditor  =  FCKeditorAPI.GetInstance("content") ;
    var  ppEditor   =  pEditor.EditorDocument.body.innerText;
	if(ppEditor=='')
	{
     alert("请输入内容");
     return false;
	}
  }else{return false;}
  }else{
  return false;}
  }
  	
  //判断是否为数字
function IsNum(s)
{
    if (s!=null && s!="")
    {
        return !isNaN(s);
    }
    return false;
}
  
  function resetall(){
   document.getElementById("name").value="";
   document.getElementById("tel").value="";
   document.getElementById("address").value="";
   var  pEditor  =  FCKeditorAPI.GetInstance("content");
    pEditor.EditorDocument.body.innerHTML="";
   }
  </script>
	<body bgcolor="#abcedf">
		<form id="f1" onsubmit="return validate()" action="<%=basePath%>/customer.do?method=updateCustomer" method="post">
			<table border="0" width="60%"  style="font-size:12px">
				<tr style="font-weight: bold; color: white">
					<input type="hidden" id="id" name="id" value=<%=customer.getId()%> />
					<td>
						客户名称 :
						<input id="name" name="name" value=<%=customer.getCname()%> />
					</td>

				</tr>
				<tr style="font-weight: bold; color: white">
					<td>
						客户电话 :
						<input id="tel" name="tel" value=<%=customer.getTel()%> />
					</td>

				</tr>
				<tr style="font-weight: bold; color: white">
					<td>
						客户地址 :
						<input id="address" name="address" value=<%=customer.getAddress()%> />
					</td>

				</tr>
				<tr>
					<td>
						<div style="font-weight: bold; color: white">
							内容：
						</div>

						<br>
						<FCK:editor instanceName="content" height="400" width="700">
							<jsp:attribute name="value"><%=customer.getContent()%></jsp:attribute>
						</FCK:editor>
					</td>

				</tr>
				<br>
				<tr>
					<td align="center">
						<input id="submit" name="submit" type="submit" value="修改" />
						<input type="button" value="重置" onclick="resetall()" id="btn1" />
						<input type="button" onclick="javascript:history.go(-1)"
							value="返回" />
					</td>

				</tr>
			</table>
		</form>
	</body>
</html>
