package com.st.action;

import java.util.Enumeration;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.Util.LayJson;
import com.st.Util.MapUtil;
import com.st.bean.User;
import com.st.service.IAddressService;
import com.st.service.IGoodsService;
import com.st.service.IOrderService;

@Controller
public class indexAction {

	@Autowired
	IGoodsService goodsService;
	
	@Autowired
	IAddressService addressService;
	
	@Autowired
	IOrderService orderService;
	
	@RequestMapping("/")
	public String index() {
		return "front/index";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "front/register";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "front/login";
	}
	
	@RequestMapping("/list")
	public String list(HttpSession session,@RequestParam Map params) {
		String goods_classifyid=(String) params.get("goods_classifyid");
		session.setAttribute("goods_classifyid", goods_classifyid);
		return "front/list";
	}
	
	@RequestMapping("/shoppingcart")
	public String shoppingcart() {
		return "front/shoppingcart";
	}

	@RequestMapping("/clothesdetails")
	public String clothesdetails() {
		return "front/clothesdetails";
	}
	
	@RequestMapping("/goodslist10")
	public String goodslist() {
		return "front/goodslist";
	}
	
	@RequestMapping("/phonedetails")
	public String phonedetails(@RequestParam Map params,HttpSession session) {
	//	System.out.println(params);
		String goods_id=(String) params.get("goods_id");
		session.setAttribute("goods_id", goods_id);
		List list=goodsService.getagood(params);  //名字,价格
		List list2=goodsService.gettheimg(params);  //图片
		list.addAll(list2);
		String username=(String) session.getAttribute("name");
		if(username!=null) {
			Map map=new HashMap();
			map.put("username", username);
			List list3=addressService.getuserAddress(map);
			list.addAll(list3);
		}
		session.setAttribute("list",list);
		return "front/phonedetails";
	}
	
	
	@RequestMapping("/get_the_good")
	@ResponseBody
	public LayJson get_the_good(HttpSession session) {
		//System.out.println(params);
		List list=(List) session.getAttribute("list");
		LayJson json=new LayJson(list);
		return json;
	}
	
	@RequestMapping("/godetails")
	public String godetails(HttpServletRequest request,HttpSession session) {
//		String good_id=request.getParameter("id");
//		System.out.println(good_id);
//		session.setAttribute("good_id", good_id);
		request.getCookies();

		System.out.println(request.getCookies());
		System.out.println(request.getAttribute("id"));
		return "front/phonedetails";
	}
	
	@RequestMapping("/getagood")
	@ResponseBody
	public LayJson getagood(HttpSession session) {
		String good_id=(String) session.getAttribute("good_id");
		session.removeAttribute("good_id");
		Map map=new HashMap();
		map.put("goods_id", good_id);
		List list=goodsService.getagood(map);
		LayJson json=new LayJson(list);
		return json;
	}
	
	@RequestMapping("/getagood2")
	@ResponseBody
	public LayJson getagood2(HttpSession session,@RequestParam Map params) {
		String goods_id=(String) session.getAttribute("goods_id");
		params.put("goods_id", goods_id);
		List list=goodsService.getagood(params);
		LayJson json=new LayJson(list);
		return json;
	}
	
	@RequestMapping("/gotocart")
	public String gotocart() {
		return "front/shoppingcart";
	}
	
	@RequestMapping("/get_eighth_img")
	@ResponseBody
	public LayJson get_eighth_img(HttpSession session) {
        List  list=goodsService.get_eighth_img();
        System.out.println(list.size());
		LayJson json=new LayJson(list);
		return json;
	}
	
	@RequestMapping("/gotobalance")
	public String gotobalance(@RequestParam Map params,HttpSession session) {
		String wherebtn=(String) params.get("wherebtn");
		if("购物车".equals(wherebtn)) {
			User user=(User) session.getAttribute("user");
			String username=user.getUsername();
			params.put("username", username);
			orderService.addtocart(params);
			System.out.println(params);
			return "front/addtocart";
		}else {
			String goods_id=(String) params.get("goods_id");
			session.setAttribute("goods_id", goods_id);
			return "front/balance";
		}
	
	}
	@RequestMapping("/buyagood")
	public String buyagood(@RequestParam Map params,HttpSession session) {
	    System.out.println(params);
		User user=(User) session.getAttribute("user");
		String count=(String) params.get("count");
		int c=Integer.parseInt(count);
		String username=user.getUsername();
		params.put("username", username);
		params.put("count", c);
		orderService.addaorder(params);
		return "front/balance_success";
	}
	
	@RequestMapping("/addtocart")
	public String joincart(@RequestParam Map params,HttpSession session) {
		String goods_id=(String) session.getAttribute("goods_id");
		User user=(User) session.getAttribute("user");
		String userid=user.getUserid();
		params.put("userid", userid);
		params.put("goods_id", goods_id);
		params.put("count", 1);
		orderService.addtocart(params);
		return "front/addtocart";
	}
	
	@RequestMapping("/getcartgoods")
	@ResponseBody
	public LayJson getcartgoods(HttpSession session) {
		User user=(User) session.getAttribute("user");
		System.out.println(user.toString()+"hh");	
		String username=user.getUsername();
		Map map=new HashMap();
		map.put("username", username);
		List list=goodsService.getcartgoods(map);
		LayJson json=new LayJson(list);
		return json;
	}
	
	@RequestMapping("/userdetail")
	public String userdetail() {
		return "front/userdetail";
	}
	
	
	@RequestMapping("/getoneclassgoods")
	@ResponseBody
	public LayJson getoneclassgoods(HttpSession session,@RequestParam Map params) {
		String goods_classifyid=(String) session.getAttribute("goods_classifyid");	
		params.put("goods_classifyid", goods_classifyid);
		List list=goodsService.getoneclassgoods(params);
		int n=list.size();
		System.out.println(n+"----------");
		List list2=goodsService.getsixteengoods(params);
		LayJson json=new LayJson(list2);
		json.setCount(n);
		System.out.println(json.getCount()+"hh");
		return json;
	}
	
}
