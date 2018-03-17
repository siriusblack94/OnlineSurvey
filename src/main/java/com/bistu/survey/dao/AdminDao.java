package com.bistu.survey.dao;

import org.hibernate.Query;

import com.bistu.survey.entities.Admin;


public class AdminDao extends BaseDao{
	
	public Admin valid(String username,String password)  {
		String hql ="From Admin a where a.name=? and a.pass=?";
		Query query = getSession().createQuery(hql);
		query.setString(0, username);
		query.setString(1, password);
		return (Admin) query.uniqueResult();
	}
	
	
}
