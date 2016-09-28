package com.tlh.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tlh.entity.Role;
import com.tlh.system.mapper.MenuMapper;
import com.tlh.system.mapper.RoleMapper;
import com.tlh.system.service.RoleService;
import com.tlh.view.QueryResult;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	
	@Resource
	private RoleMapper roleMapper;
	
	@Resource
	private MenuMapper menuMapper;

	@Override
	public boolean saveEntity(Role t) throws Exception {
		return this.roleMapper.saveRole(t)>0;
	}

	@Override
	public boolean deleteEntity(Role t) throws Exception {
		try {
			//1、先删除角色权限中间表
			Map<String, Object> data=new HashMap<String,Object>();
			data.put("flag", true);
			data.put("value", t.getId());
			this.menuMapper.deleteRoleAndMenu(data);
			//2、再删除用户、角色表 
			this.roleMapper.deleteUser_Role(data);
			//3、再删自己
			this.roleMapper.deleteRole(t);
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean updateEntity(Role t) throws Exception {
		return this.roleMapper.updateRole(t)>0;
	}

	@Override
	public Role getEntity(Role id) throws Exception {
		return null;
	}

	@Override
	public List<Role> findEntity(Role t) throws Exception {
		return this.roleMapper.queryAllRoles();
	}

	@Override
	public QueryResult<Role> getDataGrid(Role t) throws Exception {
		return new QueryResult<Role>(this.roleMapper.queryRoleCount(t), this.roleMapper.queryRoleInfo(t));
	}

	@Override
	public List<Integer> queryUserRoles(Integer uId) throws Exception {
		return this.roleMapper.queryUserRoles(uId);
	}

	@Override
	public boolean authorization(Integer id, Integer[] rIds) {
		try {
			//1、清空用户角色
			Map<String, Object> data=new HashMap<String,Object>();
			data.put("flag", false);
			data.put("value", id);
			this.roleMapper.deleteUser_Role(data);
			//2、添加
			if(rIds!=null&&rIds.length>0){
				data=new HashMap<String,Object>();
				data.put("uId", id);
				data.put("rIds", rIds);
				this.roleMapper.authorization(data);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


}
