package com.st.action;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.Util.LayJson;
import com.st.bean.User;
import com.st.service.IAddressService;
import com.st.service.IOrderService;

@Controller
public class AddressAction {
   /**
    * ÒµÎñ²ã
    */
	@Autowired
	IAddressService addressService;
	
	@Autowired
	IOrderService orderService;
	
	@RequestMapping("/getuseraddress")
	@ResponseBody
	public LayJson getuseraddress(HttpSession session) {
		User user=(User) session.getAttribute("user");
		String username=user.getUsername();
		Map map=new HashMap();
		map.put("username", username);
		List list=addressService.getuserAddress(map);
		LayJson json=new LayJson(list);
		return json;
	}
	@RequestMapping("/buyallgoods")
	public  String buyallgoods(HttpSession session) {
		User user=(User) session.getAttribute("user");
		String username=user.getUsername();
		Map map=new HashMap();
		map.put("username", username);
		orderService.buyallgoods(map);
		return "front/balance_success";
	}
	
	@RequestMapping("/user_addresslist")
	public String user_addresslist() {
		return "front/user_addresslist";
	}
	
	@RequestMapping("/getAddress")
	@ResponseBody
	public LayJson getAddress(HttpSession session) {
		User user=(User) session.getAttribute("user");
		if(user!=null) {
			String username=user.getUsername();
			Map map=new HashMap();
			map.put("username", username);
			List list=addressService.getuserAddress(map);
			LayJson json=new LayJson(list);
			return json;
		}else
		return null;
	}
	
	@RequestMapping("/add_user_address")
	@ResponseBody
	public void add_user_address(HttpSession session,@RequestParam Map params) {
		String a1=(String) params.get("a1");	
		String a2=(String) params.get("a2");
		String addressname=(String) params.get("addressname");
	
		String a3=a1+a2+addressname;
		//System.out.println(a3);
		params.put("addressname", a3);
		User user=(User) session.getAttribute("user");
		String username=user.getUsername();
		params.put("username", username);
	    addressService.add_user_address(params);
		
	}
	
	@RequestMapping("/del_user_address")
	@ResponseBody
	public void del_user_address(HttpSession session,@RequestParam Map params) {
	    addressService.del_user_address(params);
		
	}
	
	@RequestMapping("/update_user_address")
	@ResponseBody
	public void update_user_address(HttpSession session,@RequestParam Map params) {
		String a1=(String) params.get("a1");	
		String a2=(String) params.get("a2");
		String addressname=(String) params.get("addressname");
		String a3=a1+a2+addressname;
		//System.out.println(a3);
		params.put("addressname", a3);
	    addressService.update_user_address(params);
		
	}
	
	@RequestMapping("/getOrderlist")
	@ResponseBody
	public LayJson getOrderlist(HttpSession session,@RequestParam Map params) {
		User user=(User) session.getAttribute("user");
		String username=user.getUsername();
		params.put("username", username);
		List list=orderService.getOrderlist(params);
		LayJson json=new LayJson(list);
		return json;
	}
	@RequestMapping("/orderlist")
	public String orderlist(HttpSession session,@RequestParam Map params) {
		
		
		return "front/orderlist";
	}
	
	@RequestMapping("/order_del")
	@ResponseBody
	public void order_del(HttpSession session,@RequestParam Map params) {
		
		
		orderService.order_del(params);
	}
}
