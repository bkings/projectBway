package com.java.broadwayProject.daos;

import com.java.broadwayProject.models.Customer;
import com.java.broadwayProject.models.DateTime;

public interface CustomerDao {

	public void addCustomer(Customer c);
	public boolean validLogin(String email,String psw);
	
	// yo duita "welcome,name" ko lagi banako basically!
	public int getId(String email,String psw);
	public Customer getById(int id);

	public void updateCustomerTable(Customer c);
	
	public void addDateTime(DateTime dt);
	public void updateDateTime(DateTime dt);
	
	
}
