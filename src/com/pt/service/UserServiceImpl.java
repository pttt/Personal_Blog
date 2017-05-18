package com.pt.service;

import com.pt.dao.UserDAO;
import com.pt.po.User;
import com.pt.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDAO userDAO;
	
	public boolean registerUser(User user) {
		//�ж��û��Ƿ����
		if(userDAO.queryByID(user.getUsername()) != null) {
			return false;
		}else {
			userDAO.add(user);
			return true;
		}
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public boolean loginUser(User user) {
		//�ж��û��Ƿ����
		if(userDAO.queryByID(user.getUsername()) == null) {
			return false;
		} else {
			User queryUser = userDAO.queryByID(user.getUsername());
			if(queryUser.getPassword().equals(user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	

}
