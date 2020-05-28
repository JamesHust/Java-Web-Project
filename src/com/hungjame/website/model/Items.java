package com.hungjame.website.model;


public class Items {
	private String item_id;
	private String item_name;

	public Items() {
		super();
	}

	public Items(String item_id, String item_name) {
		super();
		this.item_id = item_id;
		this.item_name = item_name;
	}

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	@Override
	public String toString() {
		return "Items [item_id=" + item_id + ", item_name=" + item_name + "]";
	}

}
