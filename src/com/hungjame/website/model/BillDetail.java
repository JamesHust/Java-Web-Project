package com.hungjame.website.model;

public class BillDetail {
	private String bill_id;
	private int user_id;
	private String user_name;
	private String user_address;
	private String user_phone;
	private String prod_id;
	private String prod_name;
	private String prod_img1;
	private String prod_color;
	private int prod_amount;
	private int prod_size;
	private String prod_price;
	private String bill_status;
	private String bill_total;

	public BillDetail() {
		super();
	}

	public BillDetail(String bill_id, int user_id, String user_name, String user_address, String user_phone,
			String prod_id, String prod_name, String prod_img1, String prod_color, int prod_amount, int prod_size,
			String prod_price, String bill_status, String bill_total) {
		super();
		this.bill_id = bill_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_address = user_address;
		this.user_phone = user_phone;
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.prod_img1 = prod_img1;
		this.prod_color = prod_color;
		this.prod_amount = prod_amount;
		this.prod_size = prod_size;
		this.prod_price = prod_price;
		this.bill_status = bill_status;
		this.bill_total = bill_total;
	}

	public String getBill_id() {
		return bill_id;
	}

	public void setBill_id(String bill_id) {
		this.bill_id = bill_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_img1() {
		return prod_img1;
	}

	public void setProd_img1(String prod_img1) {
		this.prod_img1 = prod_img1;
	}

	public String getProd_color() {
		return prod_color;
	}

	public void setProd_color(String prod_color) {
		this.prod_color = prod_color;
	}

	public int getProd_amount() {
		return prod_amount;
	}

	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
	}

	public int getProd_size() {
		return prod_size;
	}

	public void setProd_size(int prod_size) {
		this.prod_size = prod_size;
	}

	public String getProd_price() {
		return prod_price;
	}

	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}

	public String getBill_status() {
		return bill_status;
	}

	public void setBill_status(String bill_status) {
		this.bill_status = bill_status;
	}

	public String getBill_total() {
		return bill_total;
	}

	public void setBill_total(String bill_total) {
		this.bill_total = bill_total;
	}

	@Override
	public String toString() {
		return "BillDetail [bill_id=" + bill_id + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", user_address=" + user_address + ", user_phone=" + user_phone + ", prod_id=" + prod_id
				+ ", prod_name=" + prod_name + ", prod_img1=" + prod_img1 + ", prod_color=" + prod_color
				+ ", prod_amount=" + prod_amount + ", prod_size=" + prod_size + ", prod_price=" + prod_price
				+ ", bill_status=" + bill_status + ", bill_total=" + bill_total + "]";
	}

}
