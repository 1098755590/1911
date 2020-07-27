package com.st.service.imp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.Util.Page;
import com.st.dao.IClassifyDao;
import com.st.service.IClassifyService;

@Service("classifyService")
public class ClassifyService implements IClassifyService{
    
	@Autowired
	IClassifyDao iclassifyDao;
	
	@Override
	public List getClass(Map params) {
		
		if("ио╪э".equals(params.get("checktext"))) {			
			params.put("checktext","1");
		}
		if("об╪э".equals(params.get("checktext"))) {
			params.put("checktext","0");
		}
		String limit=(String) params.get("limit");
		if(limit!=null&&limit.length()>0) {
		Page.pageParams(params);
		return iclassifyDao.getClass(params);
		}
		params.put("start", 0);
		params.put("limit", 999);
		return iclassifyDao.getClass(params);
	}

	@Override
	public int getCount(Map params) {
		// TODO Auto-generated method stub
		return iclassifyDao.getCount(params);
	}

	@Override
	public void changestatus(Map params) {
		String status=(String) params.get("status");
		params.remove("status");
		if("ио╪э".equals(status)) {
			params.put("status", "0");
		}else {
			params.put("status", "1");
		}
		iclassifyDao.changestatus(params);
		
	}

	@Override
	public void class_zeng(Map params) {
		int n=getCount(params)+1;
		String str_n=n+"";
		params.put("class_id", str_n);
		params.put("status", "1");
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowDate=df.format(new Date());
	    params.put("puton_time",nowDate);
	    iclassifyDao.class_zeng(params);
	}

	@Override
	public void update_classify(Map params) {
		// TODO Auto-generated method stub
		 iclassifyDao.update_Goodsclassify(params);
	}

}
