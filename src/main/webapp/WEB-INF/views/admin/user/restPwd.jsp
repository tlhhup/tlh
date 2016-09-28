<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<%@include file="/resources/inc.jsp" %>
<script type="text/javascript">
	
	function save(){
		$("#fm").form("submit",{
			url:'${pageContext.request.contextPath }/web/userAction/updatePwd.do',
			onSubmit:function(){
				var old=document.getElementById("pwd").defaultValue;
				var value=document.getElementById("pwd").value;
				if(old==value){//没有修改密码
					$("#fm input[name='flag']").val('0');
				}else{
					$("#fm input[name='flag']").val('1');
				}
				return $(this).form("validate");
			},
			success:function(data){
				var data=eval('('+data+')');
				if(data.flag){
					$.messager.alert('提示',data.msg,'info',function(){
						top.location.href='${pageContext.request.contextPath }/web/loginAction/logout.do'
					});
				}else{
					$.messager.show({
						 title: '提示信息',
	                     msg: data.msg
					});
				}
			}
		});
	}
	
</script>
<body>
	<div id="dlg" class="easyui-dialog" draggable="false" modal=true title="修改密码"
		style="width: 350px; height: 250px; padding: 10px 20px" closable=flase
		buttons="#dlg-buttons">
		<div class="ftitle" align="center">修改密码</div>
		<form id="fm" method="post" novalidate>
			<input name="id" type="hidden" value="${user.id }">
			<input name="flag" type="hidden">
			<div class="fitem">
				<label>用户名:</label> <input name="userName" class="easyui-textbox" readonly="readonly" value="${user.userName }">
			</div>
			<div class="fitem">
				<label>原始密码:</label> <input id="pwd" name="password" type="password" class="easyui-textbox" value="${user.password }" required=true>
			</div>
			<div class="fitem">
				<label>确认密码:</label> <input class="easyui-textbox" type="password" value="${user.password }" required=true validType="equals['#pwd']">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save();" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			style="width: 90px">取消</a>
	</div>
	
</body>
</html>