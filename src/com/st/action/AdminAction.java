package com.st.action;

import java.awt.image.BufferedImage;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.Util.ImageUtil;
import com.st.bean.Admin;
import com.st.service.IUserService;



@Controller
public class AdminAction {

	@Autowired
	IUserService userService;

	@RequestMapping("/admin")
	public String admin(HttpSession session) {	    
		return "sys/admin";
	}
	
	@RequestMapping("/admin_logout")
	public String admin_logout(HttpSession session) {
		session.removeAttribute("admin");
//		session.invalidate();
		return "sys/admin_login";
	}
	@RequestMapping("/admin_login")
	public String adminlogin(HttpSession session) {
		return "sys/admin_login";
	}

	@RequestMapping("/adminlogin")
	public String adminlogin(@RequestParam Map params, HttpSession session) {
		List list = userService.getAdmin(params);
		String captcha = (String) session.getAttribute("strb");
		if (captcha.equals(params.get("captcha"))) {
			if (list.size() != 0) {
				Admin admin = (Admin) list.get(0);
				if (admin.getPassword().equals(params.get("mima"))) {
					session.setAttribute("admin", admin);
//					System.out.println(admin);
					return "sys/admin";
				}
			}

		}
		return "sys/login_fail";
	}

	@RequestMapping("/image")
	public void image(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 创建图像
		BufferedImage bi = ImageUtil.create(req.getSession(), 5);
		// 以png格式 输出响应流到界面
		ImageIO.write(bi, "png", resp.getOutputStream());

		/** 设置浏览器不缓存图片 */
		resp.setHeader("Cache-Control", "no-cache");
		resp.setHeader("Pragma", "no-cache");
		resp.setDateHeader("expires", -1);
	}
	@RequestMapping("/checkCode")
	@ResponseBody
	public String checkCode(HttpSession session) {
		String code=(String) session.getAttribute("strb");
		System.out.println(code);
		return code;
	}
	
	
	@RequestMapping("/adminupdate_password")
	@ResponseBody
	public String adminupdate_password(@RequestParam Map params,HttpSession session) {
		String password_new=(String) params.get("update_new");
		String password_confirm=(String) params.get("update_confirm");
		System.out.println(password_new);
		System.out.println(password_confirm);
		Admin admin=new Admin();
		admin=(Admin) session.getAttribute("admin");
		//验证原密码
		String update_before=(String) params.get("update_before");
		String passwordold=admin.getPassword();
		if(!(update_before.equals(passwordold))) {
			return "2";
		}
		if(password_new.equals(password_confirm)) {						
			System.out.println(admin);
			admin.setPassword(password_new);
			userService.updatepassword(admin);
			return "1";
		}else
			return "0";
	}
	
    @RequestMapping("/add_admin")
    @ResponseBody
    public void add_admin(@RequestParam Map params) {
    	userService.add_admin(params);
    }
    
    
    @RequestMapping("/changestatus")
    @ResponseBody
    public void changestatus(@RequestParam Map params) {
    	
       userService.change_user_status(params);
       
    }
    
    @RequestMapping("admin_quit")
    public String admin_quit(HttpSession session) {
    	session.removeAttribute("admin");
    	return "sys/admin_login";
    }
}
