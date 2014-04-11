package com.papermoneytracker.hibernate.util;

import java.util.Date;

import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.Trail;
import com.papermoneytracker.hibernate.DAO.MoneyUserDAO;
import com.papermoneytracker.hibernate.DAO.TrackingDAO;
import com.papermoneytracker.hibernate.DAO.TrailDAO;

public class DBQueryTesting {
	public static void main(String[] args) {
		try {
			
		//	MoneyUser u = MoneyUserDAO.get("jonas");
		//	Trail tr = TrailDAO.get("Z11111111118");
			/*
			 * j.setEmail("j@bla.com");
			j.setPassword("mlkjmlkj");
			MoneyUserDAO.update(j);
			
			
			MoneyUser j0 = MoneyUserDAO.get("jonas");
			System.out.println(j0.getEmail());
			*/
			//List<Tracking> t = TrackingDAO.getAllFrom("jonas");
			//TrackingDAO.delete(t);
			//System.out.println(t.toString());
			//System.out.println(TrackingDAO.getAll());
			
		/*	Tracking t = new Tracking();
			t.setDate(new Date());
			t.setTrackedby(u);;
			t.setComment("New Comment");
			t.setLocation("Hasselt");
			t.setVotes(1);
			t.setTrail(tr);
			TrackingDAO.add(t);	*/
			
			System.out.println(TrackingDAO.getTop3());
			
			
			/*
			MoneyUser user = new MoneyUser();
			user.setEmail("b@wis.be");
			user.setUsername("b");
			user.setPassword("pass");
			MoneyUserDAO.add(user);
			*/
			/*
			Trail trail = new Trail();
			trail.setBillSerial("Z11111111118");
			trail.setTrackings(new ArrayList<Tracking>());
			trail.setVotes(5);
			TrailDAO.add(trail);
			
		
			
			MoneyUser retrievedUser = MoneyUserDAO.get("jonas");
			Trail retrievedTrail = TrailDAO.get("Z11111111118");
			 
			
			Tracking t = new Tracking();
			t.setTrackedby(retrievedUser);
			t.setDate(new SimpleDateFormat("dd/MM/yyyy").parse("26/11/2013"));
			t.setLocation("Brussels");
			t.setTrail(retrievedTrail);
			t.setComment("foocomment");
			t.setVotes(2);
			if(!TrackingDAO.add(t))
				System.out.println("niet gelukt");
				
			
			
			Tracking t2 = new Tracking();
			t2.setTrackedby(retrievedUser);
			t2.setDate(new SimpleDateFormat("dd/MM/yyyy").parse("27/11/2013"));
			t2.setLocation("Antwerp");
			t2.setTrail(retrievedTrail);
			t2.setComment("foocqsdfqsfomment");
			t2.setVotes(8);
			TrackingDAO.add(t2);
			*/
			 /*
			MoneyUser retrievedUserAgain = MoneyUserDAO.get("b");
			Trail retrievedTrailAgain = TrailDAO.get("Z11111111118");
			
			System.out.println(retrievedTrailAgain.getTrackings().get(2).getTrackingId());
			*/
			
			/*
			Tracking tracking = TrackingDAO.get(1);
			TrackingDAO.delete(tracking);
			*/
			
			/*
			Trail retrievedTrailAgain = TrailDAO.get("Z11111111118");
			System.out.println(retrievedTrailAgain.getTrackings().get(2).getTrackingId());
			*/
			//System.out.println(MoneyUserDAO.get("c"));
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
