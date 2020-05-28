package com.hungjame.website.model;

public class Bill {
	private int bill_id;
	private String bill_user;
	private int user_id;
	private int prod_amount;
	private String prod_id;
	private int prod_size;
	private String bill_status;
	private String bill_total;

	public Bill() {
		super();
	}

	public Bill(String bill_user, int user_id, int prod_amount, String prod_id, int prod_size, String bill_status,
			String bill_total) {
		super();
		this.bill_user = bill_user;
		this.user_id = user_id;
		this.prod_amount = prod_amount;
		this.prod_id = prod_id;
		this.prod_size = prod_size;
		this.bill_status = bill_status;
		this.bill_total = bill_total;
	}

	public Bill(int bill_id, String bill_user, int user_id, int prod_amount, String prod_id, int prod_size,
			String bill_status, String bill_total) {
		super();
		this.bill_id = bill_id;
		this.bill_user = bill_user;
		this.user_id = user_id;
		this.prod_amount = prod_amount;
		this.prod_id = prod_id;
		this.prod_size = prod_size;
		this.bill_status = bill_status;
		this.bill_total = bill_total;
	}

	public int getBill_id() {
		return bill_id;
	}

	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}

	public String getBill_user() {
		return bill_user;
	}

	public void setBill_user(String bill_user) {
		this.bill_user = bill_user;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getProd_amount() {
		return prod_amount;
	}

	public void setProd_amount(int prod_amount) {
		this.prod_amount = prod_amount;
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
		return "Bill [bill_id=" + bill_id + ", bill_user=" + bill_user + ", user_id=" + user_id + ", prod_amount="
				+ prod_amount + ", prod_id=" + prod_id + ", prod_size=" + prod_size + ", bill_status=" + bill_status
				+ ", bill_total=" + bill_total + "]";
	}

}
