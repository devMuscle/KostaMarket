package com.KostaMarket.Customer.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONObject;

import com.KostaMarket.Customer.Service.CustomerService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idVal = request.getParameter("id");
		String pwVal = request.getParameter("pwd");

		String nameVal = null;

		JSONObject json = new JSONObject();
		CustomerService customerService = new CustomerService();
		HttpSession session = request.getSession();

		try {
			nameVal = customerService.login(idVal, pwVal);

			if (nameVal != null) {
				System.out.println(nameVal + " 님 로그인 성공");
				json.put("status", 1);
				json.put("name", nameVal);
				session.setAttribute("loginName", nameVal);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			json.put("status", 0);
		}

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		out.flush();

	}
}
