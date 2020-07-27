package com.st.service.imp;

import java.io.ObjectOutputStream.PutField;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.Util.MapUtil;
import com.st.Util.Page;
import com.st.bean.Admin;
import com.st.bean.User;
import com.st.dao.IUserDao;
import com.st.service.IUserService;


@Service("userService")
public class Userservice implements IUserService{
    
	@Autowired
	IUserDao userDao;
	@Override
	public  List getUser(Map params) {
		// TODO Auto-generated method stub
		Page.pageParams(params);
		return userDao.getUser(params);
	}
	@Override
	public void delUser(Map map) {
		Map n_map=MapUtil.trans(map);
		userDao.delUser(n_map);
		
	}
	@Override
	public void updateUser(Map map) {
		// TODO Auto-generated method stub
		Map n_map=MapUtil.trans(map);
		userDao.updateUser(n_map);
	}
	@Override
	public void zengUser(Map map) {
		// TODO Auto-generated method stub
		Map n_map=MapUtil.trans(map);
		int length=getCount(null)+1;
		String str=Integer.toString(length);
		n_map.put("userid",str);
		userDao.zengUser(n_map);
	}
	@Override
	public List cha_User(Map map) {
		// TODO Auto-generated method stub
		Map n_map=MapUtil.trans(map);
		return userDao.cha_User(n_map);
	}
	
	@Override
	public List getAdmin(Map params) {
		// TODO Auto-generated method stub
		return userDao.getAdmin(params);
	}
	
    //	管理员管理
	@Override
	public void updatepassword(Admin admin) {
		// TODO Auto-generated method stub
		userDao.updatepassword(admin);
	}
	@Override
	public List getUser2() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int getCount(Map params) {
		int count=userDao.getCount(params);
		return count;
	}
	@Override
	public void add_admin(Map params) {
		// TODO Auto-generated method stub
		int id=userDao.get_adminCount()+1;
		params.put("password","123");
		params.put("admin_id",id);
		userDao.add_admin(params);
	}
	@Override
	public void change_user_status(Map params) {
		String status=(String) params.get("status");
		if("正常".equals(status)) {
			params.put("status", "已封号");
		}else {
			params.put("status", "正常");
		}
		userDao.change_user_status(params);
		
	}
	@Override
	public User cha_someone(Map params) {
		return userDao.cha_someone(params);
	}
	@Override
	public List getaauser(Map params) {
	
		return userDao.getaauser(params);
	}
	@Override
	public void updateupassword(User user) {
		// TODO Auto-generated method stub
		userDao.updateupassword(user);
	}

}
