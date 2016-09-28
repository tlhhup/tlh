package com.tlh.system.service;

import com.tlh.entity.User;

public interface UserService extends BaseService<User> {

	public boolean updateLoginInfo(User user) throws Exception;

	public boolean updatePassword(User user) throws Exception;
	
}
