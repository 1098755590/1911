
package com.st.Util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.servlet.http.HttpSession;

public class ImageUtil {
	private ImageUtil() {};
	private static final Random r = new Random();
	private static final int width = 148;
	private static final int height = 26;
	
	
	private static final char[] c= {
			'a','b','c','d','e','f','g','h','i','j',
			'k','l','m','n','o','p','q','r','s','t',
			'u','v','w','x','y','z',
			'0','1','2','3','4','5','6','7','8','9'
	};
	
	public static final BufferedImage create(HttpSession session, int length) {
		//���ݿ�ߴ���һ�Ż�����ͼ��, ͼ��ʹ�õ�����������RGB��ʽ
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//��ͼ���л�ȡ����
		Graphics g = bi.getGraphics();
		//���û�����ɫ
		g.setColor(new Color(175,215,151));
		//ʹ�û���������,����ɫ
		setBackGround(g);
		//���ø�����
		drowRandomLine((Graphics2D)g);
		StringBuilder strb = new StringBuilder();
		
		for(int i=0; i < length; i++) {			
			int index = r.nextInt(c.length);		
			strb.append(c[index]);
			//��������
			g.setFont(new Font("΢���ź�",Font.PLAIN,r.nextInt(5)+15));
			g.setColor(new Color(r.nextInt(200),r.nextInt(200),r.nextInt(200)));
			g.drawString(Character.toString(c[index]), (i+1)*20, 18);
		}
		//����֤����뵽session��
		session.setAttribute("strb", strb.toString());
		g.dispose();
		return bi;
	}
	
	
	/** ���ñ�����ɫ */
	private static void setBackGround(Graphics g) {
		//���û�����ɫ
		g.setColor(Color.white);
		//�������
		g.fillRect(0, 0, width, height);
	}
	
	/** ������ */
	private static void drowRandomLine(Graphics2D g) {
		g.setStroke(new BasicStroke(0.3f));
		//����������Ŀ, ������ɫ
			for(int i=0; i<3;i++) {
				//ÿ����ɫ���
				g.setColor(new Color(r.nextInt(10),r.nextInt(10),r.nextInt(10)));
				int x1 = r.nextInt(width);
				int y1 = r.nextInt(height);
				int x2 = r.nextInt(width);
				int y2 = r.nextInt(height);
				g.drawLine(x1, y1, x2, y2);
			}
	}	
	
}
