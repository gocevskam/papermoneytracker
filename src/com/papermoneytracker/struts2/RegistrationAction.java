package com.papermoneytracker.struts2;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.DAO.MoneyUserDAO; 

public class RegistrationAction extends ActionSupport implements SessionAware {
	static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String passwordConfirmation;
	private String email;
	
	private Map<String, Object> session;
	
	public String execute() {
		if (password.equals(passwordConfirmation)) {
			if (checkIfUsernameExists())
				return INPUT;
			else		
				return SUCCESS;		
		} else {
			addActionError(getText("error.register.password"));
			return INPUT;
		}
	}

	/**
	 * Checks if there exists a user with this username yet (using the DAO for database querying), 
	 * and automatically logs in a user if the new user was created.
	 * @return true if username exists yet, false if not
	 */
	private boolean checkIfUsernameExists() {
		MoneyUser userFromDB = MoneyUserDAO.get(username);		
		if (userFromDB == null) {
			MoneyUser user = new MoneyUser();
			user.setUsername(username);
			user.setPassword(password);
			user.setEmail(email);
			MoneyUserDAO.add(user);
			session.put("user", MoneyUserDAO.get(username));
			return false;
		} else {
			addActionError(getText("error.register.username"));
			return true;
		}
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

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
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
