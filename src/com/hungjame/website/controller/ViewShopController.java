package com.hungjame.website.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.hungjame.website.dao.BillDAO;
import com.hungjame.website.dao.CartDAO;
import com.hungjame.website.dao.CategoryDAO;
import com.hungjame.website.dao.ProductDAO;
import com.hungjame.website.dao.UsersDAO;
import com.hungjame.website.dao.WishlistDAO;
import com.hungjame.website.model.Bill;
import com.hungjame.website.model.Cart;
import com.hungjame.website.model.Category;
import com.hungjame.website.model.ListOfListBill;
import com.hungjame.website.model.ListOfListProduct;
import com.hungjame.website.model.Product;
import com.hungjame.website.model.ProductCart;
import com.hungjame.website.model.Users;

/**
 * Servlet implementation class ViewShopController
 */
@WebServlet(name = "ViewShopController", urlPatterns = { "/jameshop" })
public class ViewShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	private CategoryDAO categoryDAO;
	private UsersDAO usersDAO;
	private CartDAO cartDAO;
	private BillDAO billDAO;
	private WishlistDAO wishlistDAO;

	@Resource(name = "jdbc/shopproject")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();

		// create our product db util ... and pass in the conn pool / datasource
		try {
			billDAO = new BillDAO(dataSource);
			productDAO = new ProductDAO(dataSource);
			categoryDAO = new CategoryDAO(dataSource);
			usersDAO = new UsersDAO(dataSource);
			cartDAO = new CartDAO(dataSource);
			wishlistDAO = new WishlistDAO(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewShopController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			String theCommand = request.getParameter("command");
			System.out.println("command got: " + theCommand);
			if (theCommand == null) {
				theCommand = "LOADPRODUCTBYCATE";
			}
			switch (theCommand) {
			case "VIEWLISTPRODUCT":
				viewProduct(request, response);
				break;
			case "LOADPRODUCTBYCATE":
				viewProductByCate(request, response);
				break;
			case "LOGOUTUSER":
				logOutUser(request, response);
				break;
			case "LOADDETAILPRODUCT":
				viewCategory(request, response);
				break;
			case "VIEWMEMBERSHIP":
				viewCategory(request, response);
				break;
			case "VIEWCOLLECTION":
				viewCategory(request, response);
				break;
			case "DELETECART":
				viewCategory(request, response);
				break;
			case "VIEWMYCART":
				viewCategory(request, response);
				break;
			case "VIEWMYACCOUNT":
				viewCategory(request, response);
				break;
			case "VIEWMYBILL":
				viewCategory(request, response);
				break;
			case "SEARCHPRODUCT":
				viewCategory(request, response);
				break;
			case "VIEWBYCATE":
				viewCategory(request, response);
				break;
			case "VIEWBYITEM":
				viewCategory(request, response);
				break;
			default:
				viewProduct(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String emailUser = request.getParameter("emailUser");
		String passUser = request.getParameter("passUser");
		try {
			String theCommand = request.getParameter("command");
			if (theCommand == null) {
				theCommand = "CREATEUSER";
			}
			switch (theCommand) {
			case "CREATEUSER":
				createNewUser(request, response);
				break;
			case "CHECKLOGINUSER":
				checkLoginUser(request, response, emailUser, passUser);
				break;
			case "ADDTOCART":
				viewCategory(request, response);
				break;
			case "UPDATECART":
				viewCategory(request, response);
				break;
			case "UPDATEMYACCOUNT":
				viewCategory(request, response);
				break;
			case "ORDERCART":
				viewCategory(request, response);
				break;
			case "ADDWISHLIST":
				viewCategory(request, response);
				break;
			case "DELETEWISHLIST":
				viewCategory(request, response);
				break;
			case "GETIDLIST":
				viewCategory(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void viewProductByCate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListProduct> listOfListProduct = productDAO.getListOfListProduct();
		request.setAttribute("PRODUCTS_BY_CATE", listOfListProduct);
		System.out.println("viewProductByCate run....");
		viewProduct(request, response);
	}

	private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// list product by item
		List<Product> products_shoe = productDAO.getProductByItem("IT1");
		List<Product> products_bag = productDAO.getProductByItem("IT2");
		List<Product> products_jewelry = productDAO.getProductByItem("IT3");

		request.setAttribute("PRODUCTS_SHOE", products_shoe);
		request.setAttribute("PRODUCTS_BAG", products_bag);
		request.setAttribute("PRODUCTS_JEWELRY", products_jewelry);

		// list category by item
		List<Category> categorys_shoe = categoryDAO.getCategory("IT1");
		List<Category> categorys_bag = categoryDAO.getCategory("IT2");
		List<Category> categorys_jewelry = categoryDAO.getCategory("IT3");

		request.setAttribute("CATEGORY_SHOE", categorys_shoe);
		request.setAttribute("CATEGORY_BAG", categorys_bag);
		request.setAttribute("CATEGORY_JEWELRY", categorys_jewelry);

		System.out.println("viewProductByItem run....");
		// send to JSP page(view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

	private void viewMyAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int userID = Integer.parseInt(request.getParameter("userID"));
		Users tempUser = usersDAO.getDetailUser(userID);
		request.setAttribute("TEMP_USER", tempUser);
		viewMyBill(request, response);
	}

	private void viewMyBill(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int userID = Integer.parseInt(request.getParameter("userID"));
		List<ListOfListBill> ListOfListBill = billDAO.getListOfListBill(userID);
		request.setAttribute("LIST_OF_LIST_BILL", ListOfListBill);
		System.out.println("viewMyBill");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/account.jsp");
		dispatcher.forward(request, response);
	}

	private void viewCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("viewCategory run...");
		List<Category> categorys_shoe = categoryDAO.getCategory("IT1");
		List<Category> categorys_bag = categoryDAO.getCategory("IT2");
		List<Category> categorys_jewelry = categoryDAO.getCategory("IT3");
		request.setAttribute("CATEGORY_SHOE", categorys_shoe);
		request.setAttribute("CATEGORY_BAG", categorys_bag);
		request.setAttribute("CATEGORY_JEWELRY", categorys_jewelry);
		String theCommand = request.getParameter("command");
		System.out.println("viewCategory: command got: " + theCommand);
		switch (theCommand) {
		case "LOADDETAILPRODUCT":
			loadDetailProduct(request, response);
			break;
		case "ADDTOCART":
			addToCart(request, response);
			break;
		case "VIEWMEMBERSHIP":
			System.out.println("ViewMembership run...");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/membership.jsp");
			dispatcher.forward(request, response);
			break;
		case "VIEWCOLLECTION":
			RequestDispatcher dispatcher_two = request.getRequestDispatcher("/collection.jsp");
			dispatcher_two.forward(request, response);
			break;
		case "DELETECART":
			deleteCart(request, response);
			break;
		case "VIEWMYCART":
			viewCart(request, response);
			break;
		case "VIEWMYACCOUNT":
			viewMyAccount(request, response);
			break;
		case "VIEWMYBILL":
			viewMyBill(request, response);
			break;
		case "UPDATEMYACCOUNT":
			updateMyAccount(request, response);
			break;
		case "UPDATECART":
			updateCart(request, response);
			break;
		case "ORDERCART":
			orderCart(request, response);
			break;
		case "SEARCHPRODUCT":
			searchProduct(request, response);
			break;
		case "VIEWBYCATE":
			viewByCate(request, response);
			break;
		case "VIEWBYITEM":
			viewByItem(request, response);
			break;
		case "ADDWISHLIST":
			addWishlist(request, response);
			break;
		case "DELETEWISHLIST":
			deleteWishlist(request, response);
			break;
		case "GETIDLIST":
			getIdlistForAjax(request, response);
			break;
		}
	}

	private void deleteWishlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int iduser = Integer.parseInt(request.getParameter("iduser"));
		String idproduct = request.getParameter("idproduct");
		wishlistDAO.deleteWishlist(iduser, idproduct);
	}

	private void addWishlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int iduser = Integer.parseInt(request.getParameter("iduser"));
		String idproduct = request.getParameter("idproduct");
		wishlistDAO.createWishlist(iduser, idproduct);
	}

	private void getIdlistForAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("-------------getIdlistForAjax---------------run");
		int iduser = -1;
		if (!request.getParameter("iduser").equals("null")) {
			iduser = Integer.parseInt(request.getParameter("iduser"));
		}
		if (iduser != -1) {
			String listIdProd = wishlistDAO.getIdProduct(iduser);

			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(listIdProd);
		}

	}

	private void viewByItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String itemName = request.getParameter("itemName");
		System.out.println("viewByItem run...");
		request.setAttribute("nameSelect", itemName);
		String itemId = request.getParameter("itemId");
		List<Product> tempProduct = productDAO.getAllProductByItem(itemId);
		request.setAttribute("TEMP_PRODUCT", tempProduct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/product.jsp");
		dispatcher.forward(request, response);
	}

	private void viewByCate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cateName = request.getParameter("cateName");
		System.out.println("viewByCate run...");
		request.setAttribute("nameSelect", cateName);
		int cateID = Integer.parseInt(request.getParameter("cateID"));
		List<Product> tempProduct = productDAO.getAllProductByCate(cateID);
		request.setAttribute("TEMP_PRODUCT", tempProduct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/product.jsp");
		dispatcher.forward(request, response);
	}

	private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String inputSearch = request.getParameter("inputSearch");
		request.setAttribute("inputSearch", inputSearch);
		List<Product> listProduct = productDAO.searchProduct(inputSearch);
		request.setAttribute("TEMP_PRODUCT", listProduct);
		System.out.println("searchProduct run...");
		boolean check = false;
		for (Product tempProduct : listProduct) {
			if (tempProduct != null) {
				check = true;
			}
			break;
		}
		if (check) {
			System.out.println("search.jsp run...");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/search.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("error.jsp run...");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void updateMyAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		viewMyAccount(request, response);
	}

	private void logOutUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("logOutUser run....");
		request.getSession().invalidate();
		System.out.println("Logout Success!!!");
		viewProductByCate(request, response);

	}

	private void checkLoginUser(HttpServletRequest request, HttpServletResponse response, String emailUser,
			String passUser) throws Exception {

		boolean check = false;
		List<Users> users = usersDAO.getUsers();

		for (Users checkUser : users) {
			if ((emailUser.equals(checkUser.getUser_email())) && (passUser.equals(checkUser.getUser_pass()))) {
				System.out.println("Email , Pass , ID của User: " + checkUser.getUser_email() + " , "
						+ checkUser.getUser_pass() + " , " + checkUser.getUser_id());
				int idUser = checkUser.getUser_id();
				HttpSession session = request.getSession();
				session.setAttribute("emailUser", emailUser);
				session.setAttribute("passUser", passUser);
				session.setAttribute("idUser", idUser);
				check = true;
				break;
			}
		}
		if (check) {
			System.out.println("Login success!!!");
			viewProductByCate(request, response);
		} else {
			String checkFail = "errorLogin";
			HttpSession session = request.getSession();
			session.setAttribute("checkFail", checkFail);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
			System.out.println("Login Failed!!!");
		}
	}

	private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String user_name = request.getParameter("nameUser");
		String user_dob = request.getParameter("dobUser");
		String user_address = request.getParameter("addressUser");
		String user_gender = request.getParameter("genderUser");
		String user_phone = request.getParameter("phoneUser");
		String user_email = request.getParameter("emailUser");
		String user_pass = request.getParameter("passUser");

		Users newUser = new Users(user_name, user_dob, user_address, user_email, user_phone, user_pass, user_gender);
		usersDAO.createNewUser(newUser);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);

		System.out.println("createNewUser run....");
	}

	private void loadDetailProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String productId = request.getParameter("productId");
		Product tempProduct = ProductDAO.getDetailProduct(productId);
		request.setAttribute("TEMP_PRODUCT", tempProduct);
		viewProductSuggestion(request, response);
		System.out.println("loadDetailProduct run...");
	}

	private void viewProductSuggestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cateId = Integer.parseInt(request.getParameter("cateId"));
		System.out.println("Tên loại sản phẩm:" + cateId);
		List<Product> productSuggestion = productDAO.getProductByCate(cateId, 4);
		request.setAttribute("TEMP_PRODUCT_BY_CATE", productSuggestion);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/detail-product.jsp");
		dispatcher.forward(request, response);
		System.out.println("viewProductSuggestion run...");
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productID = request.getParameter("productID");
		int userID = Integer.parseInt(request.getParameter("userID"));
		int productSize = Integer.parseInt(request.getParameter("productSize"));
		int productTotal = 1;
		Cart newCart = new Cart(userID, productID, productSize, productTotal);
		System.out.println("New Cart (userID, productID, productSize, productTotal) :" + newCart.toString());
		cartDAO.createNewCart(newCart);
		System.out.println("addToCart run....");
		viewCart(request, response);
	}

	private void updateCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int userID = Integer.parseInt(request.getParameter("userID"));
		List<ProductCart> listCart = cartDAO.viewCate(userID);
		for (ProductCart tempProductCart : listCart) {
			int prodAmount = Integer.parseInt(request.getParameter("prodAmount-" + tempProductCart.getCart_id()));
			cartDAO.updateCart(tempProductCart.getCart_id(), prodAmount);
		}
		viewCart(request, response);
	}

	private void viewCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int userID = Integer.parseInt(request.getParameter("userID"));
		List<ProductCart> tempCart = cartDAO.viewCate(userID);
		String cartIsEmpty = "true";
		for (ProductCart tempCartx : tempCart) {
			if (tempCartx != null) {
				cartIsEmpty = "false";
				break;
			}
		}
		request.setAttribute("CART_EMPTY", cartIsEmpty);
		request.setAttribute("TEMP_CART", tempCart);
		System.out.println("viewCart run....");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cart.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cartID = Integer.parseInt(request.getParameter("cartID"));
		cartDAO.deleteCart(cartID);
		viewCart(request, response);
	}

	private void orderCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("orderCart run...");
		int userID = Integer.parseInt(request.getParameter("userID"));
		int totalBill  = Integer.parseInt(request.getParameter("billTotal"));
		String billTotal = String.format("%,d", totalBill);
		List<ProductCart> listCart = cartDAO.viewCate(userID);
		String ID = request.getParameter("ID");
		String billOfUser = "DH"+ String.valueOf(userID) + ID;
		System.out.println("orderCart run...");
		for (ProductCart tempProductCart : listCart) {
			int prodAmount = Integer.parseInt(request.getParameter("prodAmount-" + tempProductCart.getCart_id()));
			int prodSize = Integer.parseInt(request.getParameter("prodSize-" + tempProductCart.getCart_id()));
			String prodId = request.getParameter("prodId-" + tempProductCart.getCart_id());
			String billStatus = request.getParameter("billStatus-" + tempProductCart.getCart_id());
			Bill tempBill = new Bill(billOfUser, userID, prodAmount, prodId, prodSize, billStatus, billTotal);
			billDAO.createNewBill(tempBill);
			System.out.println("createBill: " + tempBill.toString());
		}
		deleteAllCart(request, response);
	}

	private void deleteAllCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("deleteAllCart run...");
		int userID = Integer.parseInt(request.getParameter("userID"));
		cartDAO.deleteAllCart(userID);
		viewCart(request, response);
	}
}
