<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.argorse.news.domain.News"%>
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
	News news = (News) request.getAttribute("news");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">


		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>
	<script type="text/javascript">
   var rs=true;
   function validate()
    {
    if(rs){
    if(confirm("确定要执行这个操作吗？")){
    var frm=document.forms[0];
    var title=frm.title.value;
    if(trim(title)==""){alert("新闻标题不能为空.");return false;}
    var  pEditor  =  FCKeditorAPI.GetInstance("content") ;
    var  ppEditor   =  pEditor.EditorDocument.body.innerText;
	if(trim(ppEditor)=='')
	{
     alert("请输入新闻内容");
     return false;
	}
  }else{return false;}
  }else{
  return false;}
  }
  	 //去空格
function trim(str){  //删除左右两端的空格    
 return str.replace(/(^\s*)|(\s*$)/g, "");    
}    
  function resetall(){
   document.getElementById("title").value="";
   var  pEditor  =  FCKeditorAPI.GetInstance("content");
    pEditor.EditorDocument.body.innerHTML="";
   }
  </script>
	<body bgcolor="#abcedf">
		<form id="f1" onsubmit="return validate()"
			action="<%=basePath%>/news.do?method=updateNews" method="post" enctype="multipart/form-data" >
			<table border="0" width="60%"  style="font-size:12px">
				<tr style="font-weight: bold; color: white">
					<input type="hidden" id="id" name="id" value=<%=news.getId()%> />
					<td>
						新闻标题 :
						<input id="title" name="title" value=<%=news.getTitle()%> />
					</td>

				</tr>
				<tr style="font-weight: bold; color: white">
					<td>

						新闻图片 :&nbsp
						<a
							href="<%=basePath%>news.do?method=selectNewsImgById&id=${news.id}"
							>查看 </a>
					</td>

				</tr>
				<tr style="font-weight: bold; color: white">
					<td>
						<input type="file" name="img_path" id="img_paths" />
						<font color="red">(建议图片高:300px,宽500px)</font>
					</td>

				</tr>
				<tr>
					<td>
						<div style="font-weight: bold; color: white">
							新闻内容：
						</div>

						<br>
						<FCK:editor instanceName="content" height="400" width="700">
							<jsp:attribute name="value"><%=news.getContent()%></jsp:attribute>
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
