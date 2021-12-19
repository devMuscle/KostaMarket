package com.KostaMarket.Product.Controller;

import java.io.IOException;

import com.KostaMarket.Product.Service.ProductService;
import com.KostaMarket.Product.vo.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DetailGoodsServlet
 */
@WebServlet("/detailgoods")
public class DetailGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String productCode = request.getParameter("product_code");
		Product result = null;
		System.out.println("접속띠");
		
		try {
			result = productService.retrieveProductInfo(productCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("product", result);
		RequestDispatcher rd = request.getRequestDispatcher("DetailGoods.jsp");
		
		rd.forward(request, response);
		
	}

}
