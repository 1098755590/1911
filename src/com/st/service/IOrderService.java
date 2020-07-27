package com.st.service;

import java.util.List;
import java.util.Map;

public interface IOrderService {

	void addaorder(Map params);

	void addtocart(Map params);

	void buyallgoods(Map map);

	List getOrderlist(Map params);

	void order_del(Map params);

}
