package com.st.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
     public static String getFileType(MultipartFile file) {
    	 String oldName=file.getOriginalFilename();
//    	 System.out.println(oldName);   	
    	 int lastIndex=oldName.lastIndexOf(".");
    	 String fileType=oldName.substring(lastIndex);
    	 return fileType;
     }

	public static void copy(File nf, File nf2){
		FileInputStream fis=null;
		FileOutputStream fos=null;
	
			try {
				fis=new FileInputStream(nf);
				fos=new FileOutputStream(nf2);
				byte[] b_arr=new byte[1024];
				int c=0;
				while((c=fis.read(b_arr))>0) {
				fos.write(b_arr,0, c);
				}
			} catch (IOException e) {
				
				e.printStackTrace();
			}finally {
				if(fis!=null) {
					try {
						fis.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(fos!=null) {
					try {
						fos.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		
	
	
	public static void DellajiFile(HttpSession session) {
		List list=(List) session.getAttribute("list");
		if(list!=null&&list.size()>0) {
			for(int i=0;i<list.size();i++) {
				String filename=list.get(i)+"";
				boolean b=new File(session.getServletContext().getRealPath("/")+"file\\"+filename).delete();
				boolean c=new File("D:\\java工具包\\workspace\\workspace\\webmode2\\WebContent\\file\\"+filename).delete();
				System.out.println(b);
			}
		}
	}
	
	public static void delfile(Map params,HttpSession session) {
		String img_name=(String) params.get("img_name");
		new File(session.getServletContext().getRealPath("/")+"file\\"+img_name).delete();
		new File("D:\\java工具包\\workspace\\workspace\\webmode2\\WebContent\\file\\"+img_name).delete();
		
	}
}
