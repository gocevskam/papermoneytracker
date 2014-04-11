package com.papermoneytracker.struts2;

import com.opensymphony.xwork2.ActionSupport;

public class PassSerialAction extends ActionSupport {
	private static final long serialVersionUID = -2536023934474395609L;

	private String serial;

	public String execute() {
		return SUCCESS;
	}
	
	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}
	
	
}
