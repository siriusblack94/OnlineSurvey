package com.bistu.survey.dao;


import com.bistu.survey.entities.User;
import com.bistu.survey.entities.UserDTO;
import com.bistu.survey.entities.UserVO;
import org.hibernate.Query;
import org.springframework.beans.BeanUtils;

import java.util.Date;
import java.util.List;

public class UserDao  extends BaseDao{
	
		public List<User> getUsers(){
		String hql ="From User";
		return getSession().createQuery(hql).list();
		}
		public User findUserById(Integer uid){
			String hql="From User u where u.uid=?";
			//return (User)getSession().get(User.class, uid);
			return (User) getSession().createQuery(hql).setInteger(0, uid).list().get(0);
			
		}
		public void delete(Integer uid){
			User u =findUserById(uid);
			System.out.println(u);
			getSession().delete(u);
		}
		public User valid(String username,String password)  {
			String hql ="From User u where u.username=? and u.password=?";
			Query query = getSession().createQuery(hql);
			query.setString(0, username);
			query.setString(1, password);
			return (User) query.uniqueResult();
		}
		
		public void save(User user){
			User u = findUserById(user.getUid());
			BeanUtils.copyProperties(user, u, new String[]{"uid", "username","password","createtime"});
			getSession().update(u);
		}
		
		public String changePass(UserVO uservo,Integer id){
			User u =findUserById(id);
			if(uservo.getOldPass().equals(u.getPassword())){
				u.setPassword(uservo.getPass());
				getSession().update(u);
				return "yes";
			}
			return "no";
		}
		public void add(UserDTO userdto){
			User u = new User();
			BeanUtils.copyProperties(userdto, u);
			u.setCreatetime(new Date());
			getSession().save(u);
				
		}
}
