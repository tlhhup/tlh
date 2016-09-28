<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/resources/inc.jsp"%>
<!-- 菜单面板 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.paperfold.css"/>
<script src="<%=request.getContextPath()%>/resources/js/modernizr.custom.71147.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.paperfold.js"></script>

<style type="text/css">
.cs-navi-tab {
	padding: 10px;
	text-decoration: none;
}
*{padding:0;margin:0;}
.menuitem{width:180px;margin:8px auto;
			border-radius:1px;
				box-shadow:1px 1px 3px #888888; }
				
.menuitem .mcon{background:#fff;border-top:1px solid #eee;display:block;margin:0;}		
.menuitem h5{height:32px;line-height:32px; background-repeat:no-repeat; background-position:7px 4px; background-color:#efefef;font-weight:normal;font-size:16px;cursor:pointer;text-indent:35px;}

.menuitem .mcon li{list-style:none;height:28px;line-height:28px;width:180px;margin:2px 0; }
.menuitem .mcon li a{font-size:14px;background-repeat:no-repeat; background-position:33px 5px;display:block;height:28px;line-height:28px;color:#555;text-decoration:none;text-indent:55px;}
.menuitem .mcon li a:hover{background-color:#52c3dd;color:#fff;font-weight:bold;}

</style>
</head>
<body style="background:url(${pageContext.request.contextPath}/resources/images/new_menupanel-bg.png) repeat-y;">
<div style="height:2px;">&nbsp;</div>
				
				<!-- 一级菜单 -->
	<c:forEach var="menu" items="${menus }">
		<!-- 二级菜单 -->
		<c:forEach var="node" items="${menu.children }">
			
			<ph:rightFilter url="${node.attributes.url }">
				<!-- 具有三级菜单 -->
				<c:if test="${fn:length(node.children)>0 }">
					<div class="menuitem">
						<h5 id="menutitle-${node.id}" 
							style="background-image:url(${pageContext.request.contextPath}/resources/images/icons/system.png);">
								${node.text }
						</h5>
						<div id = "menucon-${node.id}" class="mcon paperfold">
							<ul>
							<c:forEach var="n" items="${node.children }">
								<ph:rightFilter url="${n.attributes.url }">
									<li>
										<a href="${pageContext.request.contextPath }/${n.attributes.url }"
										   style="background-image:url(${pageContext.request.contextPath}/resources/images/icons/usermanager.png);"
											  target="mainFrame">${n.text }</a>
									</li>
								</ph:rightFilter>
							</c:forEach>
							</ul>
						</div>
					</div>
					
					<script type="text/javascript">
						$('#menucon-${node.id}').paperfold({
							'toggle': $("#menutitle-${node.id}"),
							'folds': 2
						});
					</script>
					
				</c:if>
				<!-- 只有二级菜单 -->
				<c:if test="${fn:length(node.children)==0 }">
					<ph:rightFilter url="${node.attributes.url }">
						<p><a href="${pageContext.request.contextPath }/${node.attributes.url }" class="cs-navi-tab" target="mainFrame">${node.text }</a></p>
					</ph:rightFilter>
				</c:if>
			</ph:rightFilter>
			
		</c:forEach>
	</c:forEach>
				
	 
</body>
</html>