package com.papermoneytracker.hibernate.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.util.HibernateUtil;

public class TrackingDAO {
	
	/**
	 * Adds a tracking to the database.
	 * @param tracking
	 * @return
	 */
	public static boolean add(Tracking tracking) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.persist(tracking);
			t.commit();
			return true;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return false;
		} finally {
			s.close();
		}
	}
	
	/**
	 * Gets a tracking from the database.
	 * @param id
	 * @return
	 */
	public static Tracking get(int id) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			Tracking tracking = (Tracking) s.get(Tracking.class, id);
			t.commit();
			return tracking;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return null;
		} finally {
			s.close();
		}
	}
	
	/**
	 * Deletes a tracking from the database. Check if it is the only tracking from a trail first!
	 * @param user
	 * @return
	 */
	public static boolean delete(Tracking tracking) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			List<Tracking> list = tracking.getTrail().getTrackings();
			if (list.size() > 1)
				s.delete(tracking);
			else {
				TrailDAO.delete(tracking.getTrail());
				s.delete(tracking);
			}
			t.commit();
			return true;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return false;
		} finally {
			s.close();
		}
	}
	
	/**
	 * Gets all trackings from the database.
	 */
	@SuppressWarnings("unchecked")
	public static List<Tracking> getAll() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			List<Tracking> trackings = s.createQuery("FROM Tracking").list();
			t.commit();
			return trackings;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return null;
		} finally {
			s.close();
		}
	}

	/**
	 * Gets all trackings from a user.
	 */
	@SuppressWarnings("unchecked")
	public static List<Tracking> getAllFrom(String username) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			List<Tracking> trackings = s.createQuery("FROM Tracking WHERE trackedby_username='" + username +"'").list();
			t.commit();
			return trackings;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return null;
		} finally {
			s.close();
		}
	}
	
	/**
	 * Gets top 3 votes.
	 */
	@SuppressWarnings("unchecked")
	public static List<Tracking> getTop3() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			List<Tracking> trackings = s.createQuery("FROM Tracking ORDER BY Votes").list();
			t.commit();
			return trackings;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			System.err.println(ex.getMessage());
			return null;
		} finally {
			s.close();
		}
	}
		
	/**
	 * Updates a tracking in the database.
	 * @return true on success, false on failure
	 */
	public static boolean update(Tracking tracking) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.update(tracking);
			t.commit();
			return true;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return false;
		} finally {
			s.close();
		}
	}
}
