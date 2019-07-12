package com.java.broadwayProject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.broadwayProject.daos.CustomerDao;
import com.java.broadwayProject.daos.PointsDao;
import com.java.broadwayProject.models.Customer;
import com.java.broadwayProject.models.Points;

@Controller
public class SignUpController {
	
	@Autowired
	private CustomerDao cdao;
	
	@Autowired
	private PointsDao pdao;
	
	@RequestMapping(value="/signup",method=RequestMethod.GET)
	public String signup(){
		return "signup";
	}
	
	@RequestMapping(value="/custsignup",method=RequestMethod.POST)
	public String customersignup(@ModelAttribute Customer c,Points p){
		
		int tenPts=10;
		p.setAccumulation(tenPts);
		p.setRewardLimitPoint(500);
		c.setNumberOflogIns(0);
		c.setCustomerPoints(p);
		pdao.addPoints(p);			// save transient instance before flushing bhanne error aako thyo. 
							// So before saving parent,child should be saved first in database OR Cascade=cascade.All garne Mapping ma ni feri.
		cdao.addCustomer(c);
		return "redirect:/login";			//To prevent duplicate form submission
	}
	
}
