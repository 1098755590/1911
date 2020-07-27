package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.Util.LayJson;
import com.st.service.IGoodsService;

@Controller
public class GoodsimgAction {
    
	@Autowired
	IGoodsService goodsService;
	
	@RequestMapping("/goodsimglist")
	public String goodsimglist() {
		return "sys/goodsimglist";
	}
	
	@RequestMapping("/getimg")
	@ResponseBody
	public LayJson getimg(@RequestParam Map params) {
		List list=goodsService.getimg(params);	
		LayJson json=new LayJson(list);
		int n=goodsService.getimgCount(params);
		json.setCount(n);
		return json;
	}
	
	@RequestMapping("/goodsimg_del")
	@ResponseBody
	public void goodsimg_del(@RequestParam Map params,HttpSession session) {
	      goodsService.goodsimg_del(params,session);
		
	}
}
