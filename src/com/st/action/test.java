package com.st.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.st.Util.FileRJson;
import com.st.Util.FileUtil;
import com.st.bean.User;

@Controller
public class test {
    
	@RequestMapping("/test1")
	public String test(@RequestParam Map map) {
		System.out.println(map.values());
		return "front/test";
	}
	
	@RequestMapping("/test_sessionid")
	public String sessionid(HttpServletRequest request,HttpServletResponse response) {
		double b=Math.random();
		Cookie c=new Cookie("name", b+"");
		System.out.println(b);
		response.addCookie(c);
		Cookie[] c_arr=request.getCookies();
		if(c_arr!=null&&c_arr.length>0) {
			for(Cookie c1:c_arr) {
				System.out.println(c1.getName()+"---"+c1.getValue());
			}
		}
		
		return "goodslist";
	}
	
	
	@RequestMapping("/t")
	public String test(HttpSession session) {
		User user1=new User();
		User user2=new User();
		user1.setUserid("01");
		user1.setPassword("123");
		user2.setUserid("02");
		user2.setPassword("2323");
		List list=new ArrayList();
		list.add(user1);
		list.add(user2);
		session.setAttribute("user1", user1);
		session.setAttribute("user2", user2);
		session.setAttribute("list", list);
		return "test";
	}
}
