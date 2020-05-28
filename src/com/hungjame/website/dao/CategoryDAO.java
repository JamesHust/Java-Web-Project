package com.hungjame.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.hungjame.website.model.Category;


public class CategoryDAO {

	private DataSource dataSource;

	public CategoryDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Category> getCategory(String cateName) throws Exception {

		List<Category> categorys = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select cate.* from category cate where item_id =?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, cateName);
			rs = stt.executeQuery();
			while (rs.next()) {
				int cate_id = rs.getInt("cate_id");
				String item_id = rs.getString("item_id");
				String cate_name = rs.getString("cate_name");
				String cate_img = rs.getString("cate_img");
				Category tempCategory = new Category(cate_id, item_id, cate_name, cate_img);
				tempCategory.toString();
				categorys.add(tempCategory);
			}
			return categorys;
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

	public List<Category> getCategory() throws Exception{
		List<Category> categories = new ArrayList<Category>();
		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from category;";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while(rs.next()) {
				int cate_id = rs.getInt("cate_id");
				String item_id = rs.getString("item_id");
				String cate_name = rs.getString("cate_name");
				String cate_img = rs.getString("cate_img");
				
				Category tempCate = new Category(cate_id, item_id, cate_name, cate_img);
				categories.add(tempCate);
			}
			return categories;
		}finally {
			close(cn, stt, rs);
		}
	}

	public void updateCate(Category tempCate) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update category set item_id = ?, cate_name = ?, cate_img = ? where cate_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, tempCate.getItem_id());
			stt.setString(2, tempCate.getCate_name());
			stt.setString(3, tempCate.getCate_img());
			stt.setInt(4, tempCate.getCate_id());
			
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}

	public void deleteCate(int idCate) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from category where cate_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, idCate);
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}
}
