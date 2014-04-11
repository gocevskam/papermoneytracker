package com.papermoneytracker.struts2;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.DAO.MoneyUserDAO;

public class LoginAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 8390521228522608040L;
	private String username;
	private String password;
		
	private Map<String, Object> session;
	
	@Override
	public String execute() {
		MoneyUser user = (MoneyUser) session.get("user");
		if(user != null) {
			return SUCCESS;
		} else {
			if (checkUsernamePasswordCombination()) {				
				return SUCCESS;
			} else
				addActionError(getText("error.login"));
				return INPUT;
		}
		
	}
	
	/**
	 * Checks if the user is registered (using the DAO for database querying), 
	 * and checks the user's password, on success assign user to session.
	 * @return true if registered, false if not
	 */
	private boolean checkUsernamePasswordCombination() {
		MoneyUser userFromDB = MoneyUserDAO.get(username);
		if (userFromDB != null) {
			if (password.equals(userFromDB.getPassword())) {
				session.put("user", userFromDB);
				return true;
			}
			return false;
		} else
			return false;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
