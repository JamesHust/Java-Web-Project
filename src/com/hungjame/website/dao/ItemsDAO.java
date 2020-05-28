package com.hungjame.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.hungjame.website.model.Items;

public class ItemsDAO {
	 private DataSource dataSource;
	 
	 public ItemsDAO(DataSource theDataSource) {
		 dataSource = theDataSource;
	 }
	 
	 public List<Items> getItem() throws Exception{
		 List<Items> items = new ArrayList<Items>();
		 
		 Connection cn = null;
		 Statement stt = null;
		 ResultSet rs = null;
		 try {
			 cn = dataSource.getConnection();
			 String sql = "select * from items;";
			 stt = cn.createStatement();
			 rs = stt.executeQuery(sql);
			 while(rs.next()) {
				 String item_id = rs.getString("item_id");
				 String item_name = rs.getString("item_name");
				 Items tempItem = new Items(item_id, item_name);
				 items.add(tempItem);
			 }
			 return items;
		 }finally {
			 close(cn, stt, rs);
		 }
	 }

	private void close(Connection cn, Statement stt, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(stt != null) {
				stt.close();
			}
			if(cn != null) {
				cn.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void updateItem(Items tempItem) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update items set item_name = ? where item_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, tempItem.getItem_name());
			stt.setString(2, tempItem.getItem_id());
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}

	public void deleteItem(String idItem) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from items where item_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, idItem);
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}
}
