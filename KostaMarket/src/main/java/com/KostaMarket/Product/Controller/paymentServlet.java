package com.KostaMarket.Product.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.KostaMarket.Cart.DAO.CartDAO;
import com.KostaMarket.Cart.vo.Cart;
import com.KostaMarket.Order.DAO.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class paymentServlet
 */
@WebServlet("/payment")
public class paymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("idInfo");
		
		String[] order= request.getParameterValues("db");
		String idVal = request.getParameter("id");
		String point = request.getParameter("point");
		
		int point1 = 0;
		if(point != null) {
			point1 = Integer.parseInt(point);
		}
		
		if(idVal == null) {
			CartDAO dao = new CartDAO(); 
			String path = "";
			        
			List<Cart> list = dao.cartList();
			List userCart = new ArrayList();		       
			
			try {
				for(int i = 0; i < list.size(); i++) {
					Cart cart = (Cart)list.get(i);
					String id = cart.getID();
					if(id.equals(userid)) {
						System.out.println("성공");
						userCart.add(cart);
					} else {
						
					}
				}
			} catch(NullPointerException e) {
				
			}
			
			request.setAttribute("list", userCart);
			path = "payment.jsp";
			System.out.println("rnjrnrjr");
			
			//VIEWER로 이동
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		} else {
			OrderDAO dao = new OrderDAO();
			
			dao.orderGo(idVal, point1, order);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
