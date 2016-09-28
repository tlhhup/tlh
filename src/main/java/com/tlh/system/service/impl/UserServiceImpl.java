package com.tlh.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.tlh.entity.User;
import com.tlh.system.mapper.UserMapper;
import com.tlh.system.service.UserService;
import com.tlh.view.QueryResult;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	@Override
	public boolean saveEntity(User t) throws Exception {
		//初始密码111111
		t.setPassword(DigestUtils.md5DigestAsHex("111111".getBytes()));
		return this.userMapper.saveUserInfo(t) > 0;
	}

	@Override
	public boolean deleteEntity(User t) throws Exception {
		return this.userMapper.deleteUserInfo(t.getId()) > 0;
	}

	/**
	 * 更新真实姓名
	 */
	@Override
	public boolean updateEntity(User t) throws Exception {
		return this.userMapper.updateRealName(t)>0;
	}

	/**
	 * 验证用户登录
	 */
	@Override
	public User getEntity(User t) throws Exception {
		t.setPassword(DigestUtils.md5DigestAsHex(t.getPassword().getBytes()));
		return this.userMapper.validateUserInfo(t);
	}

	/**
	 * 验证用户名是否可用
	 */
	@Override
	public List<User> findEntity(User t) throws Exception {
		return this.userMapper.checkUserName(t.getUserName());
	}

	@Override
	public QueryResult<User> getDataGrid(User t) throws Exception {
		return new QueryResult<User>(userMapper.getTotalCount(t), userMapper.queryUsers(t));
	}

	@Override
	public boolean updateLoginInfo(User user) throws Exception {
		int loginCount = this.userMapper.getLoginCount(user.getId());
		user.setLoginCount(++loginCount);
		return this.userMapper.updateLoginInfo(user)>0;
	}

	@Override
	public boolean updatePassword(User user) throws Exception {
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		return this.userMapper.updatePassword(user)>0;
	}

}
