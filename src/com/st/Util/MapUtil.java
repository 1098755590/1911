package com.st.Util;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MapUtil {
	public static Map trans(Map map) {
		Set<String> set=(Set<String>)map.keySet();
		Map param_map=new HashMap();
		for(String key:set) {
			String[] m_arr=(String[])map.get(key);
			if(m_arr.length==1) {
				param_map.put(key, m_arr[0]);
			}
		}
		return param_map;
}
}