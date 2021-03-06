package com.papermoneytracker.struts2;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.Trail;
import com.papermoneytracker.hibernate.DAO.TrailDAO;

/**
 * Provides RESTful way of retrieving trail data.
 * 
 * This class is converted to JSON on querying a URL of the form:
 * http://localhost:8080/papermoneytracker/rest/trail/<bill serial>
 * (where <bill serial> is a (possibly valid) bill serial in the web application's database)
 * 
 * For more information, see the report of the project.
 */
public class RESTTrailAction extends ActionSupport {
	private static final long serialVersionUID = -5960770937867563242L;
	
	/**
	 * Contains information about the request that was made, if it succeeded or not (+ errors and time).
	 */
	private String[] request = new String[3];
	
	/**
	 * Next four fields are information about the 
	 */
	private String serial = null;
	private String[][] trail = null;
	private int votes = 0;
	private int value = 0;
	
	/**
	 * Produces result of a trail from the RESTful API call.
	 * 
	 * For trackings in a trail, only the trackings ID and location are included, those are most important.
	 * The user can then, if he wishes, use the trackings ID to retrieve more information on the tracking,
	 * by making a second restful call to "http://localhost:8080/papermoneytracker/rest/tracking/<tracking ID>"
	 */
	public String view() {
		String success = "successful";
		String errorMessage = "";
		String date = (new Date()).toString();
				
		Trail t = TrailDAO.get(serial);
		
		if (t == null) {
			success = "failed";
			errorMessage = "serial error : not found in database";
			
			request[0] = success;
			request[1] = errorMessage;
			request[2] = date;
			return SUCCESS;
		}
		
		value = t.getValue();
		votes = t.getVotes();
		trail = new String[t.getTrackings().size()][2];
		
		int i = 0;
		for (Tracking tracking : t.getTrackings()) {
			trail[i][0] = Integer.toString(tracking.getTrackingId());
			trail[i][1] = tracking.getLocation();
			i++;
		}
		
		request[0] = success;
		request[1] = errorMessage;
		request[2] = date;
		return SUCCESS;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	public String[][] getTrail() {
		return trail;
	}

	public void setTrail(String[][] trail) {
		this.trail = trail;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String[] getRequest() {
		return request;
	}

	public void setRequest(String[] request) {
		this.request = request;
	}
}
