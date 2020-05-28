package com.hungjame.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.hungjame.website.model.Admins;

public class AdminsDAO {

	private static DataSource dataSource;

	public AdminsDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Admins> getAdmin() throws Exception {

		List<Admins> admins = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from admins";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while (rs.next()) {
				int admin_id = rs.getInt("admin_id");
				String admin_email = rs.getString("admin_email");
				String admin_pass = rs.getString("admin_pass");
				String admin_avatar = rs.getString("admin_avatar");
				String admin_name = rs.getString("admin_name");

				Admins tempAdmin = new Admins(admin_id, admin_name, admin_email, admin_pass, admin_avatar);
				admins.add(tempAdmin);
			}
			return admins;

		} finally {
			close(cn, stt, rs);
		}

	}

	private static void close(Connection cn, Statement stt, ResultSet rs) {
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

	public Admins getMyAdmin(int idAdmin) throws Exception {
		Admins myAdmin = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from admins where admin_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, idAdmin);
			rs = stt.executeQuery();
			if (rs.next()) {
				int admin_id = rs.getInt("admin_id");
				String admin_email = rs.getString("admin_email");
				String admin_pass = rs.getString("admin_pass");
				String admin_avatar = rs.getString("admin_avatar");
				String admin_name = rs.getString("admin_name");

				myAdmin = new Admins(admin_id, admin_name, admin_email, admin_pass, admin_avatar);
			} else {
				throw new Exception("Can not found admin id:" + idAdmin);
			}
			return myAdmin;
		} finally {
			close(cn, stt, rs);
		}
	}

	public void updateAdmin(Admins updatedAdmin) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update admins set admin_avatar = ?, admin_name = ?, admin_email = ?, admin_pass = ? where admin_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, updatedAdmin.getAdmin_avatar());
			stt.setString(2, updatedAdmin.getAdmin_name());
			stt.setString(3, updatedAdmin.getAdmin_email());
			stt.setString(4, updatedAdmin.getAdmin_pass());
			stt.setInt(5, updatedAdmin.getAdmin_id());

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	public void deleteAccountAdmin(int adminId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from admins where admin_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, adminId);
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}

}
