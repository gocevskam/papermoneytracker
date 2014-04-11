package com.papermoneytracker.hibernate;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Tracking")
public class Tracking {
	//ID	
    @Id @GeneratedValue
    @Column(name = "tracking_id")
	private int trackingId;
    
    //MANDATORY 
    @ManyToOne @JoinColumn(name = "trackedby_username", nullable = false) 
	private MoneyUser trackedby;    
   
    //MANDATORY: date of tracking
    @Column(name = "date", nullable = false)
	private Date date;  
	
	//MANDATORY: location where the bill was tracked
	@Column(name = "location", nullable = false)
	private String location;   
	
	//trail to which the tracking belongs
	@ManyToOne @JoinColumn(name = "trail_bill_serial", nullable = false) 
	private Trail trail;         

	//comment on the location where the bill was found 
	@Column(name = "comment", nullable = false)
	private String comment;
	
	//amount of votes for a tracking
	@Column(name = "votes")
	private int votes;
	
	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public MoneyUser getTrackedby() {
		return trackedby;
	}

	public void setTrackedby(MoneyUser trackedby) {
		this.trackedby = trackedby;
	}

	public int getTrackingId() {
		return trackingId;
	}

	public void setTrackingId(int trackingId) {
		this.trackingId = trackingId;
	}

	public Trail getTrail() {
		return trail;
	}

	public void setTrail(Trail trail) {
		this.trail = trail;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}	
	
}
