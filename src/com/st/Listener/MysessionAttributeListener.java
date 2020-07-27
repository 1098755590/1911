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
		//����ļ�ֵΪlogin,��������+1
		String key=se.getName();
		if("login".equals(key)) {
			//��������+1
			int onlineCount=Integer.parseInt(sc.getAttribute("onlineCount").toString());
			onlineCount++;
		    System.out.println("��������+1");
			sc.setAttribute("onlineCount", onlineCount);
		}
		
		
	}
	/**
	 * ɾ��
	 */
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
        if("login".equals(se.getName()	)) {	
		System.out.println("attributeRemoved��,����-1");
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
