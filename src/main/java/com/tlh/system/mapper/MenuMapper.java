package com.tlh.system.mapper;

import java.util.List;
import java.util.Map;

import com.tlh.entity.Menu;

public interface MenuMapper {

	/**
	 * 获取指定菜单的层级
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Integer getSerials(int id) throws Exception;
	
	public int saveMenu(Menu menu) throws Exception;

	/**
	 * 删除role_right_link中间表的数据
	 * @param data  两个参数:1、flag  true:根据角色id删除 false：根据权限id<br>
	 * 					   2、value 具体的值 
	 * @return
	 * @throws Exception
	 */
	public int deleteRoleAndMenu(Map<String, Object> data) throws Exception;
	
	public int deleteMenu(Menu menu) throws Exception;
	
	public int updateMenu(Menu menu) throws Exception;

	/**
	 * 获取最大权限位、权限码
	 * @return
	 */
	public Menu getMaxRightPosAndMaxRightCode() throws Exception;

	//获取所有一级菜单
	public List<Menu> queryFirstSerialMenus(Menu t)throws Exception;
	
	//计算一级菜单数目
	public int getMenuCount(Menu t)throws Exception;

	//获取子菜单
	public List<Menu> getChildrens(Integer pId)throws Exception;

	//通过地址查询权限信息
	public List<Menu> findMenuByUrl(String url)throws Exception;

	//查询菜单
	public List<Menu> findMenuInfos(Menu menu)throws Exception;

	public int clearRoleRights(Integer rId) throws Exception;

	public void authorRights(Map<String, Object> data) throws Exception;

	//获取角色的权限
	public List<Menu> queryRoleMenus(Integer id) throws Exception;

	//获取所有的权限
	public List<Menu> findAllMenuInfos() throws Exception;

}
