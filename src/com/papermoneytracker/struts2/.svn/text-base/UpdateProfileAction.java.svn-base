package com.papermoneytracker.struts2;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.DAO.MoneyUserDAO;

public class UpdateProfileAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = -2958408011574655173L;
	
	private String email;

	private Map<String, Object> session;

	public String execute() {
		{
			MoneyUser user = (MoneyUser) session.get("user");
			if(user != null){
			MoneyUser userFromDb = MoneyUserDAO.get(user.getUsername());
			userFromDb.setEmail(email);
			MoneyUserDAO.update(userFromDb);
			return SUCCESS;
			}
			else{
				return INPUT;
			}
		}
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}	
}
