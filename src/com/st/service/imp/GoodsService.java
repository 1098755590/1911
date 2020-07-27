package com.st.service.imp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.Util.FileUtil;
import com.st.Util.Page;
import com.st.dao.IGoodsDao;
import com.st.service.IGoodsService;

@Service("goodsService")
public class GoodsService implements IGoodsService{
    
	@Autowired
	IGoodsDao goodsDao;

	@Override
	public List getGoods(Map params) {
		String str=(String) params.get("limit");
		if(str!=null&&str.length()>0) {
			Page.pageParams(params);
		}
		if(str==null||str.length()==0) {
			params.put("start", 0);
			params.put("limit", 999);
		}
		return goodsDao.GetGoods(params);
	}
    
	public List getGoods_count(Map params) {
		
		return goodsDao.GetGoods(params);
	}
	
	@Override
	public void change_goods_status(Map params) {
		String status=(String) params.get("goods_status");
		if("已上架".equals(status)) {
			params.put("goods_status", "已下架");
		}else {
			params.put("goods_status", "已上架");
		}
		goodsDao.change_goods_status(params);
		
	}

	@Override
	public void goods_zeng(Map params) {
		int n=getCount(params)+1;
		String goods_id=n+"";
		String goods_classifyid=goodsDao.getgoods_classifyid(params);
		System.out.println(goods_classifyid);	
	     params.put("goods_classifyid", goods_classifyid); 
	     params.put("goods_id",goods_id); 
	     params.put("goods_status", "已上架"); 
	     goodsDao.goods_zeng(params);
     
	}

	@Override
	public int getCount(Map params) {
		
		return goodsDao.getCount(params);
	}

	@Override
	public void update_goods(Map params) {
		
		goodsDao.update_goods(params);
	}

	@Override
	public void goods_imgadd(Map params, HttpSession session) {
		String goods_id= (String) session.getAttribute("goods_id");
		params.put("goods_id", goods_id);
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String img_uptime=df.format(new Date());
		System.out.println(params+"service层");
		List list=(List) session.getAttribute("list");
		if(list!=null&&list.size()>0) {
			for(int i=0;i<list.size();i++) {
			    String id=(getimgCount(params)+1)+"";
				params.put("img_id",id );
				params.put("img_uptime", img_uptime);
				params.put("img_name", list.get(i));
				goodsDao.goods_imgadd(params);
			}
		}
		session.removeAttribute("list");
	}

	@Override
	public List getimg(Map params) {
		Page.pageParams(params);
		return goodsDao.getimg(params);
	}

	@Override
	public int getimgCount(Map params) {
		
		return goodsDao.getimgCount(params);
	}

	@Override
	public void goodsimg_del(Map params,HttpSession session) {
		FileUtil.delfile(params, session);
		goodsDao.goodsimg_del(params);
	}

	@Override
	public List getsomeGoods(Map params) {
		// TODO Auto-generated method stub
		return goodsDao.getsomeGoods(params);
	}

	
  //  前端页面	
	@Override
	public List getagood(Map map) {
		
		return goodsDao.getagood(map);
	}

	@Override
	public List get_eighth_img() {
		
		return goodsDao.get_eighth_img();
	}

	@Override
	public List gettheimg(Map params) {
		
		return goodsDao.gettheimg(params);
	}

	@Override
	public List getcartgoods(Map map) {
		
		return goodsDao.getcartgoods(map);
	}

	@Override
	public List getoneclassgoods(Map map) {
		
		return goodsDao.getoneclassgoods(map);
	}

	@Override
	public List getsixteengoods(Map params) {
		params.put("limit", "16");
		Page.pageParams(params);
		return goodsDao.getsixteengoods(params);
	}
}
