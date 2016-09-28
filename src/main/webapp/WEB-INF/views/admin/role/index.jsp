<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<%@include file="/resources/inc.jsp" %>
<script type="text/javascript">
	var url;
	$(function(){
		//初始化角色列表
		$("#roles").datagrid({
			url:'${pageContext.request.contextPath }/web/roleAction/queryRoles.do',
			idField:'id',
			loadMsg:'请稍后，数据加载中...............',
			pagination:true,
			striped:true,
			fitColumns:true,
			singleSelect:true,
			pageList:[10,15],
			columns:[[{
				title:'编号',
				field:'id',
				checkbox:true,
				width : 10
			},{
				title:'角色名称',
				field:'roleName',
				align:'center',
				width : 100
			},{
				title:'角色值',
				field:'roleValue',
				align:'center',
				width : 100
			},{
				title:'角色描述',
				field:'roleDesc',
				align:'center',
				width : 100
			}]],
			toolbar:'#tb',
			onClickRow:function(index,data){
				$.getJSON('${pageContext.request.contextPath }/web/menuAction/queryRoleMenus.do',{id:data.id},
					function(data){
						if(data!=null&&data.length>0){
							$("#rights").tree('loadData',data);
						}
					}
				)
			}
		});
		//初始化所有菜单
		$("#rights").tree({
			url:'${pageContext.request.contextPath }/web/menuAction/queryAllSysMenus.do',
			checkbox:true,
			lines:true,
			cascadeCheck:false,
			onCheck:function(node,checked){//父节点取消选中时，所有的孩子节点取消选中
				console.info(node.text);
				console.info(checked);
				if(!checked){//取消选中
					var childrens=$(this).tree('getChildren',node.target);
					if(childrens!=null){
						$.each(childrens,function(index,item){
							$("#rights").tree("uncheck",item.target);
						});
					}
				}
			}
		});
	})
	
	function add(){
		url="${pageContext.request.contextPath }/web/roleAction/add.do";
		$('#fm').form('clear');
		$('#dlg').dialog('open').dialog('setTitle','添加角色');
	}
	
	function del(){
		var row = $("#roles").datagrid('getSelected');
		if (row == null) {
			alert("请选择删除的角色！");
		} else {
			$.ajax({
				url:'${pageContext.request.contextPath }/web/roleAction/delete.do',
				data:{"id":row.id},
				success:function(data){
					if(data.flag){
						$("#roles").datagrid("clearSelections");
						$("#roles").datagrid("reload");
						$("#rights").tree("reload");
					}
					$.messager.show({
						 title: '提示信息',
                         msg: data.msg
					});
				} 
			});
		}
	}
	
	function edit(){
		var selected = $("#roles").datagrid('getSelected');
		if (selected == null) {
			alert("请选择修改的角色！");
		} else {
			var row = $('#roles').datagrid('getSelected');
			url="${pageContext.request.contextPath }/web/roleAction/update.do?id="+row.id;
			if (row) {
				$('#fm').form('clear');
				$('#dlg').dialog('open').dialog('setTitle','修改角色');
				$('#fm').form('load',row);
			}
		}
	}
	
	//保存数据
	function save(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(data){
				var data=eval('('+data+')');
				if(data.flag){
					$("#dlg").dialog("close");
					$("#roles").datagrid("reload");
					$("#roles").datagrid("clearSelections");
				}
				$.messager.show({
					 title: '提示信息',
                        msg: data.msg
				});
			}
		});
	}
	
	//添加授权
	function addRight(){
		var role = $("#roles").datagrid('getSelected');
		if (role == null) {
			alert("请选择授权的角色！");
		}else{
			var rights=$("#rights").tree('getChecked');
			if(rights!=null){
				$.ajax({
					url:'${pageContext.request.contextPath }/web/menuAction/authorRights.do',
					data:{rId:role.id,rightIds:getRightIds(rights)},
					dataType:'json',
					type:'POST',
					traditional:true,//必须设置
					success:function(data){
						if(data.flag){
							$("#roles").datagrid("reload");
							$("#roles").datagrid("clearSelections");
							$("#rights").tree("reload");
						}
						$.messager.show({
							 title: '提示信息',
	                         msg: data.msg
						});
					}
				})
			}
		}
	}
	
	//获取权限的id
	function getRightIds(rights){
		var arr=[];
		$.each(rights,function(i,item){
			arr.push(item.id);
			setParent(arr, item);
		});
		console.info(arr);
		//清除重复项
		arr=unique(arr);
		console.info(arr);
		return arr;
	}
	
	//设置父节点
	function setParent(arr,node){
		var parent=$("#rights").tree('getParent',node.target);
		console.info(parent);
		if(parent!=null){
			arr.push(parent.id);
			setParent(arr, parent);
		}else{
			return;
		}
	}
	
	//去重复数组
	function unique(data) {
		data = data || [];
		var a = {};
		len = data.length;
		for (var i = 0; i < len; i++) {
			var v = data[i];
			if (typeof (a[v]) == 'undefined') {//类似map中的key:不能重复
				a[v] = 1;
			}
		}
		data.length = 0;
		for (var i in a) {
			data[data.length] = i;
		}
		return data;
	}
</script>
<body class="easyui-layout" fit=true>
	<div data-options="region:'east',title:'分配权限'" style="width:250px;" collapsible=false>
		<ph:rightFilter url="web/menuAction/authorRights.do">
			<div align="center" style="padding: 2px;background-color: #E0ECFF;" >
				<a href="javascript:void(0)" plain=true onclick="addRight();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">角色授权</a>
			</div>
		</ph:rightFilter>
		<table id="rights"></table>
    </div>
    <div data-options="region:'center'">
	   	<table id="roles" title="角色信息管理"></table>
	   	<div id="tb">
	   		<ph:rightFilter url="web/roleAction/add.do">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">添加角色</a>
			</ph:rightFilter>	
			<ph:rightFilter url="web/roleAction/update.do">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit();">修改角色</a>
			</ph:rightFilter>
			<ph:rightFilter url="web/roleAction/delete.do">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="del();">删除角色</a>
			</ph:rightFilter>
		</div>
	
		<div id="dlg" class="easyui-dialog" draggable=false modal=true
			style="width: 350px; height: 250px; padding: 10px 20px" closed=true
			buttons="#dlg-buttons">
			<div class="ftitle" align="center">角色信息</div>
			<form id="fm" method="post" novalidate>
				<div class="fitem">
					<label>角色名称:</label> <input name="roleName" class="easyui-validatebox" required=true>
				</div>
				<div class="fitem">
					<label>角色值:</label> <input name="roleValue" class="easyui-validatebox">
				</div>
				<div class="fitem">
					<label>描述信息:</label> <input name="roleDesc" class="easyui-validatebox">
				</div>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
				iconCls="icon-ok" onclick="save();" style="width: 90px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
				style="width: 90px">取消</a>
		</div>
	</div>
</body>
</html>