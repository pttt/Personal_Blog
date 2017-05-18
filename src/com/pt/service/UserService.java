package com.pt.service;

import com.pt.po.User;

public interface UserService {
	//用户注册
	public boolean registerUser(User user);
	
	//用户登陆
	public boolean loginUser(User user);
}
