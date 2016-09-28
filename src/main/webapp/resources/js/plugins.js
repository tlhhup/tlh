;(function($){
  $.extend({
     form2json:function(form){//将from表单中的数据转换为json对象
    	var str=$(form).serialize();//serialize()自动调用了encodeURIComponent方法将数据编码了 
    	str=decodeURIComponent(str,true);//调用decodeURIComponent(str,true);将数据解码 
		str = str.replace(/&/g, "\",\"" );
		str = str.replace(/=/g, "\":\"" );
		str = "{\"" +str + "\"}" ;
		str=$.parseJSON(str);
		return str;
     },
     dgQuery:function(form,dg){//dagrid查询
    	 var param=$.form2json(form);
    	 $(dg).datagrid('load',param); 
     }
  })
})(jQuery);