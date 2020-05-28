package com.hungjame.website.model;

public class Product {
	private String prod_id;
	private String prod_name;
	private String prod_img1;
	private String prod_img2;
	private String prod_img3;
	private String prod_img4;
	private String prod_img5;
	private String prod_img6;
	private String prod_img7;
	private String prod_description1;
	private String prod_description2;
	private String prod_description3;
	private String prod_price;
	private int prod_size1;
	private int prod_size2;
	private int prod_size3;
	private String prod_color;
	private String prod_condition;
	private int cate_id;

	public Product() {
		super();
	}

	public Product(String prod_id, String prod_name, String prod_img1, String prod_img2, String prod_img3,
			String prod_img4, String prod_img5, String prod_img6, String prod_img7, String prod_description1,
			String prod_description2, String prod_description3, String prod_price, int prod_size1, int prod_size2,
			int prod_size3, String prod_color, String prod_condition, int cate_id) {
		super();
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.prod_img1 = prod_img1;
		this.prod_img2 = prod_img2;
		this.prod_img3 = prod_img3;
		this.prod_img4 = prod_img4;
		this.prod_img5 = prod_img5;
		this.prod_img6 = prod_img6;
		this.prod_img7 = prod_img7;
		this.prod_description1 = prod_description1;
		this.prod_description2 = prod_description2;
		this.prod_description3 = prod_description3;
		this.prod_price = prod_price;
		this.prod_size1 = prod_size1;
		this.prod_size2 = prod_size2;
		this.prod_size3 = prod_size3;
		this.prod_color = prod_color;
		this.prod_condition = prod_condition;
		this.cate_id = cate_id;
	}

	public Product(String prod_id, String prod_name, String prod_img1, String prod_price, int cate_id) {
		super();
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.prod_img1 = prod_img1;
		this.prod_price = prod_price;
		this.cate_id = cate_id;
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

	public String getProd_img2() {
		return prod_img2;
	}

	public void setProd_img2(String prod_img2) {
		this.prod_img2 = prod_img2;
	}

	public String getProd_img3() {
		return prod_img3;
	}

	public void setProd_img3(String prod_img3) {
		this.prod_img3 = prod_img3;
	}

	public String getProd_img4() {
		return prod_img4;
	}

	public void setProd_img4(String prod_img4) {
		this.prod_img4 = prod_img4;
	}

	public String getProd_img5() {
		return prod_img5;
	}

	public void setProd_img5(String prod_img5) {
		this.prod_img5 = prod_img5;
	}

	public String getProd_img6() {
		return prod_img6;
	}

	public void setProd_img6(String prod_img6) {
		this.prod_img6 = prod_img6;
	}

	public String getProd_img7() {
		return prod_img7;
	}

	public void setProd_img7(String prod_img7) {
		this.prod_img7 = prod_img7;
	}

	public String getProd_description1() {
		return prod_description1;
	}

	public void setProd_description1(String prod_description1) {
		this.prod_description1 = prod_description1;
	}

	public String getProd_description2() {
		return prod_description2;
	}

	public void setProd_description2(String prod_description2) {
		this.prod_description2 = prod_description2;
	}

	public String getProd_description3() {
		return prod_description3;
	}

	public void setProd_description3(String prod_description3) {
		this.prod_description3 = prod_description3;
	}

	public String getProd_price() {
		return prod_price;
	}

	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}

	public int getProd_size1() {
		return prod_size1;
	}

	public void setProd_size1(int prod_size1) {
		this.prod_size1 = prod_size1;
	}

	public int getProd_size2() {
		return prod_size2;
	}

	public void setProd_size2(int prod_size2) {
		this.prod_size2 = prod_size2;
	}

	public int getProd_size3() {
		return prod_size3;
	}

	public void setProd_size3(int prod_size3) {
		this.prod_size3 = prod_size3;
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

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	@Override
	public String toString() {
		return "Product [prod_id=" + prod_id + ", prod_name=" + prod_name + ", prod_img1=" + prod_img1 + ", prod_img2="
				+ prod_img2 + ", prod_img3=" + prod_img3 + ", prod_img4=" + prod_img4 + ", prod_img5=" + prod_img5
				+ ", prod_img6=" + prod_img6 + ", prod_img7=" + prod_img7 + ", prod_description1=" + prod_description1
				+ ", prod_description2=" + prod_description2 + ", prod_description3=" + prod_description3
				+ ", prod_price=" + prod_price + ", prod_size1=" + prod_size1 + ", prod_size2=" + prod_size2
				+ ", prod_size3=" + prod_size3 + ", prod_color=" + prod_color + ", prod_condition=" + prod_condition
				+ ", cate_id=" + cate_id + "]";
	}

}
