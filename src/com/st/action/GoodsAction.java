package com.st.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.st.Util.FileRJson;
import com.st.Util.FileUtil;
import com.st.Util.LayJson;
import com.st.service.IGoodsService;

@Controller
public class GoodsAction {
     
	@Autowired
	IGoodsService goodsService;
	
	@RequestMapping("/goodslist")
	public String goodslist() {
		return "sys/goodslist";
	}
	
	@RequestMapping("/getGoods")
	@ResponseBody
	public LayJson getGoods(@RequestParam Map params) {
		List list=goodsService.getGoods(params);	
		LayJson json=new LayJson(list);
		int n=goodsService.getCount(params);
		json.setCount(n);
		return json;
	}
	
	@RequestMapping("/getsomeGoods")
	@ResponseBody
	public LayJson getsomeGoods(@RequestParam Map params) {
		List list=goodsService.getsomeGoods(params);	
		LayJson json=new LayJson(list);
		return json;
	}
	
	@RequestMapping("/change_goods_status")
	@ResponseBody
	public void change_goods_status(@RequestParam Map params) {
//		System.out.println(params);
		goodsService.change_goods_status(params);
	}
	
	
	@RequestMapping("/goods_zeng")
	@ResponseBody
	public void goods_zeng(@RequestParam Map params) {
		System.out.println(params);
		goodsService.goods_zeng(params);
	}
	
	@RequestMapping("/update_goods")
	@ResponseBody
	public void update_goods(@RequestParam Map params) {
		System.out.println(params);
		goodsService.update_goods(params);
	}
	
	        //添加图片
			@RequestMapping("/goods_imgadd")
			public String goods_imgadd(@RequestParam Map params,HttpSession session) {
				System.out.println(params);
				goodsService.goods_imgadd(params,session);
				return "sys/goodslist";
			}

			@RequestMapping("/file")
			public String filePage() {
				return "sys/file";
			}
			     //文件上传
				@RequestMapping("/fileUpload")
				@ResponseBody
				public FileRJson fileUpload(MultipartFile file,HttpSession session) throws IOException {

					//String oldName=file.getOriginalFilename();
					String fileType=FileUtil.getFileType(file);
					String uuid=UUID.randomUUID().toString();
					String newName=uuid+fileType;
					addSessionFile(session,newName);
					System.out.println(session.getServletContext().getRealPath("/")+"file\\"+newName);
					File nf= new File(session.getServletContext().getRealPath("/")+"file\\"+newName);
					File nf2=new File("D:\\java工具包\\workspace\\workspace\\webmode2\\WebContent\\file\\"+newName);
					try {
						file.transferTo(nf);
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
					FileUtil.copy(nf,nf2);		
					return new FileRJson("123");
				}
				
				
				
				@RequestMapping("/click_add")
				@ResponseBody
				public void click_add(@RequestParam Map params,HttpSession session) {
					
					FileUtil.DellajiFile(session);
					System.out.println(params);	
					List list=new ArrayList();
					session.setAttribute("list", list);
					String goods_id=(String) params.get("goods_id");
					System.out.println(goods_id);
					session.setAttribute("goods_id", goods_id);
				}
				
				private void addSessionFile(HttpSession session, String newName) {
					List list=(List) session.getAttribute("list");
					list.add(newName);
				}	
}
