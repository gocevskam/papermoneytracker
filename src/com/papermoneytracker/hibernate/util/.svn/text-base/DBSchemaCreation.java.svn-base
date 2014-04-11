package com.papermoneytracker.hibernate.util;

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.papermoneytracker.hibernate.MoneyUser;
import com.papermoneytracker.hibernate.Tracking;
import com.papermoneytracker.hibernate.Trail;

public class DBSchemaCreation {

	public static void main(String[] args) {
      AnnotationConfiguration config = new AnnotationConfiguration();
      config.addAnnotatedClass(Tracking.class);
      config.addAnnotatedClass(Trail.class);
      config.addAnnotatedClass(MoneyUser.class);
      
      config.configure("hibernate.cfg.xml"); 
      
      new SchemaExport(config).create(true, true);      
	}
}
