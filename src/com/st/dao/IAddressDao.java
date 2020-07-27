package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("iaddressDao")
public interface IAddressDao {

	List getuserAddress(Map map);

	void add_user_address(Map params);

	void del_user_address(Map params);

	void update_user_address(Map params);

}
