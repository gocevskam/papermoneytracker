package com.papermoneytracker.hibernate;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "Moneyuser")
public class MoneyUser {
	//ID	(-> user registers with a username)
	@Id	@Column(name = "username")
	private String username;
	
	//MANDATORY + UNIQUE
	@Column(name = "email", nullable = false)
	private String email;
	
	//MANDATORY
	@Column(name = "password", nullable = false)
	private String password;

	@OneToMany(mappedBy = "trackedby", cascade = CascadeType.ALL, fetch = FetchType.EAGER)   
	@Column(name = "trackings")
	private List<Tracking> trackings; 
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public List<Tracking> getTrackings() {
		return trackings;
	}
}
