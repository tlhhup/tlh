<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/resources/inc.jsp"%>
<script type="text/javascript">
	var url;
	$(function(){
		$("#menudg").treegrid({
			url:'${pageContext.request.contextPath }/web/menuAction/menuIndex.do',
			idField:'id',
			treeField:'title',
			loadMsg:'请稍后，数据加载中...............',
			pagination:true,
			striped:true,
			fitColumns:true,
			singleSelect:true,
			pageList:[10,15],
			columns:[[{
				title:'编号',
				field:'id',
				align:'center',
				checkbox:true
			},{
				title:'菜单名称',
				field:'title',
				width:100
			},{
				title:'菜单地址',
				field:'url',
				align:'center',
				width:100,
				formatter:function(value){
					if(value.indexOf('#')==0){
						return "#";
					}else{
						return value;
					}
				}
			},{
				title:'菜单层级',
				field:'serials',
				align:'center',
				width:100
			},{
				title:'菜单样式',
				field:'icon',
				align:'center',
				width:100
			},{
				title:'排序',
				field:'sort',
				align:'center',
				width:100
			},{
				title:'按钮',
				field:'isButton',
				align:'center',
				width:100,
				formatter:function(value){
					return value?'是':'否';
				}
			}]],
			toolbar:'#tb'
		});
	});
	
	function add(){
		url="${pageContext.request.contextPath }/web/menuAction/add.do";
		$('#fm').form('clear');
		$('#cc').combotree('reload');
		$('#dlg').dialog('open').dialog('setTitle','添加菜单信息');
	}
	
	function del(){
		var row = $("#menudg").datagrid('getSelected');
		if (row == null) {
			alert("请选择删除的菜单！");
		} else {
			$.ajax({
				url:'${pageContext.request.contextPath }/web/menuAction/delete.do',
				data:{id:row.id},
				success:function(data){
					if(data.flag){
						$("#menudg").treegrid("clearSelections");
						$("#menudg").treegrid("reload");
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
		var selected = $("#menudg").datagrid('getSelected');
		if (selected == null) {
			alert("请选择修改的菜单！");
		} else {
			var row = $('#menudg').datagrid('getSelected');
			url="${pageContext.request.contextPath }/web/menuAction/update.do?id="+row.id;
			if (row) {
				$('#fm').form('clear');
				$('#dlg').dialog('open').dialog('setTitle','修改菜单信息');
				$('#cc').combotree('reload');
				$('#fm').form('load',row);
			}
		}
	}
	
	function save(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(data){
				console.info(data);
				var data=eval('('+data+')');
				console.info(data);
				if(data.flag){
					$("#dlg").dialog("close");
					$("#menudg").treegrid("reload");
					$("#menudg").treegrid("clearSelections");
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

	<table id="menudg" title="系统菜单管理"></table>
	<div id="tb">
		<ph:rightFilter url="web/menuAction/add.do">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();">添加菜单</a>
		</ph:rightFilter>	
		<ph:rightFilter url="web/menuAction/update.do">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit();">修改菜单</a>
		</ph:rightFilter>
		<ph:rightFilter url="web/menuAction/delete.do">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="del();">删除菜单</a>
		</ph:rightFilter>
	</div>
	
	<div id="dlg" class="easyui-dialog" draggable=false modal=true
		style="width: 340px; height: 290px; padding: 10px 20px" closed=true
		buttons="#dlg-buttons">
		<div class="ftitle" align="center">菜单信息</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>父级菜单:</label> 
				<select name="pId" id="cc" class="easyui-combotree" style="width:165px;"
				        data-options="url:'${pageContext.request.contextPath }/web/menuAction/queryAllMenus.do'">
				</select>
			</div>
			<div class="fitem">
				<label>菜单名称:</label> <input name="title" class="easyui-validatebox" required=true>
			</div>
			<div class="fitem">
				<label>菜单地址:</label> <input name="url" type="text">
			</div>
			<div class="fitem">
				<label>菜单样式:</label> <input name="icon" type="text">
			</div>
			<div class="fitem">
				<label>按钮:</label>
				<select name="isButton" class="easyui-combobox easyui-validatebox" required=true style="width:165px;">
					<option value="0">否</option>
					<option value="1">是</option>
				</select>
			</div>
			<div class="fitem">
				<label>排序:</label> <input name="sort" type="number" value="0">
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
</body>
</html>