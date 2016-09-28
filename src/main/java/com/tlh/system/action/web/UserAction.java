package com.tlh.system.action.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlh.entity.User;
import com.tlh.system.service.UserService;
import com.tlh.view.ParameterObject;
import com.tlh.view.QueryResult;

@Controller
@RequestMapping("/web/userAction")
public class UserAction {

	@Resource
	private UserService userService;

	@RequestMapping("/index")
	public String index() {
		return "admin/user/index";
	}

	@RequestMapping("/userInfos")
	public @ResponseBody QueryResult<User> userInfos(User user) throws Exception {
		return this.userService.getDataGrid(user);
	}
	
	@RequestMapping("/restPassword")
	public @ResponseBody ParameterObject restPassword(User user){
		ParameterObject result=new ParameterObject();
		try {
			user.setPassword("111111"); 
			if(this.userService.updatePassword(user)){
				result.flag(true);
				result.msg("重置密码成功！");
			}
		} catch (Exception e) {
			result.flag(false);
			result.msg("重置密码失败！");
		}
		return result;
	}
	
	@RequestMapping("/modifyPwd")
	public String restPwd(){
		return "admin/user/restPwd";
	}
	
	@RequestMapping("/updatePwd")
	public @ResponseBody ParameterObject updatePwd(Integer flag,User user){
		ParameterObject result=new ParameterObject();
		try {
			if(flag.equals(1)){
				this.userService.updatePassword(user);
				result.flag(true);
				result.msg("修改密码成功，请重新登陆！");
			}
			return result;
		} catch (Exception e) {
			result.flag(false);
			result.msg("操作失败");
		}
		return result;
	}
	
	@RequestMapping("/edit")
	public String edit(){
		return "admin/user/edit";
	}

}
