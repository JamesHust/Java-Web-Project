package com.hungjame.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.hungjame.website.model.Bill;
import com.hungjame.website.model.BillDetail;
import com.hungjame.website.model.ListOfListBill;

public class BillDAO {

	private DataSource dataSource;

	public BillDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Bill> getBill() throws Exception {

		List<Bill> bills = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from bill";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);

			while (rs.next()) {
				int bill_id = rs.getInt("bill_id");
				String bill_user = rs.getString("bill_user");
				String bill_status = rs.getString("bill_status");
				String bill_total = rs.getString("bill_total");
				int prod_amount = rs.getInt("prod_amount");
				int prod_size = rs.getInt("prod_size");
				String prod_id = rs.getString("prod_id");
				int user_id = rs.getInt("user_id");

				Bill tempBill = new Bill(bill_id, bill_user, user_id, prod_amount, prod_id, prod_size, bill_status,
						bill_total);

				bills.add(tempBill);
			}
			return bills;
		} finally {
			close(cn, stt, rs);
		}

	}

	private void close(Connection cn, Statement stt, ResultSet rs) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (stt != null) {
				stt.close();
			}
			if (cn != null) {
				cn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void createNewBill(Bill tempBill) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into bill(bill_user, bill_status, bill_total, prod_amount, prod_size, prod_id, user_id) values( ?, ?, ?, ?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);
			stt.setString(1, tempBill.getBill_user());
			stt.setString(2, tempBill.getBill_status());
			stt.setString(3, tempBill.getBill_total());
			stt.setInt(4, tempBill.getProd_amount());
			stt.setInt(5, tempBill.getProd_size());
			stt.setString(6, tempBill.getProd_id());
			stt.setInt(7, tempBill.getUser_id());
			stt.execute();
		} finally {
			close(cn, stt, null);
		}

	}

	public List<BillDetail> getAllBillDetail() throws Exception {
		List<BillDetail> listBill = new ArrayList<BillDetail>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while (rs.next()) {

			}
			return listBill;
		} finally {
			close(cn, stt, rs);
		}
	}

	public List<BillDetail> getBillDetail(String billOfUser) throws Exception {
		List<BillDetail> listBill = new ArrayList<BillDetail>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select b.bill_id, b.bill_user, b.user_id, u.user_name, u.user_address, u.user_phone, b.prod_id, p.prod_name, p.prod_img1, p.prod_color, b.prod_amount, b.prod_size, p.prod_price, b.bill_status, b.bill_total "
					+ "from bill b, product p, users u "
					+ "where b.user_id = u.user_id and b.prod_id = p.prod_id and b.bill_user = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, billOfUser);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("bill_id");
				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				String user_address = rs.getString("user_address");
				String user_phone = rs.getString("user_phone");
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_img1 = rs.getString("prod_img1");
				String prod_color = rs.getString("prod_color");
				int prod_amount = rs.getInt("prod_amount");
				int prod_size = rs.getInt("prod_size");
				String prod_price = rs.getString("prod_price");
				String bill_status = rs.getString("bill_status");
				String bill_total = rs.getString("bill_total");

				BillDetail tempBill = new BillDetail(bill_id, user_id, user_name, user_address, user_phone, prod_id,
						prod_name, prod_img1, prod_color, prod_amount, prod_size, prod_price, bill_status, bill_total);
				listBill.add(tempBill);
			}
			return listBill;
		} finally {
			close(cn, stt, rs);
		}
	}

	public List<ListOfListBill> getListOfListBill(int userID) throws Exception {
		List<ListOfListBill> listOfListBill = new ArrayList<ListOfListBill>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select distinct bill_user from bill where user_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, userID);
			rs = stt.executeQuery();
			while (rs.next()) {
				String billOfUser = rs.getString("bill_user");
				List<BillDetail> listBill = getBillDetail(billOfUser);
				ListOfListBill tempListOfListBill = new ListOfListBill(listBill);
				listOfListBill.add(tempListOfListBill);
			}
			return listOfListBill;
		} finally {
			close(cn, stt, rs); // manipulation
		}
	}

}
