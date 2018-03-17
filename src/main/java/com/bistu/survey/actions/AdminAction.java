package com.bistu.survey.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.bistu.survey.entities.Admin;
import com.bistu.survey.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements SessionAware {
	public static final long serialVersionUID = 1L;

	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	private Admin admin;
	
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	public Admin getAdmin() {
		return admin;
	}

	

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	private AdminService adminService;
	
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String valid() throws UnsupportedEncodingException {	
		Admin  ad= adminService.valid(admin.getName(),admin.getPass());
		if(ad==null){
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}else{
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			session.put("admin", ad);
		}
		return "success";

	}
	public String remove(){
		session.remove("admin");
		return "login";
	}
	
	
}
