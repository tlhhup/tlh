package com.tlh.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.tlh.entity.Menu;
import com.tlh.system.mapper.MenuMapper;
import com.tlh.system.service.MenuService;
import com.tlh.view.MenuTreeGridModel;
import com.tlh.view.QueryResult;
import com.tlh.view.TreeModel;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Resource
	private MenuMapper menuMapper;

	@Override
	public boolean saveEntity(Menu t) throws Exception {
		if(t.getpId()!=null){//设置层级
			Integer serials = this.menuMapper.getSerials(t.getpId());
			t.setSerials(++serials);
		}
		int rightPos = 0;// 初始权限位和权限码
		long rightCode = 1;
		// 1、先获取最大权限位上的最大权限码
		Menu menu = this.menuMapper.getMaxRightPosAndMaxRightCode();
		if (menu != null) {
			if (menu.getRightCode() >= (1L << 60)) {// 判断最大权限码是否到达当前权限位的最大值
				rightPos = menu.getRightPos() + 1;
				rightCode = 1;
			} else {
				rightPos = menu.getRightPos();
				rightCode = menu.getRightCode() << 1;
			}
		} else {// 空表
			rightPos = 0;// 初始化权限位和权限码
			rightCode = 1;
		}
		t.setRightPos(rightPos);
		t.setRightCode(rightCode);
		return this.menuMapper.saveMenu(t) > 0;
	}

	@Override
	public boolean deleteEntity(Menu t) throws Exception {
		try {
			this.deleteMenu(t);
			return true;
		} catch (Exception e) {
			throw e;
		}
	}
	
	//递归删除
	private void deleteMenu(Menu menu) throws Exception{
		//1、先判断是否是叶子菜单
		List<Menu> childrens = this.menuMapper.getChildrens(menu.getId());
		if(childrens!=null&&childrens.size()>0){//非叶子菜单
			//2、否：递归
			for(Menu m:childrens){
				deleteMenu(m);
				//删除自身
				deleteSelf(menu);
			}
		}else{
			deleteSelf(menu);
		}
	}
	//删除自身
	private void deleteSelf(Menu menu) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("flag", false);
		data.put("value", menu.getId());
		this.menuMapper.deleteRoleAndMenu(data);
		this.menuMapper.deleteMenu(menu);
	}

	@Override
	public boolean updateEntity(Menu t) throws Exception {
		if(t.getpId()!=null){//设置层级
			Integer serials = this.menuMapper.getSerials(t.getpId());
			t.setSerials(++serials);
		}
		return this.menuMapper.updateMenu(t) > 0;
	}

	@Override
	public Menu getEntity(Menu t) throws Exception {
		return null;
	}

	@Override
	public List<Menu> findEntity(Menu t) throws Exception {
		return this.menuMapper.findMenuByUrl(t.getUrl());
	}

	@Override
	public QueryResult<Menu> getDataGrid(Menu t) throws Exception {
		return null;
	}

	@Override
	public QueryResult<MenuTreeGridModel> findTreeMenuInfos(Menu t) throws Exception {
		List<Menu> parents = this.menuMapper.queryFirstSerialMenus(t);
		List<MenuTreeGridModel> result = new ArrayList<MenuTreeGridModel>();
		MenuTreeGridModel model = null;
		for (Menu menu : parents) {
			model = new MenuTreeGridModel();
			BeanUtils.copyProperties(menu, model);
			// 计算孩子节点
			List<Menu> childrens = menuMapper.getChildrens(menu.getId());
			if (childrens.size() > 0) {
				model.setChildren(getTreeGrid(menu.getId()));
				model.setState("closed");
			}
			result.add(model);
			model = null;
		}
		return new QueryResult<MenuTreeGridModel>(this.menuMapper.getMenuCount(t), result);
	}

	// 递归回去子菜单
	private List<MenuTreeGridModel> getTreeGrid(Integer pId) throws Exception {
		List<Menu> menuInfos = menuMapper.getChildrens(pId);
		List<MenuTreeGridModel> result = new ArrayList<MenuTreeGridModel>();
		MenuTreeGridModel model = null;
		for (Menu menu : menuInfos) {
			model = new MenuTreeGridModel();
			BeanUtils.copyProperties(menu, model);
			// 计算孩子节点
			List<Menu> childrens = menuMapper.getChildrens(menu.getId());
			if (childrens.size() > 0) {
				model.setChildren(getTreeGrid(menu.getId()));
				model.setState("closed");
			}
			result.add(model);
			model = null;
		}
		return result;
	}

	@Override
	public List<TreeModel> findAllMenus(Menu m) throws Exception {
		// 获取一级菜单
		List<Menu> menuInfos = menuMapper.findMenuInfos(m);
		List<TreeModel> result = new ArrayList<TreeModel>();
		TreeModel model = null;
		for (Menu menu : menuInfos) {
			model = new TreeModel();
			model.setId(menu.getId());
			model.setText(menu.getTitle());
			// 计算孩子节点：所有的非按钮
			Menu parent = new Menu();
			parent.setpId(menu.getId());
			parent.setSerials(1);
			List<Menu> childrens = menuMapper.findMenuInfos(parent);
			if (childrens.size() > 0) {
				model.setChildren(getChildrens(parent,false));
				model.setState("closed");
			}
			result.add(model);
			model = null;
		}
		return result;
	}

	/**
	 * 递归获取下级所有的子菜单
	 * @param parent
	 * @param containtButton 是否包含按钮
	 * @return
	 * @throws Exception
	 */
	private List<TreeModel> getChildrens(Menu parent,boolean containtButton) throws Exception {
		List<TreeModel> result = new ArrayList<TreeModel>();
		TreeModel model = null;
		List<Menu> menuInfos = menuMapper.findMenuInfos(parent);
		for (Menu menu : menuInfos) {
			if(!containtButton&&menu.getIsButton()){//如果是按钮则
				continue;
			}
			model = new TreeModel();
			model.setId(menu.getId());
			model.setText(menu.getTitle());
			model.getAttributes().put("url", menu.getUrl());
			// 计算孩子节点：下级菜单
			Menu son = new Menu();
			son.setpId(menu.getId());
			son.setSerials(menu.getSerials() + 1);
			List<Menu> childrens = menuMapper.findMenuInfos(son);
			if (childrens.size() > 0) {
				List<TreeModel> nbc = getChildrens(son,containtButton);
				if(nbc.size()!=0){
					model.setState("closed");
					model.setChildren(nbc);
				}
			}
			result.add(model);
			model = null;
		}
		return result;
	}

	@Override
	public List<TreeModel> queryAllSysMenus() throws Exception {
		// 获取所有的一级菜单
		List<Menu> menuInfos = menuMapper.findMenuInfos(new Menu());
		List<TreeModel> result = new ArrayList<TreeModel>();
		TreeModel model = null;
		for (Menu menu : menuInfos) {
			model = new TreeModel();
			model.setId(menu.getId());
			model.setText(menu.getTitle());
			// 计算孩子节点：下级菜单
			Menu parent = new Menu();
			parent.setpId(menu.getId());
			parent.setSerials(menu.getSerials() + 1);
			List<Menu> childrens = menuMapper.findMenuInfos(parent);
			if (childrens.size() > 0) {
				model.setChildren(getChildrens(parent, true));
				model.setState("closed");
			}
			result.add(model);
			model = null;
		}
		return result;
	}


	@Override
	public boolean saveRoleAndRights(Integer rId, Integer[] rightIds) {
		try {
			//1、删除该角色的权限
			this.menuMapper.clearRoleRights(rId);
			//2、重新添加权限：提升清除所有权限的性能
			if(rightIds!=null&&rightIds.length>0){
				Map<String, Object> data=new HashMap<String,Object>();
				data.put("rId", rId);
				data.put("rightIds", rightIds);
				this.menuMapper.authorRights(data);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<TreeModel> queryRoleMenus(Integer id) throws Exception {
		//1、所有菜单(父级、子...)
		List<TreeModel> allMenus = this.queryAllSysMenus();
		//2、获取角色的菜单
		List<Menu> roleMenus = this.menuMapper.queryRoleMenus(id);
		if(roleMenus!=null){
			for(Menu menu:roleMenus)
				checkedMenu(allMenus, menu);
		}
		return allMenus;
	}
	
	//递归选中子菜单
	private void checkedMenu(List<TreeModel> allMenus, Menu menu) {
		for(TreeModel model:allMenus){
			if(model.getId()==menu.getId()){
				model.setChecked(true);
			}else{
				List<TreeModel> childrens = model.getChildren();
				checkedMenu(childrens, menu);
			}
		}
	}

	@Override
	public int getMaxRightPos() throws Exception {
		return this.menuMapper.getMaxRightPosAndMaxRightCode().getRightPos();
	}

	@Override
	public List<Menu> findAllMenuInfos() throws Exception {
		return this.menuMapper.findAllMenuInfos();
	}

}
