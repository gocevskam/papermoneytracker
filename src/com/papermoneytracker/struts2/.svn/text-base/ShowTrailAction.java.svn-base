package com.papermoneytracker.struts2;

import java.util.List;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.Trail;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;
import com.papermoneytracker.hibernate.DAO.TrailDAO;

public class ShowTrailAction extends ActionSupport {
	private static final long serialVersionUID = -4452435335242618856L;
	
	private String buttonName = null;
	private String billSerial;
	private String trailJson = null;
	
	/**
	 * Produces a JSON array of trackings that belong to the trail that was requested.
	 * (This JSON array can then be accessed by javascript for Google Map rendering)
	 * (The JSON object is invisible on the webpage)
	 * 
	 * This method is also used to pass the bill serial from one page to another.
	 */
	public String execute() {
		// Pass the bill serial from one page to another.
		if (buttonName != null) {
			if (buttonName.equals("Add Bill"))
				return "addBill";
			else if (buttonName.equals("Add Location"))
				return "addTracking";
		}
		
		Trail trail = TrailDAO.get(billSerial);
		List<Tracking> trackings = trail.getTrackings();
		// Gson cannot handle circular references (this way it's not compatible with hibernate's db functionality) so remove circular refs:
		for (Tracking tr : trackings) {
			tr.setTrail(null);
			tr.setTrackedby(null);
		}
		Gson g = new Gson();
		
		setTrailJson(g.toJson(trackings));
		return SUCCESS;
	}
	
	public String executeAll() {
		List<Tracking> trackings = TrackingDAO.getAll();
		// Gson cannot handle circular references (this way it's not compatible with hibernate's db functionality) so remove circular refs:
		for (Tracking tr : trackings) {
			tr.setTrail(null);
			tr.setTrackedby(null);
		}
		Gson g = new Gson();
		
		setTrailJson(g.toJson(trackings));
		return SUCCESS;
	}
	
	public String getBillSerial() {
		return billSerial;
	}

	public void setBillSerial(String billSerial) {
		this.billSerial = billSerial;
	}

	public String getTrailJson() {
		return trailJson;
	}

	public void setTrailJson(String trailJson) {
		this.trailJson = trailJson;
	}

	public String getButtonName() {
		return buttonName;
	}

	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}	

}
