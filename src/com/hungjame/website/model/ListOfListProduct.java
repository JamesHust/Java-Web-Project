package com.hungjame.website.model;

import java.util.List;

public class ListOfListProduct {
	private List<Product> productList;
	private int cate_id;

	public ListOfListProduct(List<Product> productList, int cate_id) {
		super();
		this.productList = productList;
		this.cate_id = cate_id;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	@Override
	public String toString() {
		return "ListOfListProduct [productList=" + productList + ", cate_id=" + cate_id + "]";
	}

}
