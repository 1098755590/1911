package com.st.Listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;

public class MyServletContextListener implements ServletContextListener{

	
	 @Override
	public void contextInitialized(ServletContextEvent sce) {
	  //获取context对象
	ServletContext sc=sce.getServletContext();
	sc.removeAttribute("admin");
	sc.setAttribute("onlineCount",0);
		
	}
	 @Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
}
