package com.hungjame.website.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.Normalizer;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.hungjame.website.dao.AdminsDAO;
import com.hungjame.website.dao.BillDAO;
import com.hungjame.website.dao.CategoryDAO;
import com.hungjame.website.dao.ItemsDAO;
import com.hungjame.website.dao.ProductDAO;
//import com.hungjame.website.dao.CartDAO;
//import com.hungjame.website.dao.CategoryDAO;
//import com.hungjame.website.dao.ProductDAO;
import com.hungjame.website.dao.UsersDAO;
import com.hungjame.website.model.Admins;
import com.hungjame.website.model.BillDetail;
import com.hungjame.website.model.Category;
import com.hungjame.website.model.Items;
import com.hungjame.website.model.ListOfListProduct;
import com.hungjame.website.model.Product;
import com.hungjame.website.model.Users;

/**
 * Servlet implementation class AdminController
 */
@WebServlet(name = "AdminController", urlPatterns = { "/admin" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 5, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 100)
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	private ItemsDAO itemsDAO;
	private AdminsDAO adminsDAO;
	private CategoryDAO categoryDAO;
	private UsersDAO usersDAO;
	private BillDAO billDAO;

	@Resource(name = "jdbc/shopproject")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			itemsDAO = new ItemsDAO(dataSource);
			productDAO = new ProductDAO(dataSource);
			adminsDAO = new AdminsDAO(dataSource);
			categoryDAO = new CategoryDAO(dataSource);
			usersDAO = new UsersDAO(dataSource);
			billDAO = new BillDAO(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int idAdmin = 0;
			String theCommand = request.getParameter("command");
			if (theCommand == null) {
				theCommand = "LOADADMIN";
			}
			switch (theCommand) {
			case "LOADADMIN":
				loadAdmin(request, response);
				break;
			case "LOADMYACCOUNT":
				loadMyAccount(request, response, idAdmin);
				break;
			case "LOADALLACCOUNTADMIN":
				loadAllAccountAdmin(request, response);
				break;
			case "LOADACCOUNTUSER":
				loadAccountUser(request, response);
				break;
			case "LOADCATE":
				loadCate(request, response);
				break;
			case "LOADITEM":
				loadItem(request, response);
				break;
			case "LOADPRODUCTBYCATE":
				loadProductByCate(request, response);
				break;
			case "LOADCATEBYITEM":
				loadCateByItem(request, response);
				break;
			case "LOADBILL":
				loadBill(request, response);
				break;
			case "LOGOUTADMIN":
				logOutAdmin(request, response);
				break;
			case "DELETEPRODUCT":
				deleteProduct(request, response);
				break;
			case "DELETEACCOUNTUSER":
				deleteAccountUser(request, response);
				break;
			case "DELETEACCOUNTADMIN":
				deleteAccountAdmin(request, response);
				break;
			case "DELETECATE":
				deleteCate(request, response);
				break;
			case "DELETEITEM":
				deleteItem(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void deleteAccountAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));
		int adminId = Integer.parseInt(request.getParameter("adminId"));
		System.out.println("Delete admin have admin_id = " + adminId);
		adminsDAO.deleteAccountAdmin(adminId);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void deleteAccountUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		System.out.println("Delete user have user_id = " + userId);
		usersDAO.deleteAccountUser(userId);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));
		String productId = request.getParameter("productId");
		System.out.println("Delete product have prod_id = " + productId);

		Product tempProd = ProductDAO.getDetailProduct(productId);
		String imgString = tempProd.getProd_img2();
		String[] words = imgString.split("[/]");
		String url = "C:\\Users\\hungj\\eclipse-workspace\\shop-project\\WebContent\\".replace("\\", "/") + words[0]
				+ "/" + words[1] + "/" + words[2] + "/" + words[3];
		System.out.println("delete-----------------------------: " + url);
		Path img = Paths.get(url);
		Files.walk(img).map(Path::toFile).sorted(Comparator.comparing(File::isDirectory)).forEach(File::delete);

		productDAO.deleteProductById(productId);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));
		System.out.print(idMyAdmin);
		String idItem = request.getParameter("idItem");
		itemsDAO.deleteItem(idItem);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void deleteCate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));

		int idCate = Integer.parseInt(request.getParameter("idCate"));
		categoryDAO.deleteCate(idCate);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void loadCateByItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Category> categorys_shoe = categoryDAO.getCategory("IT1");
		List<Category> categorys_bag = categoryDAO.getCategory("IT2");
		List<Category> categorys_jewelry = categoryDAO.getCategory("IT3");

		request.setAttribute("CATEGORY_SHOE", categorys_shoe);
		request.setAttribute("CATEGORY_BAG", categorys_bag);
		request.setAttribute("CATEGORY_JEWELRY", categorys_jewelry);
		loadProductByCate(request, response);
	}

	private void loadProductByCate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListProduct> tempListOfAllProduct = productDAO.getListOfAllProduct();
		request.setAttribute("ALL_PRODUCTS_BY_CATE", tempListOfAllProduct);
		loadBill(request, response);
	}

	private void loadItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Items> tempItem = itemsDAO.getItem();
		request.setAttribute("TEMP_ITEM", tempItem);
		loadCateByItem(request, response);
	}

	private void loadCate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Category> tempCate = categoryDAO.getCategory();
		request.setAttribute("TEMP_CATE", tempCate);
		loadItem(request, response);
	}

	private void logOutAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		loadAdmin(request, response);
	}

	private void loadBill(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BillDetail> tempBill = billDAO.getAllBillDetail();
		request.setAttribute("TEMP_BILL_DETAIL", tempBill);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/admin.jsp");
		dispatcher.forward(request, response);
	}

	private void loadAccountUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Users> tempAccountUser = usersDAO.getUsers();
		request.setAttribute("TEMP_ACCOUNT_USER", tempAccountUser);
		loadCate(request, response);
	}

	private void loadAllAccountAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Admins> tempAccountAdmin = adminsDAO.getAdmin();
		request.setAttribute("TEMP_ACCOUNT_ADMIN", tempAccountAdmin);
		loadAccountUser(request, response);
	}

	private void loadMyAccount(HttpServletRequest request, HttpServletResponse response, int idAdmin) throws Exception {
		System.out.println("ID Admin:" + idAdmin);
		System.out.println("loadMyAccount run...");
		Admins myAdmin = adminsDAO.getMyAdmin(idAdmin);
		request.setAttribute("MY_ADMIN", myAdmin);
		loadAllAccountAdmin(request, response);
	}

	private void loadAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/login-admin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String emailAdmin = request.getParameter("emailAdmin");
		String passAdmin = request.getParameter("passAdmin");
		try {
			String theCommand = request.getParameter("command");
			System.out.println("doPost: command got: " + theCommand);
			switch (theCommand) {
			case "CHECKLOGIN":
				checkLogin(request, response, emailAdmin, passAdmin);
				break;
			case "UPDATEACCOUNTADMIN":
				updateAccountAdmin(request, response);
				break;
			case "UPDATEACCOUNTUSER":
				updateAccountUser(request, response);
				break;
			case "UPDATECATE":
				updateCate(request, response);
				break;
			case "UPDATEITEM":
				updateItem(request, response);
				break;
			case "ADDPRODUCTBYADMIN1":
				addProductByAdmin(request, response);
				break;
			case "ADDPRODUCTBYADMIN2":
				addProductByAdmin(request, response);
				break;
			case "ADDPRODUCTBYADMIN3":
				addProductByAdmin(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addProductByAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));
		String idProd = request.getParameter("idProd");
		String nameProd = request.getParameter("nameProd");
		int idCate = Integer.parseInt(request.getParameter("idCate"));
		String priceProd = request.getParameter("priceProd");
		int sizeProd1 = Integer.parseInt(request.getParameter("sizeProd1"));
		int sizeProd2 = Integer.parseInt(request.getParameter("sizeProd2"));
		int sizeProd3 = Integer.parseInt(request.getParameter("sizeProd3"));
		String colorProd = request.getParameter("colorProd");
		String condProd = request.getParameter("condProd");
		String desProd1 = request.getParameter("desProd1");
		String desProd2 = request.getParameter("desProd2");
		String desProd3 = request.getParameter("desProd3");
		List<Category> listCate = categoryDAO.getCategory();
		for (Category tempCate : listCate) {
			if (idCate == (tempCate.getCate_id())) {
				String nameCate = tempCate.getCate_name();
				String temp = Normalizer.normalize(nameCate, Normalizer.Form.NFD);
				String pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+").matcher(temp).replaceAll("")
						.toLowerCase();
				String cateName = pattern.replaceAll("\\s", "-");
				List<Items> listItem = itemsDAO.getItem();
				for (Items tempItem : listItem) {
					if ((tempCate.getItem_id()).equals(tempItem.getItem_id())) {
						String nameItem = tempItem.getItem_name();
						String temp2 = Normalizer.normalize(nameItem, Normalizer.Form.NFD);
						String patternItem = Pattern.compile("\\p{InCombiningDiacriticalMarks}+").matcher(temp2)
								.replaceAll("").toLowerCase();
						String itemName = patternItem.replaceAll("\\s", "-");

						String url = "C:\\Users\\hungj\\eclipse-workspace\\shop-project\\WebContent\\img\\" + itemName
								+ "\\" + cateName + "\\" + idProd;

						String prod_img1 = "img/" + itemName + "/" + cateName + "/" + idProd + "/img1.jpg";
						String prod_img2 = "img/" + itemName + "/" + cateName + "/" + idProd + "/img2.jpg";
						String prod_img3 = "img/" + itemName + "/" + cateName + "/" + idProd + "/img3.jpg";
						String prod_img4 = "img/" + itemName + "/" + cateName + "/" + idProd + "/img4.jpg";
						String prod_img5 = "img/" + itemName + "/" + cateName + "/" + idProd + "/img5.jpg";
						String prod_img6 = "img/" + itemName + "/" + cateName + "/" + idProd + "/img6.jpg";
						String prod_img7 = "img/" + itemName + "/" + cateName + "/" + idProd + "/img7.jpg";

						if (colorProd == null) {
							colorProd = "";
						}
						if (condProd == null) {
							condProd = "";
						}
						if (desProd1 == null) {
							desProd1 = "";
						}
						if (desProd2 == null) {
							desProd2 = "";
						}
						if (desProd3 == null) {
							desProd3 = "";
						}

						Product newProduct = new Product(idProd, nameProd, prod_img1, prod_img2, prod_img3, prod_img4,
								prod_img5, prod_img6, prod_img7, desProd1, desProd2, desProd3, priceProd, sizeProd1,
								sizeProd2, sizeProd3, colorProd, condProd, idCate);
						System.out.println(newProduct.toString());
						productDAO.createNewProduct(newProduct);

						File file = new File(url);
						if (!file.exists()) {
							file.mkdir();
						}
						int index = Integer.parseInt(request.getParameter("index"));
						for (int i = index; i < 21; i++) {
							String m = String.valueOf(i % 7 + 1);
							String k = String.valueOf(i + 1);
							String input = "input-" + k;
							String img = "img" + m;
							System.out.println("nameInput :" + input + " | " + "nameImg :" + img);
							Part filePart = null;
							if (request.getPart(input) != null) {
								filePart = request.getPart(input);
								if (filePart.getSize() > 0) {
									OutputStream outputStream = new FileOutputStream(
											new File(url + "\\" + img + ".jpg"));
									if (filePart != null) {
										InputStream fileContent = filePart.getInputStream();
										IOUtils.copy(fileContent, outputStream);
									}
								}
							}
						}

					}
				}
				break;
			}
		}
		loadMyAccount(request, response, idMyAdmin);
	}

	private void updateItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));

		String item_id = request.getParameter("idItem");
		String item_name = request.getParameter("nameItem");
		Items tempItem = new Items(item_id, item_name);
		itemsDAO.updateItem(tempItem);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void updateCate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));

		int cate_id = Integer.parseInt(request.getParameter("idCate"));
		String item_id = request.getParameter("idItemByCate");
		String cate_name = request.getParameter("nameCate");
		String cate_img = request.getParameter("imgCate");
		Category tempCate = new Category(cate_id, item_id, cate_name, cate_img);
		categoryDAO.updateCate(tempCate);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void updateAccountUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));

		int user_id = Integer.parseInt(request.getParameter("idUser"));
		String user_name = request.getParameter("nameUser");
		String user_dob = request.getParameter("dobUser");
		String user_address = request.getParameter("addressUser");
		String user_email = request.getParameter("emailUser");
		String user_phone = request.getParameter("phoneUser");
		String user_pass = request.getParameter("passUser");
		String user_gender = request.getParameter("genderUser");

		Users tempUser = new Users(user_id, user_name, user_dob, user_address, user_email, user_phone, user_pass,
				user_gender);
		usersDAO.updateUser(tempUser);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void updateAccountAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int idMyAdmin = Integer.parseInt(request.getParameter("idMyAdmin"));
		System.out.println("updateAccountAdmin run......");
		int admin_id = Integer.parseInt(request.getParameter("idAdmin"));
		String admin_avatar = request.getParameter("avatarAdmin");
		String admin_name = request.getParameter("nameAdmin");
		String admin_email = request.getParameter("emailAdmin");
		String admin_pass = request.getParameter("passAdmin");

		Admins updatedAdmin = new Admins(admin_id, admin_name, admin_email, admin_pass, admin_avatar);
		System.out.println(updatedAdmin.toString());
		adminsDAO.updateAdmin(updatedAdmin);
		loadMyAccount(request, response, idMyAdmin);
	}

	private void checkLogin(HttpServletRequest request, HttpServletResponse response, String emailAdmin,
			String passAdmin) throws Exception {
		System.out.println("checkLogin run....");
		boolean checkLogin = false;
		List<Admins> admins = adminsDAO.getAdmin();

		for (Admins tempAdmin : admins) {
			if (emailAdmin.equals(tempAdmin.getAdmin_email()) && passAdmin.equals(tempAdmin.getAdmin_pass())) {
				checkLogin = true;
				int idAdmin = tempAdmin.getAdmin_id();
				HttpSession session = request.getSession();
				session.setAttribute("idAdmin", idAdmin);
				session.setAttribute("emailAdmin", emailAdmin);
				session.setAttribute("passAdmin", passAdmin);
				System.out.println("Email, pass, id của Admin đã đăng nhập:" + tempAdmin.getAdmin_email() + ", "
						+ tempAdmin.getAdmin_pass() + ", " + tempAdmin.getAdmin_id());
				loadMyAccount(request, response, idAdmin);
				break;
			}
		}
		if (checkLogin) {
			System.out.println("Login for admin success!!!");
		} else {
			System.out.println("Login for admin failed!!!");
			String checkFail = "error";
			HttpSession session = request.getSession();
			session.setAttribute("checkFail", checkFail);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/login-admin.jsp");
			dispatcher.forward(request, response);
		}
	}

}
