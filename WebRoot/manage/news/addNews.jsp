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
		<title>添加新闻</title>
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
	<body bgcolor="#abcdef">

		<form id="f1" onsubmit="return validate()"
			action="<%=request.getContextPath()%>/news.do?method=insertNews"  enctype="multipart/form-data" method="post" >
			<table  bgcolor="#abcdef" style="font-size:12px">
				<tr>
					<td>
						新闻标题：
						<input id="title" name="title" type="text">
					</td>
				</tr>
				<tr>
					<td>
						新闻图片：
						<input type="file" name="img_path" id="img_paths" /><font color="red">(建议图片高:300px,宽500px)</font>
					</td>
				</tr>
				<tr>
					<td>
						新闻内容：
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