package com.pt.service;

import com.pt.po.User;

public interface UserService {
	//�û�ע��
	public boolean registerUser(User user);
	
	//�û���½
	public boolean loginUser(User user);
}
