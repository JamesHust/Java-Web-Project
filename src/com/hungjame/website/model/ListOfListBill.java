package com.hungjame.website.model;

import java.util.List;

public class ListOfListBill {
	private List<BillDetail> listBill;

	public ListOfListBill() {
		super();
	}

	public ListOfListBill(List<BillDetail> listBill) {
		super();
		this.listBill = listBill;
	}

	public List<BillDetail> getListBill() {
		return listBill;
	}

	public void setListBill(List<BillDetail> listBill) {
		this.listBill = listBill;
	}

	@Override
	public String toString() {
		return "ListOfListBill [listBill=" + listBill + "]";
	}

}
