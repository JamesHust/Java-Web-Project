package com.hungjame.website.model;


import java.util.List;

public class ItemDetail {
	private List<Product> products;

	public ItemDetail(List<Product> products) {
		super();
		this.products = products;
	}

	public ItemDetail() {
		super();
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "ItemDetail [products=" + products + "]";
	}

}
