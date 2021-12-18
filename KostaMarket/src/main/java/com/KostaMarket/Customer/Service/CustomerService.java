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
}
