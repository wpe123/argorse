<%@ page language="java" import="java.util.*,com.argorse.menu.service.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>addArticle</title>
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
		            
		            var arr=xmlHttp.responseText.split("|");
		            for(var i=0;i<arr.length-1;i++){
		            	var vt=arr[i].split(",");
		                twoSelect.add(new Option(vt[1],vt[0]));
		            }
		        }
		    }
    	}
    	
    	function doSubmit(){
    	
    		if(document.getElementById('title').value == ''){
    			alert('文章标题不能为空');
    			return false;
    		}
    		
    		if(document.getElementById('firstMenus').value == '0'){
    			alert('请先选择一级菜单！');
    			return false;
    		}
    		
    		var menuid = document.getElementById('secondMenus').value;
    		if(menuid == '0'){
    			menuid = document.getElementById('firstMenus').value;
    			menuid = menuid.split(',')[0];
    		}
    		document.getElementById('articleForm').action='<%=path%>/article.do?cmd=insertArticle&menuid='+menuid;
    		document.getElementById('articleForm').submit();
    	}
    </script>
  </head>
  
  <body bgcolor="#abcedf">
    <h3> 
			<font style="font-size:12px">添加文章</font> 
		</h3>
		
			<form name="articleForm" method="POST"  enctype="multipart/form-data" style="font-size:12px">
			
			<select id="firstMenus" onchange="showSecondMenusById();">
				<option value="0">选择一级菜单</option>
				<c:forEach items="${firstMenus}" var="firstMenu">
					<option value="${firstMenu.id },${firstMenu.isleaf }">${firstMenu.name }</option>
				</c:forEach>
			</select>
			
			<select id="secondMenus" name="secondMenus">
				<option value="0">...</option>
			</select>
			<br>
				文章标题:<input type="text" name="title" size="30" maxlength="50">
				<br />
				
				文章图片：
					<input type="file" name="img_path" id="img_paths" /><font color="red">(建议图片高:300px,宽500px)</font>
				
				<FCK:editor instanceName="content" height="400" width="700">
					<jsp:attribute name="value"></jsp:attribute>
				</FCK:editor>
				<input type="button" value="提 交" onclick="doSubmit();">
				<input type="reset" value="重 置">
			</form>
  </body>
</html>
