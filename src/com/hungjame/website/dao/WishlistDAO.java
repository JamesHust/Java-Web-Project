package com.hungjame.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.hungjame.website.model.Wishlist;

public class WishlistDAO {

	private DataSource dataSource;

	public WishlistDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Wishlist> getWishlist() throws Exception {

		List<Wishlist> wishlists = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from wishlist";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);

			while (rs.next()) {
				int wish_id = rs.getInt("wish_id");
				int user_id = rs.getInt("user_id");
				String prod_id = rs.getString("prod_id");

				Wishlist tempWishlist = new Wishlist(wish_id, user_id, prod_id);

				wishlists.add(tempWishlist);
			}
			return wishlists;
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

	public void deleteWishlist(int iduser, String idproduct) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from wishlist where user_id = ? and prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, iduser);
			stt.setString(2, idproduct);
			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	public void createWishlist(int iduser, String idproduct) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into wishlist(user_id, prod_id) values(?, ?);";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, iduser);
			stt.setString(2, idproduct);
			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	public String getIdProduct(int iduser) throws Exception {
		String listIdProd = "";
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select prod_id from wishlist where user_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, iduser);
			rs = stt.executeQuery();
			while(rs.next()) {
				String prod_id = rs.getString("prod_id");
				listIdProd += prod_id + ",";
			}
			return listIdProd;
		}finally {
			close(cn, stt, null);
		}
	}
}
