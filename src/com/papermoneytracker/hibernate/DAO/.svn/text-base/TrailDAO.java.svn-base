package com.papermoneytracker.hibernate.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.papermoneytracker.hibernate.Trail;
import com.papermoneytracker.hibernate.util.HibernateUtil;

public class TrailDAO {
	/**
	 * Adds a trail to the database.
	 * @return true on success, false on failure
	 */
	public static boolean add(Trail trail) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.persist(trail);
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
	 * Gets a trail out of the database. (Selects only on ID, which is serialnumber!)
	 * @return Trail object if found, if not: null
	 */
	public static Trail get(String billSerial) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			Trail trail = (Trail) s.get(Trail.class, billSerial);
			t.commit();
			return trail;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return null;
		} finally {
			s.close();
		}
	}
	
	/**
	 * Deletes a trail from the database.
	 * @param trail to be deleted
	 * @return true on success, false on failure
	 */
	public static boolean delete(Trail trail) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.delete(trail);
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
	 * Updates a trail in the database.
	 * @return true on success, false on failure
	 */
	public static boolean update(Trail trail) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.update(trail);
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
	 * Gets all trails from the database.
	 */
	@SuppressWarnings("unchecked")
	public static List<Trail> getAll() {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			List<Trail> trails = s.createQuery("FROM Trail").list();
			t.commit();
			return trails;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return null;
		} finally {
			s.close();
		}
	}
}
