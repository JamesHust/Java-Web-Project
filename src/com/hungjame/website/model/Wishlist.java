package com.hungjame.website.model;

public class Wishlist {
	private int wish_id;
	private int user_id;
	private String prod_id;

	public Wishlist(int wish_id, int user_id, String prod_id) {
		super();
		this.wish_id = wish_id;
		this.user_id = user_id;
		this.prod_id = prod_id;
	}

	public Wishlist() {
		super();
	}

	public int getWish_id() {
		return wish_id;
	}

	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
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

	@Override
	public String toString() {
		return "Wishlist [wish_id=" + wish_id + ", user_id=" + user_id + ", prod_id=" + prod_id + "]";
	}

}
