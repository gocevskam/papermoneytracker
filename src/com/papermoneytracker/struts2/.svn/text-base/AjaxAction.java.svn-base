package com.papermoneytracker.struts2;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.struts2.interceptor.SessionAware;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.Trail;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;
import com.papermoneytracker.hibernate.DAO.TrailDAO;

/**
 * Contains all internal AJAX actions
 * (External web service calls are not in this class.)
 * 
 * @author Jonas
 *
 */
public class AjaxAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 178645452L;
	
	private String input;
	private String output;
	private String value;
	private String randomJson = null;
	private String votedCheck = "";
	
	private Map<String, Object> session;
	
	/**
	 * Checks if a bill is tracked in the database already.
	 * Returns yes or no accordingly. (via jsp pages)
	 */
	public String execute() {
		Trail billFromDB = TrailDAO.get(input);
		
		if (billFromDB == null)
			return INPUT;	
		else {
			value = Integer.toString(billFromDB.getValue());
			return SUCCESS;
		}
	}
	
	/**
	 * Gets the top 3 (most voted) stories and 6 random stories out of the database.
	 * Then produces JSON for them and returns them as msg to the AJAX call.
	 * (Used in the Stories page.)
	 */
	public String top3() {
		// Create the JSON array we need to display the comments.		
		List<Tracking> t = TrackingDAO.getTop3();
		
		// Get the three best.
		List<Tracking> tsub = new ArrayList<Tracking>();
		for (int i = 0; i < 3; i++) {
			tsub.add(t.get(t.size()-3 + i));
		}
		
		// Get 6 random.
		List<Tracking> tran = new ArrayList<Tracking>();
		
		for (int i = 0; i < 6; i++) {
			Random ran = new Random();
			int r = ran.nextInt(t.size());
			tran.add(t.get(r));
		}
		
		// Gson cannot handle circular references (this way it's not compatible with hibernate's db functionality) so remove circular refs:
		for (Tracking tr : tsub) {
			tr.setTrail(null);
			String u = tr.getTrackedby().getUsername();
			MoneyUser newU = new MoneyUser();
			newU.setUsername(u);
			tr.setTrackedby(newU);
		}
		Gson g = new Gson();

		// Gson cannot handle circular references (this way it's not compatible with hibernate's db functionality) so remove circular refs:
		for (Tracking tr : tran) {
			tr.setTrail(null);
			String u = tr.getTrackedby().getUsername();
			MoneyUser newU = new MoneyUser();
			newU.setUsername(u);
			tr.setTrackedby(newU);
		}
		Gson gg = new Gson();
		
		randomJson = gg.toJson(tran);
		value = g.toJson(tsub);
		return SUCCESS;
	}
	
	/**
	 * Increment the vote count for a tracking.
	 * With session.
	 * (Used for the Stories page.)
	 */
	@SuppressWarnings("unchecked")
	public String vote() {
		Tracking t = TrackingDAO.get(Integer.parseInt(input));
		boolean voted = false;
		
		System.out.println(votedCheck);
		
		if (session.get("votedFor") != null) {
			for (Tracking tr : (List<Tracking>) session.get("votedFor")) {
				System.out.println(tr.getTrackingId());
				if (tr.getTrackingId() == t.getTrackingId()) {
					voted = true;
					break;
				}
			}
			if (!voted && votedCheck.equals("")) {
				List<Tracking> ts = new ArrayList<Tracking>();
				t.setVotes(t.getVotes() + 1);
				TrackingDAO.update(t);
				ts.add(TrackingDAO.get(t.getTrackingId()));
				session.put("votedFor", ts);
			}
		} else if (votedCheck.equals("")) {
			List<Tracking> ts = new ArrayList<Tracking>();
			t.setVotes(t.getVotes() + 1);
			TrackingDAO.update(t);
			ts.add(TrackingDAO.get(t.getTrackingId()));
			session.put("votedFor", ts);
		}
			
		if (!voted && votedCheck.equals(""))
			value = Integer.toString(TrackingDAO.get(t.getTrackingId()).getVotes());
		else
			value = "no";

		return SUCCESS;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getRandomJson() {
		return randomJson;
	}

	public void setRandomJson(String randomJson) {
		this.randomJson = randomJson;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getVotedCheck() {
		return votedCheck;
	}

	public void setVotedCheck(String votedCheck) {
		this.votedCheck = votedCheck;
	}

}
