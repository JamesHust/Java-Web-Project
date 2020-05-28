package com.hungjame.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.hungjame.website.model.ListOfListProduct;
import com.hungjame.website.model.Product;

public class ProductDAO {

	private static DataSource dataSource;

	public ProductDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Product> getProductByItem(String cateName) throws Exception {

		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;

		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select sp.prod_id, sp.prod_name, sp.prod_img1, sp.prod_price, sp.cate_id from product sp, category cate where sp.cate_id = cate.cate_id and cate.item_id =? order by rand() limit 8;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, cateName);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_img1 = rs.getString("prod_img1");
				String prod_price = rs.getString("prod_price");
				int cate_id = rs.getInt("cate_id");
				Product tempProduct = new Product(prod_id, prod_name, prod_img1, prod_price, cate_id);
				products.add(tempProduct);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}

	public List<Product> getAllProductByItem(String cateName) throws Exception {

		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;

		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select sp.prod_id, sp.prod_name, sp.prod_img1, sp.prod_price, sp.cate_id from product sp, category cate where sp.cate_id = cate.cate_id and cate.item_id =? ";
			stt = cn.prepareStatement(sql);
			stt.setString(1, cateName);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_img1 = rs.getString("prod_img1");
				String prod_price = rs.getString("prod_price");
				int cate_id = rs.getInt("cate_id");
				Product tempProduct = new Product(prod_id, prod_name, prod_img1, prod_price, cate_id);
				products.add(tempProduct);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}

	public List<Product> getProductByCate(int cateId, int number) throws Exception {

		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select sp.prod_id, sp.prod_name, sp.prod_img1, sp.prod_price, sp.cate_id from product sp, category cate where sp.cate_id = cate.cate_id and cate.cate_id =? order by rand() limit ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, cateId);
			stt.setInt(2, number);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_img1 = rs.getString("prod_img1");
				String prod_price = rs.getString("prod_price");
				int cate_id = rs.getInt("cate_id");
				Product tempProduct = new Product(prod_id, prod_name, prod_img1, prod_price, cate_id);
				products.add(tempProduct);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}

	public List<Product> getAllProductByCate(int cateId) throws Exception {

		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select sp.* from product sp, category cate where sp.cate_id = cate.cate_id and cate.cate_id =?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, cateId);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_img1 = rs.getString("prod_img1");
				String prod_img2 = rs.getString("prod_img2");
				String prod_img3 = rs.getString("prod_img3");
				String prod_img4 = rs.getString("prod_img4");
				String prod_img5 = rs.getString("prod_img5");
				String prod_img6 = rs.getString("prod_img6");
				String prod_img7 = rs.getString("prod_img7");
				String prod_price = rs.getString("prod_price");
				int prod_size1 = rs.getInt("prod_size1");
				int prod_size2 = rs.getInt("prod_size2");
				int prod_size3 = rs.getInt("prod_size3");
				String prod_color = rs.getString("prod_color");
				String prod_condition = rs.getString("prod_condition");
				String prod_description1 = rs.getString("prod_description1");
				String prod_description2 = rs.getString("prod_description2");
				String prod_description3 = rs.getString("prod_description3");
				int cate_id = rs.getInt("cate_id");
				Product tempProduct = new Product(prod_id, prod_name, prod_img1, prod_img2, prod_img3, prod_img4,
						prod_img5, prod_img6, prod_img7, prod_description1, prod_description2, prod_description3,
						prod_price, prod_size1, prod_size2, prod_size3, prod_color, prod_condition, cate_id);
				products.add(tempProduct);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}

	public List<ListOfListProduct> getListOfListProduct() throws Exception {
		List<ListOfListProduct> listOfListProduct = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;

		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select cate.cate_id from category cate;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				int cate_id = rs.getInt("cate_id");
				List<Product> product = getProductByCate(cate_id, 8);
				ListOfListProduct tempListOfListProduct = new ListOfListProduct(product, cate_id);
				listOfListProduct.add(tempListOfListProduct);
			}
			return listOfListProduct;
		} finally {
			close(cn, stt, rs);
		}

	}

	public List<ListOfListProduct> getListOfAllProduct() throws Exception {
		List<ListOfListProduct> listOfAllProduct = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;

		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select cate.cate_id from category cate;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				int cate_id = rs.getInt("cate_id");
				List<Product> product = getAllProductByCate(cate_id);
				ListOfListProduct tempListOfAllProduct = new ListOfListProduct(product, cate_id);
				listOfAllProduct.add(tempListOfAllProduct);
			}
			return listOfAllProduct;
		} finally {
			close(cn, stt, rs);
		}

	}

	public static Product getDetailProduct(String productId) throws Exception {
		Product tempProduct = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from product where prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, productId);
			rs = stt.executeQuery();
			if (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_img1 = rs.getString("prod_img1");
				String prod_img2 = rs.getString("prod_img2");
				String prod_img3 = rs.getString("prod_img3");
				String prod_img4 = rs.getString("prod_img4");
				String prod_img5 = rs.getString("prod_img5");
				String prod_img6 = rs.getString("prod_img6");
				String prod_img7 = rs.getString("prod_img7");
				String prod_price = rs.getString("prod_price");
				int prod_size1 = rs.getInt("prod_size1");
				int prod_size2 = rs.getInt("prod_size2");
				int prod_size3 = rs.getInt("prod_size3");
				String prod_color = rs.getString("prod_color");
				String prod_condition = rs.getString("prod_condition");
				String prod_description1 = rs.getString("prod_description1");
				String prod_description2 = rs.getString("prod_description2");
				String prod_description3 = rs.getString("prod_description3");
				int cate_id = rs.getInt("cate_id");

				tempProduct = new Product(prod_id, prod_name, prod_img1, prod_img2, prod_img3, prod_img4, prod_img5,
						prod_img6, prod_img7, prod_description1, prod_description2, prod_description3, prod_price,
						prod_size1, prod_size2, prod_size3, prod_color, prod_condition, cate_id);

			} else {
				throw new Exception("Could not find product id:" + productId);
			}
			return tempProduct;
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

	public void deleteProductById(String productId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from product where prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, productId);
			stt.execute();
		} finally {
			close(cn, stt, null);
		}

	}

	public List<Product> searchProduct(String inputSearch) throws Exception {
		System.out.println(inputSearch);
		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select prod_id, prod_name, prod_img1, prod_price, cate_id from product where prod_name like ?;";
			stt = cn.prepareStatement(sql);
			String newString = "%" + inputSearch + "%";
			stt.setString(1, newString);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_img1 = rs.getString("prod_img1");
				String prod_price = rs.getString("prod_price");
				int cate_id = rs.getInt("cate_id");
				Product tempProduct = new Product(prod_id, prod_name, prod_img1, prod_price, cate_id);
				products.add(tempProduct);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}
	}

	public void createNewProduct(Product newProduct) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into product(prod_id, prod_name, prod_img1, prod_img2, prod_img3, prod_img4, prod_img5, prod_img6, prod_img7, prod_price, prod_size1, prod_size2, prod_size3, prod_color, prod_condition, prod_description1, prod_description2, prod_description3, cate_id) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			stt  = cn.prepareStatement(sql);
			
			stt.setString(1, newProduct.getProd_id());
			stt.setString(2, newProduct.getProd_name());
			stt.setString(3, newProduct.getProd_img1());
			stt.setString(4, newProduct.getProd_img2());
			stt.setString(5, newProduct.getProd_img3());
			stt.setString(6, newProduct.getProd_img4());
			stt.setString(7, newProduct.getProd_img5());
			stt.setString(8, newProduct.getProd_img6());
			stt.setString(9, newProduct.getProd_img7());
			stt.setString(10, newProduct.getProd_price());
			stt.setInt(11, newProduct.getProd_size1());
			stt.setInt(12, newProduct.getProd_size2());
			stt.setInt(13, newProduct.getProd_size3());
			stt.setString(14, newProduct.getProd_color());
			stt.setString(15, newProduct.getProd_condition());
			stt.setString(16, newProduct.getProd_description1());
			stt.setString(17, newProduct.getProd_description2());
			stt.setString(18, newProduct.getProd_description3());
			stt.setInt(19, newProduct.getCate_id());
			
			stt.executeUpdate();
		} finally {
			close(cn, stt, null);
		}

	}

}
