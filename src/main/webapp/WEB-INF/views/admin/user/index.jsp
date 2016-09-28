<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<%@include file="/resources/inc.jsp" %>
<script type="text/javascript">
	var url;
	$(function(){
		$("#users").datagrid({
			url:'${pageContext.request.contextPath }/web/userAction/userInfos.do',
			idField:'id',
			loadMsg:'请稍后，数据加载中...............',
			pagination:true,
			striped:true,
			fitColumns:true,
			singleSelect:true,
			pageList:[10,15],
			toolbar:'#tb',
			columns:[[{
				title:'用户编号',
				field:'id',
				checkbox:true,
				width : 10
			},{
				title:'登录账户',
				field:'userName',
				align:'center',
				width : 100
			},{
				title:'真实姓名',
				field:'realName',
				align:'center',
				width : 100
			},{
				title:'注册时间',
				field:'registTime',
				align:'center',
				width : 100,
				formatter:function(val){
					if(val!=null){
						return $.fn.datebox.defaults.formatter(new Date(val));
					}
				}
			},{
				title:'最后登录时间',
				field:'lastLogin',
				align:'center',
				width : 100,
				formatter:function(val){
					if(val!=null){
						return $.fn.datebox.defaults.formatter(new Date(val));
					}
				}
			},{
				title:'登录次数',
				field:'loginCount',
				align:'center',
				width : 100
			}]]
		});
		$("#users").datagrid('getPager').pagination({
			buttons:'#pg-buttons'
		});
	})
	
	//重置密码
	function restPwd(){
		var row = $("#users").datagrid('getSelected');
		if (row == null) {
			alert("请选择重置密码的用户！");
		} else {
			$.ajax({
				url:'${pageContext.request.contextPath }/web/userAction/restPassword.do',
				data:{id:row.id},
				success:function(data){
					if(data.flag){
						$("#users").datagrid("clearSelections");
					}
					$.messager.show({
						 title: '提示信息',
                         msg: data.msg
					});
				} 
			});
		}
	}
	
	//用户授权
	function userAuthor(){
		var row = $("#users").datagrid('getSelected');
		if (row == null) {
			alert("请选择授权的用户！");
		}else{
			$.ajax({
				url:'${pageContext.request.contextPath }/web/roleAction/queryUserRoles.do',
				data:{uId:row.id},
				success:function(data){
					if(data.flag){
						$('#authorFm').form('clear');
						$("#audg").dialog('open').dialog('setTitle','用户授权');
						row.rIds=data.rIds;
						$('#authorFm').form('load',row);
					}else{
						$.messager.show({
							 title: '提示信息',
	                         msg: data.msg
						});
					}
				}
			})
		}
	}
	
	function authorization(){
		$("#authorFm").form("submit",{
			url:'${pageContext.request.contextPath }/web/roleAction/authorization.do',
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(data){
				var data=eval('('+data+')');
				if(data.flag){
					$("#audg").dialog("close");
					$("#users").datagrid("reload");
					$("#users").datagrid("clearSelections");
				}
				$.messager.show({
					 title: '提示信息',
                        msg: data.msg
				});
			}
		});
	}
	
</script>
<body>
	<table id="users" title="用户信息"></table>
	<div id="tb" style="padding:2px 5px;">
		<form id="param">
	                   注册时间: <input class="easyui-datebox" style="width:110px">
	                    到: <input class="easyui-datebox" style="width:110px">
	        <label>用户名：</label><input name="userName" type="text">
	        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="$.dgQuery('#param','#users');">查询</a>
        </form>
    </div>
    
    <div id="pg-buttons">
    	<ph:rightFilter url="web/userAction/restPassword.do">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="restPwd();">重置密码</a>
		</ph:rightFilter>	
		<ph:rightFilter url="web/roleAction/authorization.do">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="userAuthor();">用户授权</a>
		</ph:rightFilter>
    </div>
	
	<!-- 用户授权 -->
	<div id="audg" class="easyui-dialog" draggable="false" modal=true
		style="width: 350px; height: 200px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle" align="center">用户授权</div>
		<form id="authorFm" method="post" novalidate>
			<input name="id" type="hidden">
			<div class="fitem">
				<label>角色名称:</label> <input name="rIds" class="easyui-combobox" multiple=true data-options="valueField:'id',textField:'roleName',url:'${pageContext.request.contextPath }/web/roleAction/queryAllRoles.do'">
			</div>
			<div class="fitem">
				<label>授权用户:</label> <input name="userName" class="easyui-textbox">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="authorization();" style="width: 90px">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#audg').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</body>
</html>