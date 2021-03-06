package com.KostaMarket.Product.Controller;

import java.io.IOException;
import java.util.List;

import com.KostaMarket.Category.DAO.CategoryDAO;
import com.KostaMarket.Product.vo.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productCode = request.getParameter("productCode");
		

		String splitProductCode = productCode.substring(0,1);
		System.out.println(splitProductCode);						//한글자 짜르기

		CategoryDAO dao = new CategoryDAO(); 
		String path = "";
		List<Product> list;
		System.out.println("test용: "+ productCode.length());					//테스트용
		//if(productCode == null || productCode.equals("") || productCode.equals("all")) {

		if(productCode.length() == 1) {
			list = dao.categoryList(productCode); 
		} else if(productCode.equals("sale")) {
			list = dao.saleList(); 
		} else if(productCode.equals("best")) {
			list = dao.bestList(); 
		} else if(productCode.equals("new")) {
			list = dao.newList(); 
		} else {
			list = dao.detailCategoryList(productCode); 			
		}		
		request.setAttribute("list", list);
		path = "categoryresult.jsp";
		
		//VIEWER로 이동
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
