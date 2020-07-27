package com.st.Util;

import java.util.List;

import com.st.bean.GoodsClassify;

public class GoodsStatus {
    public static void handlestatus(List<GoodsClassify> list) {
      
    	for(int i=0;i<list.size();i++) {
    		if("1".equals(list.get(i).getStatus())) {
    			list.get(i).setStatus("ио╪э");
    		}else {
    			list.get(i).setStatus("об╪э");
    		}
    	}
    }
}
