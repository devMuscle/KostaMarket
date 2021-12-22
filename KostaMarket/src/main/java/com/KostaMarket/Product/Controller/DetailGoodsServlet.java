package com.KostaMarket.Product.Controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class DetailGoodsServlet
 */
@WebServlet("/detailgoods")
public class DetailGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // 세션?
	ProductService productService = new ProductService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String productCode = request.getParameter("product_code");
		Product result = null;
		List<Product> result2 = null;
		int category = 0;
		System.out.println("서블릿 접속띠");

		ProductDAO dao = new ProductDAO();

		try {
			result = dao.retrieveProductInfo(productCode);

			category = result.getProductCategory();
			result2 = dao.relatedProduct(category);
			// result = productService.retrieveProductInfo(productCode);
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("product", result);
		request.setAttribute("list", result2);
		RequestDispatcher rd = request.getRequestDispatcher("DetailGoods.jsp");

		rd.forward(request, response);

	}

}
