package com.bistu.survey.service;

import java.util.List;

import com.bistu.survey.dao.UserDao;
import com.bistu.survey.entities.User;
import com.bistu.survey.entities.UserDTO;
import com.bistu.survey.entities.UserVO;

public class UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public List<User> getUsers(){
		return userDao.getUsers();
	}
	public void delete(Integer uid){
		 userDao.delete(uid);
	}
	public User valid(String username,String password)  {
		return userDao.valid(username, password);
	}
	
	public void save(User user){
		userDao.save(user);
	}
	public String changePass(UserVO uservo,Integer id){
		return userDao.changePass(uservo, id);
		
	}
	
	public void add(UserDTO userdto){
		userDao.add(userdto);
	}
	
}
