package com.st.Listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.st.Util.FileUtil;

public class MysessionListener implements HttpSessionListener{

	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("---一个session被创建!!");
		HttpSession session=se.getSession();
		ServletContext sc =session.getServletContext();
		int onlineCount=(int)sc.getAttribute("onlineCount");
		onlineCount++;
		sc.setAttribute("onlineCount", onlineCount);
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session=se.getSession();
		session.getAttribute("list");
		FileUtil.DellajiFile(session);
		System.out.println("一个session被销毁啦");
		ServletContext sc =session.getServletContext();
		int onlineCount=(int)sc.getAttribute("onlineCount");
		onlineCount--;
		if(onlineCount<0) {
			sc.setAttribute("onlineCount", 0);
		}else
		sc.setAttribute("onlineCount", onlineCount);
	}
}
