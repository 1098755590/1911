package com.st.service;

import java.util.List;
import java.util.Map;

import com.st.bean.Admin;
import com.st.bean.User;

public interface IUserService {
     List getUser(Map params);

	void delUser(Map map);

	void updateUser(Map map);

	void zengUser(Map map);

	List cha_User(Map map);

	List getAdmin(Map params);

	void updatepassword(Admin admin);

	List getUser2();

	int getCount(Map params);

	void add_admin(Map params);

	void change_user_status(Map params);

	User cha_someone(Map params);

	List getaauser(Map params);

	void updateupassword(User user);
}
