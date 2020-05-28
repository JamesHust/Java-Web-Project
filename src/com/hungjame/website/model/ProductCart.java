package com.hungjame.website.model;

public class ProductCart {
	private int user_id;
	private int cart_id;
	private int prod_size;
	private String prod_id;
	private String prod_img1;
	private String prod_name;
	private String prod_color;
	private String prod_condition;
	private String prod_price;
	private int prod_total;//số lượng sản phẩm

	public ProductCart() {
		super();
	}

	public ProductCart(int user_id, int cart_id, int prod_size, String prod_id, String prod_img1, String prod_name,
			String prod_color, String prod_condition, String prod_price, int prod_total) {
		super();
		this.user_id = user_id;
		this.cart_id = cart_id;
		this.prod_size = prod_size;
		this.prod_id = prod_id;
		this.prod_img1 = prod_img1;
		this.prod_name = prod_name;
		this.prod_color = prod_color;
		this.prod_condition = prod_condition;
		this.prod_price = prod_price;
		this.prod_total = prod_total;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getProd_size() {
		return prod_size;
	}

	public void setProd_size(int prod_size) {
		this.prod_size = prod_size;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public String getProd_img1() {
		return prod_img1;
	}

	public void setProd_img1(String prod_img1) {
		this.prod_img1 = prod_img1;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_color() {
		return prod_color;
	}

	public void setProd_color(String prod_color) {
		this.prod_color = prod_color;
	}

	public String getProd_condition() {
		return prod_condition;
	}

	public void setProd_condition(String prod_condition) {
		this.prod_condition = prod_condition;
	}

	public String getProd_price() {
		return prod_price;
	}

	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}

	public int getProd_total() {
		return prod_total;
	}

	public void setProd_total(int prod_total) {
		this.prod_total = prod_total;
	}

	@Override
	public String toString() {
		return "ProductCart [user_id=" + user_id + ", cart_id=" + cart_id + ", prod_size=" + prod_size + ", prod_id="
				+ prod_id + ", prod_img1=" + prod_img1 + ", prod_name=" + prod_name + ", prod_color=" + prod_color
				+ ", prod_condition=" + prod_condition + ", prod_price=" + prod_price + ", prod_total=" + prod_total
				+ "]";
	}

}
