<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加客户</title>
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
	<body bgcolor="#abcdef">

		<form id="f1" onsubmit="return validate()"
			action="<%=basePath%>/customer.do?method=insertCustomer"
			method="post">
			<table  bgcolor="#abcdef" style="font-size:12px">
				<tr>
					<td>
						客户名称：
						<input id="name" name="name" type="text">
					</td>
				</tr>
				<tr>
					<td>
						客户电话：
						<input id="tel" name="tel" type="text">
					</td>
				</tr>
				<tr>
					<td>
						客户地址：
						<input id="address" name="address" type="text">
					</td>
				</tr>

				<tr>
					<td>
						内容：
						<br>
						<FCK:editor instanceName="content" height="400" width="700">
							<jsp:attribute name="value"></jsp:attribute>
						</FCK:editor>
					</td>
				</tr>
				<tr>
					<td align="center">
						<input id="submit" name="submit" type="submit" value="添加" />
						<input type="button" value="重置" onclick="resetall()" id="btn1" />
						<input type="button" onclick="javascript:history.go(-1)"
							value="返回" />

					</td>
				</tr>
			</table>
		</form>

	</body>
</html>