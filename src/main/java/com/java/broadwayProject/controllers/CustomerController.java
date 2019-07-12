package com.java.broadwayProject.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.broadwayProject.daos.CustomerDao;
import com.java.broadwayProject.models.Customer;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerDao cdao;

	@RequestMapping(value="/{id}/edit",method=RequestMethod.GET)
	public String editInfo(@PathVariable("id")int id, HttpSession session,Model model){
		if(session.getAttribute("allCustomerInfo")==null){
			return "login";
		}
		
		model.addAttribute("infoCustomer",cdao.getById(id));
		return "edit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String customerUpdate(@ModelAttribute Customer c){
		cdao.updateCustomerTable(c);
		System.out.println("This is from customer controller");
		return "home";
	}
	
	
}
