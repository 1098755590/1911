package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.Util.GoodsStatus;
import com.st.Util.LayJson;
import com.st.service.IClassifyService;

@Controller
public class GoodsClassifyAction {
     
	@Autowired
	IClassifyService classifyService;
	
	@RequestMapping("/classlist")
	public String gotoClass() {
		return "sys/classlist";
	}
	@RequestMapping("/getClass")
	@ResponseBody
	public LayJson getClass(@RequestParam Map params) {
		
		List list=classifyService.getClass(params);
		GoodsStatus.handlestatus(list);
		LayJson json=new LayJson(list);
		int count=classifyService.getCount(params);
		json.setCount(count);
		//String jsonstr=JSONObject.toJSONString(json);
		return json;
	}
	
	@RequestMapping("/change_status")
	@ResponseBody
	public void change_status(@RequestParam Map params) {
//		System.out.println(params.get("class_id"));
//		System.out.println(params.get("status"));
	    classifyService.changestatus(params);
	}
	
	@RequestMapping("/class_zeng")
	@ResponseBody
	public void class_zeng(@RequestParam Map params) {
//		System.out.println(params.get("class_id"));
//		System.out.println(params.get("status"));
	    classifyService.class_zeng(params);
	    
	}
	
	
	@RequestMapping("/update_class_name")
	@ResponseBody
	public void update_class_name(@RequestParam Map params) {
//		System.out.println(params.get("class_id"));
//		System.out.println(params.get("status"));
	    classifyService.update_classify(params);
	    
	}
}
