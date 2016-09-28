package com.tlh.system.service;

import java.util.List;

import com.tlh.entity.Menu;
import com.tlh.view.MenuTreeGridModel;
import com.tlh.view.QueryResult;
import com.tlh.view.TreeModel;

public interface MenuService extends BaseService<Menu> {

	/**
	 * 菜单列表信息
	 * @param menu
	 * @return
	 */
	QueryResult<MenuTreeGridModel> findTreeMenuInfos(Menu menu) throws Exception;

	/**
	 * 返回树形菜单:所有的非按钮级别的菜单
	 * @return
	 */
	List<TreeModel> findAllMenus(Menu menu) throws Exception;

	/**
	 * 返回所有的的菜单：包含按钮
	 * @return
	 */
	List<TreeModel> queryAllSysMenus() throws Exception;

	/**
	 * 角色授权
	 * @param rId
	 * @param rightIds
	 * @return
	 */
	boolean saveRoleAndRights(Integer rId, Integer[] rightIds);

	/**
	 * 获取该角色的所有的叶子菜单
	 * @param id
	 * @return
	 */
	List<TreeModel> queryRoleMenus(Integer id) throws Exception;

	/**
	 * 获取最大权限位
	 * @return
	 */
	int getMaxRightPos() throws Exception;

	/**
	 * 获取所有的权限
	 * @return
	 */
	List<Menu> findAllMenuInfos() throws Exception;

}
