<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<%@include file="/resources/inc.jsp" %>
<script type="text/javascript">
	
	function save(){
		$("#fm").form("submit",{
			url:'${pageContext.request.contextPath }/userAction/update.action',
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(data){
				var data=eval('('+data+')');
				$.messager.show({
					 title: '提示信息',
                     msg: data.msg
				});
			}
		});
	}
	
</script>
<body>
	<%-- <div id="dlg" class="easyui-dialog" draggable="false" modal=true title="修改个人资料"
		style="width: 350px; height: 250px; padding: 10px 20px" closable=flase
		buttons="#dlg-buttons">
		<div class="ftitle" align="center">用户信息</div>
		<form id="fm" method="post" novalidate>
			<input name="id" type="hidden" value="${edit.id }">
			<div class="fitem">
				<label>用户名:</label> <input name="userName" class="easyui-textbox" readonly="readonly" value="${edit.userName }">
			</div>
			<div class="fitem">
				<label>真实姓名:</label> <input name="realName" class="easyui-textbox" value="${edit.realName }" required=true>
			</div>
			<div class="fitem">
				<label>联系地址:</label> <input name="address" class="easyui-textbox" value="${edit.address }" required=true>
			</div>
			<div class="fitem">
				<label>联系电话:</label> <input name="tel" class="easyui-textbox" validType="mobile" value="${edit.tel }" required=true>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="save();" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			style="width: 90px">取消</a>
	</div> --%>
	该界面需更具登录用户的类型再处理：学生、职工<br>
	1、更新个人信息(自身表中的数据)<br>
	2、更新系统用户表中的真实姓名
	
</body>
</html>