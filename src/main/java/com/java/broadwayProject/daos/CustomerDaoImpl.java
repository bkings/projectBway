package com.java.broadwayProject.daos;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.broadwayProject.models.Customer;
import com.java.broadwayProject.models.DateTime;
import com.java.broadwayProject.models.Points;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void addCustomer(Customer c) {
		Session session=sessionFactory.getCurrentSession();
		session.save(c);
	}

	@Override
	public boolean validLogin(String email,String psw) {
		
		//System.out.println(email + " " + psw);
		
		Session session=sessionFactory.openSession();
		Criteria crt=session.createCriteria(Customer.class);
		crt.add(Restrictions.eq("email", email))
		   .add(Restrictions.eq("password", psw));
		
		Customer c=(Customer)crt.uniqueResult();
		
		//System.out.println(email + " " + psw);
		
		if(c!=null)
			return true;
		
		return false;
	}

	@Override
	public int getId(String email, String psw) {
		Session session=sessionFactory.openSession();
		Criteria crt=session.createCriteria(Customer.class);
		crt.add(Restrictions.eq("email", email))
		   .add(Restrictions.eq("password", psw));
		
		Customer c=(Customer)crt.uniqueResult();
		int id=c.getId();
		
		if(c!=null){
			return id;
		}
		return 0;
	}

	@Override
	@Transactional
	public Customer getById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Customer c=(Customer)session.get(Customer.class, id);
		return c;
	}

	@Override
	@Transactional
	public void updateCustomerTable(Customer c) {
		Session session=sessionFactory.getCurrentSession();
		session.update(c);
		
	}

	@Override
	@Transactional
	public void addDateTime(DateTime dt) {
		Session session=sessionFactory.getCurrentSession();
		session.save(dt);
		
	}

	@Override
	@Transactional
	public void updateDateTime(DateTime dt) {
		Session session=sessionFactory.getCurrentSession();
		session.update(dt);
		
	}
	
}
