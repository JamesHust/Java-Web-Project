package com.hungjame.website.model;

public class Cart {
	private int cart_id;
	private int user_id;
	private String prod_id;
	private int prod_size;
	private int prod_amount;

	public Cart() {
		super();
	}

	public Cart(int user_id, String prod_id, int prod_size, int prod_amount) {
		super();
		this.user_id = user_id;
		this.prod_id = prod_id;
		this.prod_size = prod_size;
		this.prod_amount = prod_amount;
	}

	public Cart(int cart_id, int user_id, String prod_id, int prod_size, int prod_amount) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.prod_id = prod_id;
		this.prod_size = prod_size;
		this.prod_amount = prod_amount;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public int getProd_size() {
		return prod_size;
	}

	public void setProd_size(int prod_size) {
		this.prod_size = prod_size;
	}

	public int getProd_amount() {
		return prod_amount;
	}

	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
	}

}
