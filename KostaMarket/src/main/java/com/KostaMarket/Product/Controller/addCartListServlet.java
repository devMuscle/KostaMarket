package com.KostaMarket.Product.Controller;

import java.io.IOException;

import com.KostaMarket.Product.DAO.ProductDAO;
import com.KostaMarket.Product.Service.ProductService;
import com.KostaMarket.Product.vo.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addCartList
 */
@WebServlet("/addCartList")
public class addCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addCartListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		ProductService productService = new ProductService();
		String id = request.getParameter("id");
		String productCode = request.getParameter("productCode");
		String productCount = request.getParameter("productCount");

		System.out.println("addCartList 전송 단계1");

		ProductDAO dao = new ProductDAO();
		System.out.println("DB작업 시작한다?");
		// dao addCartList DB작업
		try {
			dao.addCartListInfo(id, productCode, productCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * Product result = null; System.out.println("재접속띠");
		 * 
		 * try { result = productService.retrieveProductInfo(productCode); } catch
		 * (Exception e) { e.printStackTrace(); }
		 * 
		 * request.setAttribute("product", result); RequestDispatcher rd =
		 * request.getRequestDispatcher("DetailGoods.jsp");
		 * 
		 * rd.forward(request, response);
		 */

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
