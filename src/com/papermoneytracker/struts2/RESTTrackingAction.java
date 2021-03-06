package com.papermoneytracker.struts2;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;

/**
 * Provides RESTful way of retrieving tracking data.
 * 
 * This class is converted to JSON on querying a URL of the form:
 * http://localhost:8080/papermoneytracker/rest/tracking/<tracking id>
 * (where <tracking id> is a tracking id of a tracking in the web application's database)
 * 
 * For more information, see the report of the project.
 */
public class RESTTrackingAction extends ActionSupport {
	private static final long serialVersionUID = 7056337041068869651L;

	/**
	 * Contains information about the request that was made, if it succeeded or not (+ errors and time).
	 */
	private String[] request = new String[3];
	private String trackingID = null;
	
	/**
	 * Bill the tracking belongs to.
	 */
	private String belongsTo = null;
	private String trackedBy = null;
	private String trackedOn = null;
	private String location = null;
	private int votes = 0;
	private String comment = null;
	
//	/**
//	 * Used for index(). List of all trackings in database
//	 */
//	private String[][] trackings = null;
//	
//	public String index() {
//		List<Tracking> l = TrackingDAO.getAll();
//		System.out.println(l);
//		trackings = new String[l.size()][4];
//		int i = 0;
//		for (Tracking t : l) {
//			trackings[i][0] = Integer.toString(t.getTrackingId());
//			trackings[i][1] = t.getTrail().getBillSerial();
//			trackings[i][2] = t.getLocation();
//			trackings[i][3] = t.getDate().toString();
//			i++;
//		}
//		
//		return SUCCESS;
//	}
//
//	public String[][] getTrackings() {
//		return trackings;
//	}
//
//	public void setTrackings(String[][] trackings) {
//		this.trackings = trackings;
//	}
	
	/**
	 * Produces result of a tracking from the RESTful API call.
	 */
	public String view() {
		String success = "successful";
		String errorMessage = "";
		String date = (new Date()).toString();
				
		Tracking t = TrackingDAO.get(Integer.parseInt(trackingID));
		
		if (t == null) {
			success = "failed";
			errorMessage = "trackingID error : not found in database";
			
			request[0] = success;
			request[1] = errorMessage;
			request[2] = date;
			return SUCCESS;
		}
		
		belongsTo = t.getTrail().getBillSerial();
		trackedBy = t.getTrackedby().getUsername();
		trackedOn = t.getDate().toString();
		location = t.getLocation();
		votes = t.getVotes();
		comment = t.getComment();
		
		request[0] = success;
		request[1] = errorMessage;
		request[2] = date;
		return SUCCESS;
	}

	public String[] getRequest() {
		return request;
	}

	public void setRequest(String[] request) {
		this.request = request;
	}
	
	public String getTrackingID() {
		return trackingID;
	}

	public void setTrackingID(String trackingID) {
		this.trackingID = trackingID;
	}

	public String getTrackedBy() {
		return trackedBy;
	}

	public void setTrackedBy(String trackedBy) {
		this.trackedBy = trackedBy;
	}

	public String getBelongsTo() {
		return belongsTo;
	}

	public void setBelongsTo(String belongsTo) {
		this.belongsTo = belongsTo;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public String getTrackedOn() {
		return trackedOn;
	}

	public void setTrackedOn(String trackedOn) {
		this.trackedOn = trackedOn;
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
}
