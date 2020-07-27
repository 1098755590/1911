package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("iorderDao")
public interface IOrderDao {

	void addaorder(Map params);

	void addtocart(Map params);

	void buyallgoods(Map map);

	List getOrderlist(Map params);

	void order_del(Map params);

}
