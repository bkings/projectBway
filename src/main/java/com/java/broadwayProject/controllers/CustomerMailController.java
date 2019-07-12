package com.java.broadwayProject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.broadwayProject.models.Customer;

@Controller
public class CustomerMailController {

	public void sendMail(Customer c){		
		String to=c.getEmail();
		
		System.out.println("From mail controller " + to);
		
		String subject="AafnaiSuperMarket congratulates you on your achievement!";
		String msg="Thankyou for being a part of our family.It has been wonderful serving you."
				+ "Visit AafnaiSuperMarket to claim your prize. Happy Shopping!!";
		
		MyMailer.send(to, subject, msg);
		
	}
	
}
