package com.tlh.system.service;

import java.util.List;

import com.tlh.entity.Role;

public interface RoleService extends BaseService<Role> {

	/**
	 * 获取用户的角色
	 * @param uId
	 * @return
	 * @exception
	 */
	List<Integer> queryUserRoles(Integer uId) throws Exception;

	/**
	 * 用户授权
	 * @param id
	 * @param rIds
	 * @return
	 */
	boolean authorization(Integer id, Integer[] rIds);
	
}
