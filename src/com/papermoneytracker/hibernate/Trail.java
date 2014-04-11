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
@Table(name = "Trail")
public class Trail {
	//ID (-> each trail belongs to a bill, so bill's serial code is used as ID)
    @Id @Column(name = "bill_serial")
	private String billSerial;                        
	 
	//MANDATORY: all trackings in which the bill was tracked (needs at least one tracking, otherwise trail wouldn't need to exist)
	@OneToMany(mappedBy = "trail", cascade = CascadeType.ALL, fetch = FetchType.EAGER)   
	@Column(name = "trackings")
	private List<Tracking> trackings; 
	
	//amount of votes for a bill's trail
	@Column(name = "votes")
	private int votes;
	
	//MANDATORY: value of a bill
	@Column(name = "bill_value", nullable = false)
	private int billValue;

	public int getValue() {
		return billValue;
	}

	public void setValue(int billValue) {
		this.billValue = billValue;
	}

	public String getBillSerial() {
		return billSerial;
	}

	public void setBillSerial(String billSerial) {
		this.billSerial = billSerial;
	}

	public List<Tracking> getTrackings() {
		return trackings;
	}

	public void setTrackings(List<Tracking> trackings) {
		this.trackings = trackings;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}
}