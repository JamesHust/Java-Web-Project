package com.hungjame.website.model;

public class Users {
	private int user_id;
	private String user_name;
	private String user_dob;
	private String user_address;
	private String user_email;
	private String user_phone;
	private String user_pass;
	private String user_gender;

	public Users(int user_id, String user_name, String user_dob, String user_address, String user_email,
			String user_phone, String user_pass, String user_gender) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_dob = user_dob;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_pass = user_pass;
		this.user_gender = user_gender;
	}

	public Users(String user_name, String user_dob, String user_address, String user_email, String user_phone,
			String user_pass, String user_gender) {
		super();
		this.user_name = user_name;
		this.user_dob = user_dob;
		this.user_address = user_address;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_pass = user_pass;
		this.user_gender = user_gender;
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

	public String getUser_dob() {
		return user_dob;
	}

	public void setUser_dob(String user_dob) {
		this.user_dob = user_dob;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	@Override
	public String toString() {
		return "Users [user_id=" + user_id + ", user_name=" + user_name + ", user_dob=" + user_dob + ", user_address="
				+ user_address + ", user_email=" + user_email + ", user_phone=" + user_phone + ", user_pass="
				+ user_pass + ", user_gender=" + user_gender + "]";
	}

}
