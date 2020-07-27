package com.st.service;

import java.util.List;
import java.util.Map;

public interface IClassifyService {

	List getClass(Map params);

	int getCount(Map params);

	void changestatus(Map params);

	void class_zeng(Map params);

	void update_classify(Map params);
    
}
