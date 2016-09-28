package com.tlh.system.action.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlh.entity.Menu;
import com.tlh.system.service.MenuService;
import com.tlh.view.MenuTreeGridModel;
import com.tlh.view.ParameterObject;
import com.tlh.view.QueryResult;
import com.tlh.view.TreeModel;

@Controller
@RequestMapping("/web/menuAction")
public class MenuAction {
	
	@Resource
	private MenuService menuService;
	
	@RequestMapping("/index")
	public String index(){
		return "admin/menu/index";
	}

	@RequestMapping("/menuIndex")
	public @ResponseBody QueryResult<MenuTreeGridModel> menuIndex(Menu menu) throws Exception{
		return this.menuService.findTreeMenuInfos(menu);
	}
	
	@RequestMapping("/queryAllMenus")
	public @ResponseBody List<TreeModel> queryAllMenus(Menu menu)throws Exception{
		return this.menuService.findAllMenus(menu);
	}
	
	@RequestMapping("/queryAllSysMenus")
	public @ResponseBody List<TreeModel> queryAllSysMenus()throws Exception{
		return this.menuService.queryAllSysMenus();
	}
	
	@RequestMapping("/add")
	public @ResponseBody ParameterObject add(Menu menu){
		ParameterObject result=new ParameterObject();
		try {
			if(this.menuService.saveEntity(menu)){
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
	public @ResponseBody ParameterObject delete(Menu menu){
		ParameterObject result=new ParameterObject();
		try {
			if(this.menuService.deleteEntity(menu)){
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
	public @ResponseBody ParameterObject update(Menu menu){
		ParameterObject result=new ParameterObject();
		try {
			if(this.menuService.updateEntity(menu)){
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
	
	@RequestMapping("/queryRoleMenus")
	public @ResponseBody List<TreeModel> queryRoleMenus(Integer id) throws Exception{
		return this.menuService.queryRoleMenus(id);
	}
	
	@RequestMapping("/authorRights")
	public @ResponseBody ParameterObject authorRights(Integer rId,Integer[] rightIds){
		ParameterObject result=new ParameterObject();
		try {
			if(this.menuService.saveRoleAndRights(rId,rightIds)){
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
	
}
