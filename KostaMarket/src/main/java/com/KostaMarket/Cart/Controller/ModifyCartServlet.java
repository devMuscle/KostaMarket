package com.KostaMarket.Cart.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.KostaMarket.Cart.DAO.CartDAO;
import com.KostaMarket.Cart.vo.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ModifyCartServlet
 */
@WebServlet("/modifycart")
public class ModifyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("idInfo");
		
		String idValue = request.getParameter("id");
		String productCode = request.getParameter("productCode");
		String productCount = request.getParameter("productCount");
		
		CartDAO dao = new CartDAO();
		String path = "";
		
		dao.modifyCart(idValue, productCode, productCount); //modify() 메서드로 카트 정보 수정
		List<Cart> list = dao.cartList(); //cartList() 메서드로 카트 정보 조회
		List userCart = new ArrayList(); 
		
		for(int i = 0; i < list.size(); i++) {
			Cart cart = (Cart)list.get(i);
			String id = cart.getID();
			if(id.equals("userid")) {
				System.out.println(id);
				userCart.add(cart);
			} else {
				
			}
		}
		
		request.setAttribute("list", userCart);
		path = "cartlist.jsp";
		
		//VIEWER로 이동
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
		
	}

}
