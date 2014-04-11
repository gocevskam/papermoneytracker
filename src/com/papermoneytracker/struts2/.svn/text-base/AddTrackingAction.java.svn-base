package com.papermoneytracker.struts2;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.Trail;
import com.papermoneytracker.hibernate.DAO.MoneyUserDAO;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;
import com.papermoneytracker.hibernate.DAO.TrailDAO;

public class AddTrackingAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = -7615400903889170268L;
	
	private String comment;
	private String location;
	private String billSerial;
	private String trailJson;
	
	private Map<String, Object> session;
	
	@Override
	public String execute() {
		if (session.get("user") == null) {
			addActionError(getText("error.loginRequired"));
			return INPUT;
		}
		
		String username = ((MoneyUser) session.get("user")).getUsername();
		
		MoneyUser retrievedUser = MoneyUserDAO.get(username);
		Trail retrievedTrail = TrailDAO.get(billSerial);
		Tracking t = new Tracking();
		t.setTrackedby(retrievedUser);
		t.setDate(new Date());
		t.setLocation(location);
		t.setTrail(retrievedTrail);
		t.setComment(comment);
		TrackingDAO.add(t);
		
		System.out.println(retrievedTrail.getTrackings());
		
		ShowTrailAction a = new ShowTrailAction();
		a.setBillSerial(billSerial);
		a.execute();
		setTrailJson(a.getTrailJson());
		
		return SUCCESS;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getBillSerial() {
		return billSerial;
	}

	public void setBillSerial(String billSerial) {
		this.billSerial = billSerial;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}	
	// get username from session and trail from db using bill serial

	public String getTrailJson() {
		return trailJson;
	}

	public void setTrailJson(String trailJson) {
		this.trailJson = trailJson;
	}
	
}
