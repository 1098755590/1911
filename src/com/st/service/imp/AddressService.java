package com.st.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.IAddressDao;
import com.st.service.IAddressService;
@Service("addressService")
public class AddressService  implements IAddressService{
     
	@Autowired
	IAddressDao iaddressDao;
	
	@Override
	public List getuserAddress(Map map) {
		
		return iaddressDao.getuserAddress(map);
	}

	@Override
	public void add_user_address(Map params) {
		
		iaddressDao.add_user_address(params);
	}

	@Override
	public void del_user_address(Map params) {
		iaddressDao.del_user_address(params);
		
	}

	@Override
	public void update_user_address(Map params) {
		// TODO Auto-generated method stub
		iaddressDao.update_user_address(params);
	}

	
 
}
