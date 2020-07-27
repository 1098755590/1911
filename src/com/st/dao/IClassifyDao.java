package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("iclassifyDao")
public interface IClassifyDao {

	List getClass(Map params);

	int getCount(Map params);

	void changestatus(Map params);

	void class_zeng(Map params);

	void update_Goodsclassify(Map params);

}
