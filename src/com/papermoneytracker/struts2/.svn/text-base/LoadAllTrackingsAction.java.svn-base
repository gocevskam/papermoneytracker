package com.papermoneytracker.struts2;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;

public class LoadAllTrackingsAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -138152865942071316L;
	private List<Tracking> trackings;
	
	
	public String execute() {
		
		trackings = TrackingDAO.getAll();

		return SUCCESS;
	}
	
	public String getJSON() {
		return execute();
	}


	public List<Tracking> getTrackings() {
		return trackings;
	}


	public void setTrackings(List<Tracking> trackings) {
		this.trackings = trackings;
	}

	
}
