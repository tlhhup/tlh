<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<%@include file="/resources/inc.jsp"%>
<script type="text/javascript">
	$(function(){
		$("#log").datagrid({
			url:'${pageContext.request.contextPath }/web/logAction/queryLogInfos.do',
			idField:'id',
			loadMsg:'请稍后，数据加载中...............',
			pagination:true,
			striped:true,
			fitColumns:true,
			singleSelect:true,
			toolbar:'#tb',
			pageList:[10,15],
			columns:[[{
				title:'编号',
				field:'id',
				checkbox:true,
				width : 10
			},{
				title:'操作人',
				field:'operator',
				align:'center',
			},{
				title:'操作名称',
				field:'operName',
				align:'center',
			},{
				title:'操作参数',
				field:'operParams',
				align:'center',
				width : 100
			},{
				title:'操作结果',
				field:'operResult',
				align:'center',
				width : 100
			},{
				title:'结果信息',
				field:'resultMsg',
				align:'center',
				width : 100
			},{
				title:'ip地址',
				field:'ip',
				align:'center',
				width : 100
			},{
				title:'操作时间',
				field:'operTime',
				align:'center',
				width : 100,
				formatter:function(val){
					return $.fn.datebox.defaults.formatter(new Date(val));
				}
			}]]
		})
	});
</script>
<body>
	<table id="log" title="日志管理"></table>
	<div id="tb" style="padding:2px 5px;">
		<form id="param">
	                   操作时间: <input name="operTime" class="easyui-datebox" style="width:110px">
	                    到: <input name="to" class="easyui-datebox" style="width:110px">
	        <a href="#" class="easyui-linkbutton" onclick="$.dgQuery('#param','#log');" iconCls="icon-search">查询</a>
        </form>
    </div>
</body>
</html>