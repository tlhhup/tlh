<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/resources/inc.jsp" %>
<script type="text/javascript">
	function save(){
		$("#fm").form("submit",{
			url:"${pageContext.request.contextPath }/web/clientAction/uploadClient.do",
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(data){
				data=eval("("+data+")");
				$.messager.show({
					 title: '提示信息',
	                   msg: data.msg
				});
			}
		})
	}
</script>
</head>
<body>
	<div>
		<form id="fm" method="post">
			<table>
				<tr>
					<td>版本号：</td>
					<td>
						<input name="version" type="number">
					</td>
				</tr>
				<tr>
					<td>客户端apk文件：</td>
					<td>
						<tlh:uploadButton name="url"/>
					</td>
				</tr>
				<tr>
					<td>描述：</td>
					<td>
						<tlh:editor name="description" width="200"/>
					</td>
				</tr>
				<tr style="margin-top: 50px;">
					<td colspan="2" align="center">
						<input type="button" value="提交" onclick="save();">
						<input type="reset" value="重置">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>