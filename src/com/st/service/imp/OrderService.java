package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.IOrderDao;
import com.st.service.IOrderService;

@Service("orderService")
public class OrderService implements IOrderService {
 
	@Autowired
	IOrderDao iorderDao;

	@Override
	public void addaorder(Map params) {
		
		iorderDao.addaorder(params);
	}

	@Override
	public void addtocart(Map params) {
		
		iorderDao.addtocart(params);
	}

	@Override
	public void buyallgoods(Map map) {
		
		iorderDao.buyallgoods(map);
	}

	@Override
	public List getOrderlist(Map params) {
		
		return iorderDao.getOrderlist(params);
	}

	@Override
	public void order_del(Map params) {
		
		iorderDao.order_del(params);
	}
}
