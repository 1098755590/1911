package com.st.action;

import java.io.UnsupportedEncodingException;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.st.Util.LayJson;
import com.st.bean.Admin;
import com.st.bean.User;
import com.st.service.IUserService;

@Controller
public class UserAction {
    @Autowired
    IUserService userService;
    
    @RequestMapping("/userlogin")
    public String userlogin() {
    	return "front/login";
    }
    
    @RequestMapping("/userlist")
    public String userlist() {
    	return "sys/userlist";
    }
    
	@RequestMapping("/getUser")
	@ResponseBody
	public LayJson getUser(@RequestParam Map params)   {
		List list=userService.getUser(params);
		LayJson json=new LayJson(list);
		int count=userService.getCount(params);
		json.setCount(count);
		//String jsonstr=JSONObject.toJSONString(json);
		return json;
	}
	
	@RequestMapping("/getUser2")
	@ResponseBody
	public String getUser2(@RequestParam Map params) {
		//System.out.println("hha");
		System.out.println(params);
		List list=userService.getUser2();
		List list1=new ArrayList();
		String page=(String) params.get("page");
		String limit=(String) params.get("limit");
		int i_page=Integer.parseInt(page);
		int i_limit=Integer.parseInt(limit);
		int k=(i_page-1)*10;
		for(int i=0;i<10;i++) {
			list1.add(list.get(k));
			k++;
		}
		LayJson json=new LayJson(list1);
		String jsonstr=JSONObject.toJSONString(json);
		return jsonstr;
	}
	
	@RequestMapping("/cha_user")
	@ResponseBody
	public String cha_user(ServletRequest request) {
		//System.out.println("hha");
		Map map=request.getParameterMap();
		List list=userService.cha_User(map);
		LayJson json=new LayJson(list);
		String jsonstr=JSONObject.toJSONString(json);
		return jsonstr;
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public void delUser(ServletRequest request) {

		Map map=request.getParameterMap();
		userService.delUser(map);
		
	}
	@RequestMapping("/update")
	@ResponseBody
	public void update(ServletRequest request) {
		Map map=request.getParameterMap();
		userService.updateUser(map);
	}
	
	
	@RequestMapping("/user_zeng")
	public String zeng(ServletRequest request,HttpSession session) {
		String code=request.getParameter("captcha");
		String code2=(String) session.getAttribute("strb");
		if(code.equals(code2)) {
			Map map=request.getParameterMap();
			userService.zengUser(map);
			return "front/success";
		}
		return "front/captcha_error";
	}
	
	@RequestMapping("/user_login")
	public String user_login(@RequestParam Map params,HttpSession session) {
		User user=new User();
		user=userService.cha_someone(params);
		String password=(String) params.get("password");
		String captcha=(String) params.get("captcha");
		String code=(String) session.getAttribute("strb");
		if(!(code.equals(captcha))) {
			return "front/captcha_error";
		}
		if(user!=null) {
			if(password.equals(user.getPassword())&&("正常".equals(user.getStatus()))) {
				session.setAttribute("login", Math.random());
				session.setAttribute("name", user.getUsername());
				session.setAttribute("user", user);  
				return "front/index";
			}
		}
		return "front/login_fail";
	}
	
	//前台
	@RequestMapping("/user_logout")
	public String user_logout(@RequestParam Map params,HttpSession session) {
		session.removeAttribute("name");
		session.removeAttribute("login");
		session.removeAttribute("user");
		return "front/index";
	}
	
	@RequestMapping("/getaauser")
	@ResponseBody
	public LayJson getaauser(@RequestParam Map params) {
		List list=userService.getaauser(params);
		LayJson json=new LayJson(list);
		return json;
	}
	
	@RequestMapping("/userupdate_password")
	@ResponseBody
	public String userupdate_password(@RequestParam Map params,HttpSession session) {
		String password_new=(String) params.get("update_new");
		String password_confirm=(String) params.get("update_confirm");
		System.out.println(password_new);
		System.out.println(password_confirm);
		User user=new User();
		user=(User) session.getAttribute("user");
		//验证原密码
		String update_before=(String) params.get("update_before");
		String passwordold=user.getPassword();
		if(!(update_before.equals(passwordold))) {
			return "2";
		}
		if(password_new.equals(password_confirm)) {						
			System.out.println(user);
			user.setPassword(password_new);
			userService.updateupassword(user);
			return "1";
		}else
			return "0";
	}
}
