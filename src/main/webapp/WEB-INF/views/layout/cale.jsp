<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/resources/inc.jsp" %>
	<style type="text/css">
		body{padding:0;}
		td{ vertical-align: top;padding:0;margin:0;height:14%;overflow:hidden;}
		.caltdcontent{overflow-y:scroll;}
		.md{
			background:#efefef;
			border-bottom:1px dashed #ccc;
			background-position:2px center;
			text-align:right;
			font-weight:bold;
			padding:0 2px;
			color:#fff;
		}
	</style>
	
	<script type="text/javascript">
		var calHeght = 400;
		$(function(){
			//alert(parent.getAvaibleHeight());
			//alert(parseInt(parent.getAvaibleHeight())>400);
			// 设置日期单元格高度
			if(parseInt(parent.getAvaibleHeight())>400){
				calHeight = parseInt(parent.getAvaibleHeight());
				$("#calendar_task").css("height",(calHeight-7)+"px");
				$('#calendar_task').calendar('resize'); 
			}
			$(".caltdcontent").css({height:(calHeight*0.14)+"px"});
		});
	
	</script>
	
</head>
<body>
	 <!-- 日历提醒 -->
	<div id="calendar_task" class="easyui-calendar" style="width:100%;height:100%;border:none;" data-options="formatter:formatDay"></div>
	<script>
		var d1 = Math.floor((Math.random()*30)+1);
		var d2 = Math.floor((Math.random()*30)+1);
		function formatDay(date){
			var m = date.getMonth()+1;
			var d = date.getDate();
			var opts = $(this).calendar('options');
			if (opts.month == m && d == d1){
				return '<div class="caltdcontent"><div class="icon-ok md">' + d + '</div><div class="icon-ok md">' + d + '</div><div class="icon-ok md">' + d + '</div><div class="icon-ok md">' + d + '</div><div class="icon-ok md">' + d + '</div><div class="icon-ok md">' + d + '</div></div>';
			} else if (opts.month == m && d == d2){
				return '<div class="icon-search md">' + d + '</div>';
			}
			return d;
		}
		
		
		function controltdHeight(){
			//$(".caltdcontent").css({height:(calHeight*0.14)+"px"});
		}
	</script>
 
	
</body>
</html>