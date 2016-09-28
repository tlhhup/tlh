package com.tlh.system.action.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlh.entity.Role;
import com.tlh.entity.User;
import com.tlh.system.service.RoleService;
import com.tlh.view.ParameterObject;
import com.tlh.view.QueryResult;

@Controller
@RequestMapping("/web/roleAction")
public class RoleAction {

	@Resource
	private RoleService roleService;
	
	@RequestMapping("/index")
	public String index(){
		return "admin/role/index";
	}
	
	@RequestMapping("/queryRoles")
	public @ResponseBody QueryResult<Role> queryRoles(Role role)throws Exception{
		return this.roleService.getDataGrid(role);
	}
	
	@RequestMapping("/add")
	public @ResponseBody ParameterObject add(Role role){
		ParameterObject result=new ParameterObject();
		try {
			if(this.roleService.saveEntity(role)){
				result.flag(true);
				result.msg("操作成功！");
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.flag(false);
		result.msg("操作失败！");
		return result;
	}
	
	@RequestMapping("/update")
	public @ResponseBody ParameterObject update(Role role){
		ParameterObject result=new ParameterObject();
		try {
			if(this.roleService.updateEntity(role)){
				result.flag(true);
				result.msg("操作成功！");
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.flag(false);
		result.msg("操作失败！");
		return result;
	}
	
	@RequestMapping("/delete")
	public @ResponseBody ParameterObject delete(Role role){
		ParameterObject result=new ParameterObject();
		try {
			if(this.roleService.deleteEntity(role)){
				result.flag(true);
				result.msg("操作成功！");
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.flag(false);
		result.msg("操作失败！");
		return result;
	}
	
	@RequestMapping("/queryAllRoles")
	public @ResponseBody List<Role> queryAllRoles()throws Exception{
		return this.roleService.findEntity(null);
	}
	
	@RequestMapping("/queryUserRoles")
	public @ResponseBody ParameterObject queryUserRoles(Integer uId){
		ParameterObject result=new ParameterObject();
		try {
			List<Integer> roles = this.roleService.queryUserRoles(uId);
			result.flag(true);
			result.put("rIds", roles);
			return result;
		} catch (Exception e) {
		}
		result.flag(false);
		result.msg("操作无效！");
		return result;
	}
	
	@RequestMapping("/authorization")
	public @ResponseBody ParameterObject authorization(User user,Integer[] rIds){
		ParameterObject result=new ParameterObject();
		try {
			if(this.roleService.authorization(user.getId(),rIds)){
				result.flag(true);
				result.msg("操作成功");
				return result;
			}
		} catch (Exception e) {
		}
		result.flag(false);
		result.msg("操作失败！");
		return result;
	}
	
}
