//easyui：电话验证
$.extend($.fn.validatebox.defaults.rules,{
	mobile:{// 验证手机号码 
		validator : function(value) { 
            return /^(13|15|18)\d{9}$/i.test(value); 
        }, 
        message : '手机号码格式不正确' 
	},
	phone : {// 验证电话号码 
        validator : function(value) { 
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
        }, 
        message : '格式不正确,请使用下面格式:020-88888888' 
    },
    equals: {//两次密码验证
        validator: function(value,param){
            return value == $(param[0]).val();
        },
        message: '两次密码不匹配'
    }
})