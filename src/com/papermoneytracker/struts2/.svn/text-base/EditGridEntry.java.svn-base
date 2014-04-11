package com.papermoneytracker.struts2;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;

public class EditGridEntry extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private String oper;
	private String id;
	
	private int trackingId;
	private String serial;
	private Date date;
	private String location;
	private String comment;

	public String execute() {
		System.out.println(id);
		if (oper.equalsIgnoreCase("edit")) {
			Tracking t = TrackingDAO.get(Integer.parseInt(id));
			t.setLocation(location);
			t.setComment(comment);
			TrackingDAO.update(t);
		}
		return SUCCESS;
	}

	public String getJSON() {
		return execute();
	}
	
	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public int getTrackingId() {
		return trackingId;
	}

	public void setTrackingId(int trackingId) {
		this.trackingId = trackingId;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

}