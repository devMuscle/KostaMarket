package com.KostaMarket.Customer.Controller;

import java.io.IOException;

import com.KostaMarket.Customer.Service.CustomerService;
import com.KostaMarket.Customer.vo.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("./signup.jsp");
		rd.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idVal = request.getParameter("id");
		String pwVal = request.getParameter("password");
		String nameVal = request.getParameter("name");
		String emailVal = request.getParameter("email");
		String phoneVal = request.getParameter("phone");
		String zoneCodeVal = request.getParameter("zonecode");
		String addressVal = request.getParameter("address");
		String detailAddressVal = request.getParameter("detailAddress");
		String genderVal = request.getParameter("sex");
		String[] birth = request.getParameterValues("birthday");
		String year = birth[0];
		String mon = birth[1];
		String day = birth[2];
		String birthVal = year + mon + day;
		
		Customer customer = new Customer(idVal, pwVal, nameVal, zoneCodeVal, addressVal, detailAddressVal, genderVal, birthVal, phoneVal, emailVal, 0);
		
		CustomerService customerService = new CustomerService();
		customerService.singUp(customer);
	}

}
