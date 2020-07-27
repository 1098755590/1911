package com.st.bean;

public class Goods {
    private String goods_id;
    private String goodsname;
    private String goods_classifyid;
    private String goods_price;
    private String goods_stocks;
    private String goods_detail;
    private String goods_status;
    private String goods_picture;
    private String goods_introduction1;
    private String goods_introduction2;
   
	public String getGoods_introduction1() {
		return goods_introduction1;
	}
	public void setGoods_introduction1(String goods_introduction1) {
		this.goods_introduction1 = goods_introduction1;
	}
	public String getGoods_introduction2() {
		return goods_introduction2;
	}
	public void setGoods_introduction2(String goods_introduction2) {
		this.goods_introduction2 = goods_introduction2;
	}
	//商品所属分类
    private String class_name;
    private String class_id;
    private String status;
    private String puton_time;
    
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPuton_time() {
		return puton_time;
	}
	public void setPuton_time(String puton_time) {
		this.puton_time = puton_time;
	}
	public String getGoods_status() {
		return goods_status;
	}
	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getGoods_classifyid() {
		return goods_classifyid;
	}
	public void setGoods_classifyid(String goods_classifyid) {
		this.goods_classifyid = goods_classifyid;
	}
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_stocks() {
		return goods_stocks;
	}
	public void setGoods_stocks(String goods_stocks) {
		this.goods_stocks = goods_stocks;
	}
	public String getGoods_detail() {
		return goods_detail;
	}
	public void setGoods_detail(String goods_detail) {
		this.goods_detail = goods_detail;
	}

	public String getGoods_picture() {
		return goods_picture;
	}
	public void setGoods_picture(String goods_picture) {
		this.goods_picture = goods_picture;
	}
	@Override
	public String toString() {
		return "Goods [goods_id=" + goods_id + ", goodsname=" + goodsname + ", goods_classifyid=" + goods_classifyid
				+ ", goods_price=" + goods_price + ", goods_stocks=" + goods_stocks + ", goods_detail=" + goods_detail
				+ ", goods_picture=" +   "]";
	}
   
  
}
