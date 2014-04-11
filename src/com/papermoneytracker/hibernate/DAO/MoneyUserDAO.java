package com.papermoneytracker.hibernate.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.util.HibernateUtil;

public class MoneyUserDAO {
	
	/**
	 * Adds a user to the database.
	 * @param user 
	 * @return true on success, false on failure
	 */
	public static boolean add(MoneyUser user) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.persist(user);
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
	 * Gets a user out of the database. (Selects only on ID, which is username!)
	 * @param username ID for the user
	 * @return MoneyUser object if found, if not: null
	 */
	public static MoneyUser get(String username) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			MoneyUser user = (MoneyUser) s.get(MoneyUser.class, username);
			t.commit();
			return user;
		} catch (Exception ex) {
			if (t != null)
				t.rollback();
			return null;
		} finally {
			s.close();
		}
	}
	
	/**
	 * Deletes a user from the database.
	 * @param user to be deleted
	 * @return true on success, false on failure
	 */
	public static boolean delete(MoneyUser user) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.delete(user);
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
	 * Updates a user in the database.
	 * @param user
	 * @return true on success, false on failure
	 */
	public static boolean update(MoneyUser user) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Transaction t = null;
		Session s = sf.openSession();
		try {
			t = s.beginTransaction();
			s.update(user);
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
