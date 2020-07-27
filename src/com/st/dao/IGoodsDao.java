package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("goodsDao")
public interface IGoodsDao {

	List GetGoods(Map params);

	void change_goods_status(Map params);

	void goods_zeng(Map params);

	int getCount(Map params);

	void update_goods(Map params);

	void goods_imgadd(Map params);

	List getimg(Map params);

	int getimgCount(Map params);

	void goodsimg_del(Map params);

	String getgoods_classifyid(Map params);

	List getsomeGoods(Map params);

	List getagood(Map map);

	List get_eighth_img();

	List gettheimg(Map params);

	List getcartgoods(Map map);

	List getoneclassgoods(Map map);

	List getsixteengoods(Map params);

}
