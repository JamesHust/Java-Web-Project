package com.hungjame.website.model;


public class Admins {
	private int admin_id;
	private String admin_name;
	private String admin_email;
	private String admin_pass;
	private String admin_avatar;

	public Admins() {
		super();
	}

	public Admins(int admin_id, String admin_name, String admin_email, String admin_pass, String admin_avatar) {
		super();
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.admin_email = admin_email;
		this.admin_pass = admin_pass;
		this.admin_avatar = admin_avatar;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getAdmin_pass() {
		return admin_pass;
	}

	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}

	public String getAdmin_avatar() {
		return admin_avatar;
	}

	public void setAdmin_avatar(String admin_avatar) {
		this.admin_avatar = admin_avatar;
	}

	@Override
	public String toString() {
		return "Admins [admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_email=" + admin_email
				+ ", admin_pass=" + admin_pass + ", admin_avatar=" + admin_avatar + "]";
	}

}
