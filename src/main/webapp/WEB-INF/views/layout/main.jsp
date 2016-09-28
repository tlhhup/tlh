<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>平台后台管理系统</title>
<%@include file="/resources/inc.jsp" %>



<style type="text/css">
div, ul, li, a,span,h5 {
	margin: 0;
	padding: 0;
}
.topmenu {
	position:absolute;right:0;
}
 
.topmenu li.first{border-left: 1px solid #eee;}
.topmenu li {
	list-style: none;
	float: left;
	height: 90px;
	border-right: 1px solid #eee;
	overflow: hidden;
	overflow: hidden;
}

.topmenu li a {
	display: block;
	border-radius: 1px; width : 80px;
	height: 90px;
	text-align: center;
	font-size: 12px;
	text-decoration: none;
	width: 78px;
	color:#000;
}

.topmenu li a:hover {
	height: 85px;
	background: #39A9CF;
	font-weight:bold;
	font-size:14px;
	border-bottom: 5px solid #fff;
}
.topmenu li a img {
	width: 50px;
	height: 50px;
	margin: 3px auto;
}

.topmenu li a span {
	display: block;
	color: #111;
	height: 24px;
	margin-top:0px;
}
 
/*系统通告*/
.maintitle{clear:both;height:28px;margin-top:90px;line-height:28px;text-indent:8px;background:#efefef;border-bottom:1px solid #ccc;}
.logo{ position:absolute;  font-size:30px;text-shadow: 2px 3px 3px #0066ff;font-weight:bold;line-height:80px;margin-left:-3px;margin-top:10px;color:#fff;}
</style>
<script type="text/javascript">

	function createDialog(title,url,width,height){
		$('#ppanel').dialog({    
		    title: title,    
		    width: width,    
		    height: height,    
		    closed: false,    
		    cache: false,    
		    href: url,    
		    modal: true   
		});    
		// 
	}
	
	function loadDialog(url){
		$('#ppanel').dialog({    
		    title: "系统弹窗",    
		    width: 400,    
		    height: 200,    
		    closed: false,    
		    cache: false,   
		 modal: true   
		});    
		//$('#ppanel').dialog('refresh', url);  
	}
	
	function closeDialog(){
		$('#ppanel').dialog("close");
	}
	// 取得当前网页中主面板的高度
	function getAvaibleHeight(){
		return $("#mainpanelcontainer").height();
	}
	
	$(function(){
		//动态加载主菜单:二级菜单
		$('.topmenu li').click(function(){
			var id=$(this).children("a").attr("mId");
			console.info(id);
			$("#menu").attr("src","${pageContext.request.contextPath }/web/loginAction/menu.do?id="+id);
		});
	})
</script>
</head>
<body>
	<div class="easyui-layout" fit="true" >
		<div data-options="region:'north'"
			style="height:121px;background:url(${pageContext.request.contextPath}/resources/images/head.gif) bottom ;border-bottom:2px offset #ccc;">
			<div class="logo">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" width="60" height="70" align="top"/>
				平台后台管理系统
			</div> 				
			<ul class="topmenu">
				<ph:rightFilter url="#3">
					<li><a href="###" class="c5" mId="3"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/set.png" />
							<span>系统设置</span></a></li>
				</ph:rightFilter>
				<li><a href="${pageContext.request.contextPath}/web/loginAction/logout.do" class="c5"> <img
						src="${pageContext.request.contextPath}/resources/images/icons/exit.png" />
						<span>退出系统</span></a></li>
			</ul>
			<div class="maintitle">这是系统通知</div> 
		</div>
		<div data-options="region:'south'"
			style="height: 28px; line-height: 28px; overflow:hidden; text-align: center;background:#f1f1f1;">版权所有  @To Laugh 研发组   联系我们 Email:ado#txdy.org</div>
		<div data-options="region:'west',split:false" style="width:200px; border-right:3px solid #bbb;">
			<iframe id="menu" width="100%" height="99%" frameborder="0" src="${pageContext.request.contextPath }/web/loginAction/menu.do"></iframe> 
		</div>
		<div id="mainpanelcontainer" data-options="region:'center'">
			 <iframe id="main" name="mainFrame" width="100%" height="99%" frameborder="0" src="${pageContext.request.contextPath }/web/loginAction/home.do"></iframe> 
		</div>
	</div>
	<div id="ppanel" style="display: none;">sss</div>
</body>
</html>