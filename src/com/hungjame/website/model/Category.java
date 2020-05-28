package com.hungjame.website.model;


public class Category {
	private int cate_id;
	private String item_id;
	private String cate_name;
	private String cate_img;

	public Category() {
		super();
	}

	public Category(int cate_id, String item_id, String cate_name, String cate_img) {
		super();
		this.cate_id = cate_id;
		this.item_id = item_id;
		this.cate_name = cate_name;
		this.cate_img = cate_img;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public String getCate_img() {
		return cate_img;
	}

	public void setCate_img(String cate_img) {
		this.cate_img = cate_img;
	}

	@Override
	public String toString() {
		return "Category [cate_id=" + cate_id + ", item_id=" + item_id + ", cate_name=" + cate_name + ", cate_img="
				+ cate_img + "]";
	}

}
