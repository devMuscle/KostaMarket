package com.KostaMarket.Customer.Service;

import com.KostaMarket.Customer.Repository.CustomerRepository;
import com.KostaMarket.Customer.vo.Customer;

public class CustomerService {
	CustomerRepository customerRepository = new CustomerRepository();

	public void singUp(Customer customer) {
		try {
			customerRepository.add(customer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean idDupCheck(String idVal) throws Exception {
		boolean result = customerRepository.idCheck(idVal);
		return result;
	}

	public boolean emailCheck(String emailVal) throws Exception {
		boolean result = customerRepository.emailCheck(emailVal);
		return result;
	}

	public String login(String id, String pw) throws Exception {
		try {
			String nameVal = customerRepository.login(id, pw);
			if (nameVal != null) {
				return nameVal;
			}
			throw new Exception();
		} catch (Exception e) {
			throw new Exception("아이디 또는 비밀번호 오류입니다");
		}

	}

}
