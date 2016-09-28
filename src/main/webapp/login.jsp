<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>平台后台管理系统--用户登录</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css"/>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/jquery-easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/jquery-easyui/themes/icon.css">
	<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/jquery-easyui/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript"> 
		function resizeLayout(){
			var wWidth = (window.document.documentElement.clientWidth || window.document.body.clientWidth || window.innerHeight);
			var wHeight = (window.document.documentElement.clientHeight || window.document.body.clientHeight || window.innerHeight);
			$("#bodyBanner").css("height",wHeight+"px");  	
//alert(wWidth);			
			if(wWidth>1100){
				$("#bodyBanner").css("left",(wWidth-1100)/2+"px");
				$("#bodyBanner").css("width","1100px");
				$("#loginPanel").css("width","1100px");
			}else{
				if(wWidth>980) 
					$("#bodyBanner").css("left",(wWidth-980)/2+"px");
				else
					("#bodyBanner").css("left","0px");
					
				$("#bodyBanner").css("width","980px");
				$("#loginPanel").css("width","980px");
			}	
			//$("#loginContainer").css("height",wHeight+"px");
			$("#loginBanner").css("marginTop",((wHeight-180)/2-34)+"px");
		} 
		$(window).resize(function(){resizeLayout()});
		$(function(){
			  resizeLayout();  
			  $("#fm :input[name='userName']").focus();
			  
			  $(document).keydown(function(e){ 
				  if(e.keyCode == 13){ 
					  $("#fm .btn_submit").click(); 
				  } 
			  }); 
		});
		
		function login(){
			$("#fm").form('submit',{
				url:'${pageContext.request.contextPath }/web/loginAction/login.do',
				onSubmit: function(){
					return $(this).form('validate');
				},
				success:function(data){
					var data = eval('(' + data + ')');
					if(data.flag){
						$("#dlg").dialog('close');
						window.location.href='${pageContext.request.contextPath }/web/loginAction/main.do';
					}else{
						$.messager.show({
							title:'提示',
							msg:data.msg,
							timeout:2000,
							showType:'slide'
						});
					}
				}
			});
		}
 
		//处理iframe页面跳转问题
		var ttop=window.top.location.href;
		var current=window.location.href;
		if(ttop!=current){
			top.location.href='login.jsp';
		}
		
		//点击刷新验证码
		function change(){
			$("#code").attr("src","${pageContext.request.contextPath }/authCode?date="+new Date());
		}
		
	</script>
	
	
</head>
<body> 
	 <div>&nbsp;</div>
	 <div id="bodyBanner"> </div>
	 <div id="loginBanner"> 
	    <div>&nbsp;</div>
		<div id="loginPanel">
			<div class="logoshow">
				<img src="${pageContext.request.contextPath }/resources/images/logo.png"/>
				<h3>平台后台管理系统</h3>
				<p align="center">Platform background management system</p>
			</div>
			<div class="loginFromPanel">
				<div class="loginContainterpanel">
					<h3><img src="${pageContext.request.contextPath }/resources/images/daoxiangiconf.png" height="22" align="top"  /><span>系统登录</span></h3>
						 
						
						<form id="fm" method="post">
						<p style="margin-top:20px;">
							<label>账户：</label><input name="userName" type="text" class="easyui-validatebox" required=true>
						</p>
						<p>
							<label>口令：</label><input name="password" type="password" class="easyui-validatebox" required=true>
						</p>
						<p>
							<label>验证码：</label><input name="valCode" style="width:90px;"><img id="code" src="${pageContext.request.contextPath }/authCode" width="110" height="25" border="1" style="margin-left:2px; line-height: 25;" onclick="change();"/>
						</p>
						<p>
							<input type="button" class="btn_submit" value="  登  录  " onclick="login()"/>
						</p>
					</form>
				</div>
			</div>
		</div>
	 </div>
	  
	 <div id="bottomCopy">版权所有  @To Laugh 研发组   联系我们 Email:ado#txdy.org</div>
</body>
</html>