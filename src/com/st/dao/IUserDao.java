package com.st.dao;

import java.util.List;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.st.bean.Admin;
import com.st.bean.User;

@Repository("userDao")
public interface IUserDao {
   List getUser(Map params);

void delUser(Map n_map);

void updateUser(Map n_map);

void zengUser(Map n_map);

List cha_User(Map n_map);

List getAdmin(Map params);

void updatepassword(Admin admin);

int getCount(Map params);

void add_admin(Map params);

int get_adminCount();

void change_user_status(Map params);

User cha_someone(Map params);

List getaauser(Map params);

void updateupassword(User user);
}
