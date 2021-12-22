package com.KostaMarket.Cart.Controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html;charset=utf-8");
//        PrintWriter out=response.getWriter();   
		
		//session으로 로그인한 아이디 값 받아오기
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		
		CartDAO dao = new CartDAO(); //SQL문으로 조회할 CartDAO 객체를 생성
		String path = "";
		        
		List<Cart> list = dao.cartList(); //cartList() 메서드로 카드 정보를 조회
		List<Cart> Clist = dao.customerlist(); //customerList() 메서드로 고객 정보를 조회
		List userCart = new ArrayList(); //jsp에 전송할 list 생성
		        
//		        out.print("<html><body>");
//		        out.print("<table  border=1><tr align='center' bgcolor='lightgreen'>");
//		        out.print("<td>카트번호</td><td>수량</td><td>아이디</td><td>상품코드</td>");
		
		//카트에 상품이 있는지 1차 확인
		if(list.isEmpty()) {
			System.out.println("비었어요");
		} else {
			System.out.println("안 비었어요");
		}
		
		//카트에 상품이 있는지 2차 확인
		try {
			//상품이 있으면 list에 고객+상품 정보 추가
			for(int i = 0; i < list.size(); i++) {
				Cart cart = (Cart)list.get(i);
				String id = cart.getID();
				System.out.println(id);
				if(id.equals("id2")) {
					System.out.println("성공");
					userCart.add(cart);
				} else {
					
				}
			}
			
			//상품이 없으면 list에 고객 정보 추가
			if(userCart.isEmpty()) {
				System.out.println("카트에 없어요. 고객 정보를 받아올게요.");
				for(int i = 0; i <Clist.size(); i++) {
					Cart Ccart = (Cart)Clist.get(i);
					String id = Ccart.getID();
					//System.out.println(id);
					if(id.equals("id2")) {
						userCart.add(Ccart);
					}
				}
			}
		} catch(NullPointerException e) {
			
		}
		
		
//		for(Cart c : Clist) {
//			System.out.println(c);
//		}
		
		request.setAttribute("list", userCart);
		path = "cartlist.jsp";
		
		//VIEWER로 이동
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
        
//		           for (int i=0; i<list.size();i++){
//		              Cart cart = (Cart) list.get(i);
//		              String cartCode = cart.getCartCode();
//		              int productCount = cart.getProductCount();
//		              String id = cart.getID();
//		              String productCode = cart.getProductCode();
//		              out.print("<tr><td>"+ cartCode +"</td><td>"+
//		                                  productCount +"</td><td>"+
//		                                  id +"</td><td>"+
//		                                  productCode +"</td><td>");        
//		            }// 조회한 회원 정보를 for문과 <tr> 태그를 이용해 리스트로 출력
//		            out.print("</table></body></html>");
    }
	
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
