package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface IGoodsService {

	List getGoods(Map params);

	void change_goods_status(Map params);

	void goods_zeng(Map params);

	int getCount(Map params);

	void update_goods(Map params);

	void goods_imgadd(Map params, HttpSession session);

	List getimg(Map params);

	int getimgCount(Map params);

	void goodsimg_del(Map params,HttpSession session);

	List getsomeGoods(Map params);

	List getagood(Map map);

	List get_eighth_img();

	List gettheimg(Map params);

	List getcartgoods(Map map);

	List getoneclassgoods(Map map);

	List getsixteengoods(Map params);
  
}
