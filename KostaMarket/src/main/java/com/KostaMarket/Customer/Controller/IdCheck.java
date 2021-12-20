package com.KostaMarket.Customer.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONObject;

import com.KostaMarket.Customer.Service.CustomerService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IdCheck
 */
@WebServlet("/idcheck")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idVal = request.getParameter("id");
		System.out.println("입력받은 id : " + idVal);
		CustomerService service = new CustomerService();
		
		JSONObject json = new JSONObject();
	
		boolean result;
		
		try {
			result = service.idDupCheck(idVal);
			
			if(result == true) {
				System.out.println("중복된 아이디임");
				json.put("status", 0);
			}else {
				System.out.println("사용가능한 아이디임");
				json.put("status", 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		out.flush();
		
	}

}
