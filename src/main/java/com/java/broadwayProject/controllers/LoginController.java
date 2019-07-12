package com.java.broadwayProject.controllers;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.broadwayProject.daos.CustomerDao;
import com.java.broadwayProject.daos.PointsDao;
import com.java.broadwayProject.models.Customer;
import com.java.broadwayProject.models.DateTime;
import com.java.broadwayProject.models.Points;

@Controller
public class LoginController {

	@Autowired
	private CustomerDao cdao;

	@Autowired
	private PointsDao pdao;

	@Autowired
	private CustomerMailController ccontrol;
		
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session,Model model) {
				
/*		if(session.getAttribute("allCustomerInfo")!=null){

			Customer customer = (Customer) session.getAttribute("allCustomerInfo");
			long difference = (Long) session.getAttribute("dateTimeDifference");

			model.addAttribute("customer", customer.getFname());
			model.addAttribute("customerLname",customer.getLname());
			model.addAttribute("datetimeDifference", difference);
			return "home";
		}
*/		
		return "login";
	}

	@RequestMapping(value = "/custlogin", method = RequestMethod.POST)
	public String customerlogin(@ModelAttribute Customer c, Model model, HttpSession session) {
		
		if (cdao.validLogin(c.getEmail(), c.getPassword())) {
			
			//session.setAttribute("customerEmail", c.getEmail());
			// session.setAttribute("customerInfo", c); //here c contains only
			// email and psw as a result of modelAttribute
			 
			int id = cdao.getId(c.getEmail(), c.getPassword());
			model.addAttribute("customerId",id);
			Customer customer = cdao.getById(id);
			session.setAttribute("customerInfo", customer);
			model.addAttribute("customer", customer.getFname());
			model.addAttribute("customerLname",customer.getLname());

			int countLogIns = customer.getNumberOflogIns();
			countLogIns++;
			customer.setNumberOflogIns(countLogIns);

			// -----------Date and Time------------------//
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			LocalDateTime currDateTime = getDateTime();
			String currentDateTime = currDateTime.format(dtf);
			
			//------------for Points----------------------//
			
			Points p = customer.getCustomerPoints();
			int checkAccumulation = p.getAccumulation();
			int rewardLimitPoint = p.getRewardLimitPoint();
			
			System.out.println(checkAccumulation);
			System.out.println(rewardLimitPoint);
			System.out.println(customer.getEmail());

			if (firstLogin(countLogIns)) { 									// checks if its user's first Login
				long difference=5;											// during first login,there is no previous reference date and time.
				DateTime dt = new DateTime(); 								// new object created because
																			// initially datetime is null.
				dt.setLoginDateTime(currentDateTime);
				cdao.addDateTime(dt);										// add for the first time
				customer.setDateTime(dt);
				int collection=addPoints(checkAccumulation); 				// add if first login
				p.setAccumulation(collection);
				pdao.update(p);
				session.setAttribute("dateTimeDifference", difference);		// due to if else condition this session is necessary.
				session.setAttribute("currentPoint", collection);			// to retrieve at home
			} else {

				// Check date and time
				
				DateTime dte = customer.getDateTime(); 						// to retrieve the corresponding id of the customer
				String dbDateTime = dte.getLoginDateTime();
				LocalDateTime dBDateTime = LocalDateTime.parse(dbDateTime, dtf);

				System.out.println(dbDateTime);
				System.out.println(dBDateTime);

				Duration duration = Duration.between(currDateTime, dBDateTime);

				System.out.println(duration);

				long difference = Math.abs(duration.toMinutes());
				System.out.println(difference);

				if (difference >= 5) {
					System.out.println("Access to points granted");
					dte.setLoginDateTime(currentDateTime);
					cdao.updateDateTime(dte);								// after adding date and time just
																			// update those fields.
					int collection=addPoints(checkAccumulation);			// add only if 24 hr crossed
					System.out.println(collection);
					p.setAccumulation(collection);
					pdao.update(p);
					session.setAttribute("currentPoint", collection);

				} else {
					System.out.println("Go to hell");
					session.setAttribute("currentPoint", checkAccumulation);
				}
				
				customer.setDateTime(dte);
				model.addAttribute("datetimeDifference", difference);
				session.setAttribute("dateTimeDifference", difference);	
			}
			
			cdao.updateCustomerTable(customer);
			
			//check points for reward
			//we need updated table otherwise when points reach 510 from 460, reward will not be given.
			
			int id_again = cdao.getId(c.getEmail(), c.getPassword());
			Customer customer_again = cdao.getById(id_again);
			int updatedPointLimit = checkForReward(customer_again,rewardLimitPoint);
			p.setRewardLimitPoint(updatedPointLimit);
			pdao.update(p);		//after point limit changes
			
			session.setAttribute("allCustomerInfo", customer);
//			session.setMaxInactiveInterval(5);
			return "home";
		}
		
			return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String customerlogout(HttpSession session) {
		session.invalidate();
		//return "redirect:/login"; 											// trying to avoid form resubmission.
		return "login";
	}
	
	public int checkForReward(Customer c,int rewardLimitPoint){
		if(c.getCustomerPoints().getAccumulation()>= rewardLimitPoint){
			System.out.println("Reward granted !!! Yippieeee");
			ccontrol.sendMail(c);
			rewardLimitPoint = rewardLimitPoint + 500;
			return rewardLimitPoint;
		}else{
			System.out.println("Visit a few more times");
			return rewardLimitPoint;
		}
	}

	public boolean firstLogin(int countLogIns) {

		if (countLogIns == 1) {
			return true;
		}
		return false;
	}

	public LocalDateTime getDateTime() {
		LocalDateTime cdt = LocalDateTime.now();
		return cdt;
	}
	
	public int addPoints(int checkAccumulation){
		int collection = 50;
		if (checkAccumulation >= 10) {
			collection = collection + checkAccumulation;
		}
		return collection;
	}
	
	@RequestMapping(value="/tosessionIndex",method=RequestMethod.GET)
	public String sessionIndex(HttpSession session,Model model){
		
		if(session.getAttribute("allCustomerInfo")==null){
			return "login";
		}
		
		Customer c = (Customer) session.getAttribute("customerInfo");
		String fname = c.getFname();
		model.addAttribute("fname",fname);
		return "sessionIndex";
	}

}
