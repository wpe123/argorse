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
		<title>addProduct</title>
	</head>
<script type="text/javascript">
   var rs=true;
   function validate()
    {
    if(rs){
    if(confirm("确定要执行这个操作吗？")){
    var frm=document.forms[0];
    var title=frm.title.value;
    if(trim(title)==""){alert("产品名称不能为空.");return false;}
    var  pEditor  =  FCKeditorAPI.GetInstance("content") ;
    var  ppEditor   =  pEditor.EditorDocument.body.innerText;
	if(trim(ppEditor)=='')
	{
     alert("请输入产品介绍");
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
		<h3>
			<font style="font-size:12px">添加产品</font>
		</h3>
			<form name="productForm" method="POST" enctype="multipart/form-data" onsubmit="return validate()" action="<%=path%>/product.do?cmd=addProduct" style="font-size:12px">
			    
				产品名称：<input type="text" name="title" size="30" maxlength="50"><br>
				产品图片：<input type="file" name="img_path" id="img_paths" /><font color="red">(建议图片高:350px,宽900px)</font>
				<br />
				<FCK:editor instanceName="content" height="400" width="700">
					<jsp:attribute name="value">在此输入产品信息</jsp:attribute>
				</FCK:editor>
				<input type="submit" value="提 交" >
				<input type="button" value="重 置" onclick="resetall();">
			</form>



	</body>
</html>
