package com.st.Listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class MysessionAttributeListener implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		HttpSession session=se.getSession();
		ServletContext sc=session.getServletContext();
		//存入的键值为login,在线人数+1
		String key=se.getName();
		if("login".equals(key)) {
			//在线人数+1
			int onlineCount=Integer.parseInt(sc.getAttribute("onlineCount").toString());
			onlineCount++;
		    System.out.println("在线人数+1");
			sc.setAttribute("onlineCount", onlineCount);
		}
		
		
	}
	/**
	 * 删除
	 */
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
        if("login".equals(se.getName()	)) {	
		System.out.println("attributeRemoved了,人数-1");
		HttpSession session=se.getSession();
		ServletContext sc =session.getServletContext();
		int onlineCount=(int)sc.getAttribute("onlineCount");
		onlineCount--;
		sc.setAttribute("onlineCount", onlineCount);
        }
	}
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		
	}
}
