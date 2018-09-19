<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>updateProduct</title>
		<script type="text/javascript">
			function doSubmit(){
				document.getElementById('productForm').action='<%=path%>/article.do?cmd=updateArticle&id=${article.id}';
				document.getElementById('productForm').submit();
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
		            var arr=xmlHttp.responseText.split("|");
		            for(var i=0;i<arr.length-1;i++){
		            	var vt=arr[i].split(",");
		                twoSelect.add(new Option(vt[1],vt[0]));
		            }
		        }
		    }
    	}

    </script>
	</head>

	<body bgcolor="#abcedf">
		<h3>
			<font style="font-size: 12px">修改文章信息</font>
		</h3>
		<form name="productForm" method="POST" enctype="multipart/form-data"
			style="font-size: 12px">
			<table style="font-size: 12px">
				<tr>
					<td>
						所属菜单：
						<c:if test="${firstmenu.id==null}">
							<select id="firstMenus" name="firstMenus"
								onchange="showSecondMenusById();">
								<option value="${menu.id}">
									${menu.name}
								</option>
								<c:forEach items="${firstMenus}" var="firstMenu">
									<c:if test="${firstMenu.id!=menu.id}">
										<option value="${firstMenu.id },${firstMenu.isleaf }">
											${firstMenu.name }
										</option>
									</c:if>
								</c:forEach>
							</select>
							<select id="secondMenus" name="secondMenus">
								<option value="0">
									...
								</option>
							</select>
						</c:if>
						<c:if test="${firstmenu.id!=null}">
						   <select id="firstMenus" name="firstMenus"
								onchange="showSecondMenusById();">
							<option value="${firstmenu.id}">
								${firstmenu.name}
							</option>
							<c:forEach items="${firstMenus}" var="firstMenu">
								<c:if test="${firstMenu.id!=firstmenu.id}">
									<option value="${firstMenu.id },${firstMenu.isleaf }">
										${firstMenu.name }
									</option>
								</c:if>
							</c:forEach>
							</select>
							<select id="secondMenus" name="secondMenus">
								<option value="${menu.id}">
									${menu.name }
								</option>
								<c:forEach items="${secondmenusList}" var="secondmenus">
								<c:if test="${secondmenus.id!=menu.id}">
									<option value="${secondmenus.id }">
										${secondmenus.name}
									</option>
								</c:if>
							</c:forEach>
							</select>
						</c:if>
					</td>
				</tr>
			</table>

			<input type="text" name="title" size="30" maxlength="50"
				value="${article.title }">
			<br />
			<font style="font-size: 12px">文章图片：</font>
			<input type="file" name="img_path" id="img_paths" />
			<font color="red">(建议图片高:350px,宽900px)</font>
			<FCK:editor instanceName="content" height="400" width="700">
				<jsp:attribute name="value">${article.content}</jsp:attribute>
			</FCK:editor>
			<input type="button" value="提 交" onclick="doSubmit();">
			<input type="button" value="取 消" onclick="javascript:history.go(-1)">
		</form>



	</body>
</html>
