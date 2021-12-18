package com.KostaMarket.Customer.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.KostaMarket.Common.MyConnection;
import com.KostaMarket.Customer.vo.Customer;

public class CustomerRepository {
	public void add(Customer customer) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertSQL = "INSERT INTO customer(id, birthday, detail_address, email, gender, member_ship_point, name, phone, pw, road_address, zone_code) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		//1.JDBC드라이버(*주의:ojdb8.jar파일을 buildpath에 추가), 2.DB연결
		try {
			con = MyConnection.getConnection(); //Connection : DB연결
			pstmt = con.prepareStatement(insertSQL); //PrepatedStatement : SQL송신
			
			pstmt.setString(1, customer.getId());
			pstmt.setString(2, customer.getBirthday());
			pstmt.setString(3, customer.getDetailAddress());
			pstmt.setString(4, customer.getEmail());
			pstmt.setString(5, customer.getGender());
			pstmt.setInt(6, customer.getMemberShipPoint());
			pstmt.setString(7, customer.getName());
			pstmt.setString(8, customer.getPhone());
			pstmt.setString(9, customer.getPw());
			pstmt.setString(10, customer.getRoadAddress());
			pstmt.setString(11, customer.getZoneCode());
			
			pstmt.executeUpdate(); //바인드변수 setting 후 DB로 송신
		} catch (SQLException e) {
			//ID가 중복된 경우(PK위배)에는 오라클오류번호1번이 발생한다
			int errorCode = e.getErrorCode();
			if(errorCode == 1) {
				throw new Exception("이미 존재하는 아이디입니다");
			}else {
				e.printStackTrace();
				throw new Exception(e.getMessage());
			}
		}finally {
			MyConnection.close(pstmt, con);
		}
	}
}
