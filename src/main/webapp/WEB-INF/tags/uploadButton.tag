<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="name" description="提交表单时名称" required="true" type="java.lang.String" %>
<script type="text/javascript">
	KindEditor.ready(function(K) {
		var uploadbutton = K.uploadbutton({
			button : K('#uploadButton')[0],
			fieldName : 'imgFile',
			url : '${pageContext.request.contextPath }/resources/kindeditor-4.1.10/jsp/upload_json.jsp?dir=file',
			afterUpload : function(data) {
				if (data.error === 0) {
					var url = K.formatUrl(data.url, 'absolute');
					$("#fm :input[name='url']").val(url);
				} else {
					alert(data.message);
				}
			},
			afterError : function(str) {
				alert('自定义错误信息: ' + str);
			}
		});
		uploadbutton.fileBox.change(function(e) {
			uploadbutton.submit();
		});
	});
</script>
<div class="upload">
	<input class="ke-input-text" type="text" name="${name }" readonly="readonly" style="width: 165px;"/> <input type="button" id="uploadButton" value="上传" />
</div>