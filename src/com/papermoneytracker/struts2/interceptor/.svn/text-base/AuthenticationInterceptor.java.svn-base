package com.papermoneytracker.struts2.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.papermoneytracker.hibernate.MoneyUser;

public class AuthenticationInterceptor extends ActionSupport implements Interceptor {
	private static final long serialVersionUID = -5603368280535618863L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
		MoneyUser user = (MoneyUser) session.get("user");
		if (user == null) {
			addActionError(getText("error.loginRequired"));
			return ActionSupport.LOGIN;
		}
		return actionInvocation.invoke();
	}

}
