package com.tlh.system.mapper;

import java.util.List;
import java.util.Map;

import com.tlh.entity.Role;

public interface RoleMapper {

	public List<Role> queryAllRoles() throws Exception;
	
	public int saveRole(Role role) throws Exception;

	public int updateRole(Role role) throws Exception;

	public int deleteRole(Role role) throws Exception;

	public Role getRoleById(Integer id) throws Exception;

	/**
	 * 删除user_role_link中间表的数据
	 * @param data  两个参数:1、flag  true:根据角色id删除 false：根据用户id<br>
	 * 					   2、value 具体的值 
	 * @return
	 * @throws Exception
	 */
	public int deleteUser_Role(Map<String, Object> data) throws Exception;
	
	//easyui查询
	public List<Role> queryRoleInfo(Role role) throws Exception;

	public int queryRoleCount(Role role) throws Exception;

	/**
	 * 获取用户的角色
	 * @param uId
	 * @return
	 */
	public List<Integer> queryUserRoles(Integer uId) throws Exception;

	public int authorization(Map<String, Object> data) throws Exception;

}
