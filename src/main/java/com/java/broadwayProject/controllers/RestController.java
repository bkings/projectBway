package com.java.broadwayProject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.broadwayProject.daos.CustomerDao;
import com.java.broadwayProject.models.Customer;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("api/customer")
public class RestController {

	@Autowired
	private CustomerDao cdao;
	
	public ResponseEntity<List<Customer>> customerList(){
		
		
		return null;
	}
	
}
