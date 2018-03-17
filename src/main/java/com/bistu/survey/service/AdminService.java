package com.bistu.survey.service;

import com.bistu.survey.dao.AdminDao;
import com.bistu.survey.entities.Admin;

public class AdminService {
	private AdminDao adminDao;
	
	
	public AdminDao getAdminDao() {
		return adminDao;
	}


	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}



	public Admin valid(String username,String password)  {
		return adminDao.valid(username, password);
	}
}
