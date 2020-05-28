package com.hungjame.website.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.hungjame.website.model.Cart;
import com.hungjame.website.model.ProductCart;

public class CartDAO {
	
	private DataSource dataSource;
	
	public CartDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Cart> getCart() throws Exception{
		
		List<Cart> carts = new ArrayList<>();
		
		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		
		try {
			cn = dataSource.getConnection();
			String sql = "select * from cart";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			
			while(rs.next()) {
				int cart_id = rs.getInt("cart_id");
				int user_id = rs.getInt("user_id");
				String prod_id = rs.getString("prod_id");
				int prod_size = rs.getInt("prod_size");
				int prod_amount = rs.getInt("prod_amount");
				
				Cart tempCart = new Cart(cart_id, user_id, prod_id, prod_size, prod_amount);
				
				carts.add(tempCart);
			}
			return carts;
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
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	public void createNewCart(Cart newCart) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		
		try {
			cn = dataSource.getConnection();
			String sql = "insert into cart(user_id, prod_id, prod_size, prod_amount) values (?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);
			
			stt.setInt(1, newCart.getUser_id());
			stt.setString(2, newCart.getProd_id());
			stt.setInt(3, newCart.getProd_size());
			stt.setInt(4, newCart.getProd_amount()); 
			
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}

	public List<ProductCart> viewCate(int userID) throws Exception{
		List<ProductCart> carts = new ArrayList<ProductCart>();
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		
		try {
			cn = dataSource.getConnection();
			String sql = "select p.prod_img1, p.prod_name, p.prod_id, p.prod_color, p.prod_price, p.prod_condition, c.cart_id, c.user_id, c.prod_amount, c.prod_size  from cart c, product p where c.prod_id = p.prod_id and c.user_id= ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, userID);
			rs = stt.executeQuery();
			while(rs.next()) {
				int user_id = rs.getInt("user_id");
				int cart_id = rs.getInt("cart_id");
				String prod_img1 = rs.getString("prod_img1");
				String prod_name = rs.getString("prod_name");
				String prod_color = rs.getString("prod_color");
				String prod_price = rs.getString("prod_price");
				String prod_condition = rs.getString("prod_condition");
				String prod_id = rs.getString("prod_id");
				int prod_size = rs.getInt("prod_size");
				int prod_amount = rs.getInt("prod_amount");
				
				ProductCart newCart = new ProductCart(user_id, cart_id, prod_size, prod_id, prod_img1, prod_name, prod_color, prod_condition, prod_price, prod_amount);
				carts.add(newCart);
				
			}
			return carts;
		}finally {
			close(cn, stt, rs);
		}
		
		
	}

	public void deleteCart(int cartID) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql ="delete from cart where cart_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, cartID);
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
	}

	public void updateCart(int cart_id, int prod_amount) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update cart set prod_amount = ? where cart_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, prod_amount);
			stt.setInt(2, cart_id);
			
			stt.executeUpdate();
		}finally {
			close(cn, stt, null);
		}
		
	}

	public void deleteAllCart(int userID) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql ="delete from cart where user_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, userID);
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
		
	}
}
