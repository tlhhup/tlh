<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="name" description="表单提交名称" required="false" type="java.lang.String" %>
<%@ attribute name="width" description="编辑器宽度" required="false" type="java.lang.String" %>
<%@ attribute name="height" description="编辑器高度" required="false" type="java.lang.String" %>
<script type="text/javascript">
	KindEditor.ready(function(K) {
		var editor = K.create('textarea[name="${name}"]', {
			cssPath : '${pageContext.request.contextPath }/resources/kindeditor-4.1.10/plugins/code/prettify.css',
			uploadJson : '${pageContext.request.contextPath }/resources/kindeditor-4.1.10/jsp/upload_json.jsp',
			fileManagerJson : '${pageContext.request.contextPath }/resources/kindeditor-4.1.10/jsp/file_manager_json.jsp',
			allowFileManager : true,
			resizeType:0,
			afterBlur:function(){
				//同步数据
				editor.sync();
			}
		});
	});
</script>
<div style="width:${ empty width? 300:width}px;height:${empty height? 150:width }px;">
	<textarea name="${name}" cols="100" rows="8"></textarea>
</div>