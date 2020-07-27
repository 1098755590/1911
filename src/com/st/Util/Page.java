package com.st.Util;

import java.util.Map;

public class Page {
    
	//给Map添加开始位置
	public static void pageParams(Map params) {
		String page=(String) params.get("page");
		String limit=(String) params.get("limit");
		int i_page=Integer.parseInt(page);
		int i_limit=Integer.parseInt(limit);
		int start=(i_page-1)*i_limit;
		params.put("start", start);
	}
}
