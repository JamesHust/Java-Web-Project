package com.hungjame.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.hungjame.website.model.Users;

public class UsersDAO {
	private DataSource dataSource;

	public UsersDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Users> getUsers() throws Exception {
		List<Users> users = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from users;";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);

			while (rs.next()) {
				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				String user_dob = rs.getString("user_dob");
				String user_address = rs.getString("user_address");
				String user_email = rs.getString("user_email");
				String user_phone = rs.getString("user_phone");
				String user_pass = rs.getString("user_pass");
				String user_gender = rs.getString("user_gender");

				Users tempUser = new Users(user_id, user_name, user_dob, user_address, user_email, user_phone,
						user_pass, user_gender);

				users.add(tempUser);
			}
			return users;

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

	public void createNewUser(Users newUser) throws Exception {

		Connection cn = null;
		PreparedStatement stt = null;

		try {
			cn = dataSource.getConnection();
			String sql = "insert into users(user_name, user_dob, user_address, user_email, user_phone, user_pass, user_gender) values(?, ?, ?, ?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newUser.getUser_name());
			stt.setString(2, newUser.getUser_dob());
			stt.setString(3, newUser.getUser_address());
			stt.setString(4, newUser.getUser_email());
			stt.setString(5, newUser.getUser_phone());
			stt.setString(6, newUser.getUser_pass());
			stt.setString(7, newUser.getUser_gender());

			stt.execute();

		} finally {
			close(cn, stt, null);
		}
	}

	public void updateUser(Users tempUser) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update users set user_name = ?, user_dob = ?, user_address = ?, user_email = ?, user_phone = ?, user_pass = ?, user_gender = ? where user_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, tempUser.getUser_name());
			stt.setString(2, tempUser.getUser_dob());
			stt.setString(3, tempUser.getUser_address());
			stt.setString(4, tempUser.getUser_email());
			stt.setString(5, tempUser.getUser_phone());
			stt.setString(6, tempUser.getUser_pass());
			stt.setString(7, tempUser.getUser_gender());
			stt.setInt(8, tempUser.getUser_id());
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
	}

	public Users getDetailUser(int userID) throws Exception {
		Users tempUser = null;
		
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from users where user_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, userID);
			rs = stt.executeQuery();
			if(rs.next()) {
				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				String user_dob = rs.getString("user_dob");
				String user_address = rs.getString("user_address");
				String user_email = rs.getString("user_email");
				String user_phone = rs.getString("user_phone");
				String user_pass = rs.getString("user_pass");
				String user_gender = rs.getString("user_gender");
				
				tempUser = new Users(user_id, user_name, user_dob, user_address, user_email, user_phone, user_pass, user_gender);
			}
			return tempUser;
		}finally {
			close(cn, stt, rs);
		}
		
	}

	public void deleteAccountUser(int userId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from users where user_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, userId);
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}

}
