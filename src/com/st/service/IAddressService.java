package com.st.service;

import java.util.List;
import java.util.Map;

public interface IAddressService {

	List getuserAddress(Map map);

	void add_user_address(Map params);

	void del_user_address(Map params);

	void update_user_address(Map params);

	

}
