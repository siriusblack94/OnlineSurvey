package com.bistu.survey.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.bistu.survey.entities.User;
import com.bistu.survey.entities.UserDTO;
import com.bistu.survey.entities.UserVO;
import com.bistu.survey.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements RequestAware, SessionAware {
	public static final long serialVersionUID = 1L;
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private Map<String, Object> request;
	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String list() {
		request.put("users", userService.getUsers());
		return "list";
	}

	private Integer uid;

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getUid() {
		return uid;
	}

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public String delete() {
		try {
			userService.delete(uid);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "delete";
	}

	

	private String username;
	private String password;

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String valid() throws UnsupportedEncodingException {
		User u = userService.valid(username, password);
		if (u == null) {
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		} else {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			session.put("user", u);
		}
		return "valid";

	}

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String modify() {
		User u = (User) session.get("user");
		user.setUid(u.getUid());
		userService.save(user);
		request.put("msg", "修改成功");
		session.put("user", user);
		
		return "save";
	}

	private UserVO uservo;

	public UserVO getUservo() {
		return uservo;
	}

	public void setUservo(UserVO uservo) {
		this.uservo = uservo;
	}

	public String changePass() throws UnsupportedEncodingException {
		User u = (User) session.get("user");
		String notice = userService.changePass(uservo, u.getUid());
		if (notice.equals("yes")) {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} else {
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "change";
	}
	private  UserDTO userdto;
	
	
	public UserDTO getUserdto() {
		return userdto;
	}

	public void setUserdto(UserDTO userdto) {
		this.userdto = userdto;
	}

	public String add(){
		userService.add(userdto);
		return "add";
	}
	
	public String remove(){
		session.remove("user");
		return "add";
	}
}
