package com.tlh.system.mapper;

import java.util.List;

import com.tlh.entity.User;

public interface UserMapper {

	public int saveUserInfo(User user) throws Exception;

	public int deleteUserInfo(int id) throws Exception;

	public int updateLoginInfo(User user) throws Exception;

	public int getLoginCount(int id) throws Exception;

	public int updatePassword(User user) throws Exception;

	public int updateRealName(User user) throws Exception;

	// 登录验证
	public User validateUserInfo(User user) throws Exception;

	// 检测用户名是否可用
	public List<User> checkUserName(String userName) throws Exception;

	// easui查询
	public int getTotalCount(User t) throws Exception;

	public List<User> queryUsers(User t) throws Exception;

}
