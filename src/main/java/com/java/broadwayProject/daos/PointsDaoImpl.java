package com.java.broadwayProject.daos;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.broadwayProject.models.Points;

@Repository
public class PointsDaoImpl implements PointsDao {

	@Resource
	private SessionFactory sessionFactory;
	
	@Autowired
	private CustomerDao cdao;
	
	@Override
	@Transactional
	public void addPoints(Points p) {
		Session session = sessionFactory.openSession();
		session.save(p);
	}

	@Override
	public void getId() {
		
	}

	@Override
	public boolean checkAccumulation(Points p) {
		
		int value=p.getAccumulation();
		int x=50;
		Session session=sessionFactory.openSession();
		Criteria crt=session.createCriteria(Points.class);
		//crt.add(Restrictions.gt(x, value);
		return true;
		
	}

	@Override
	@Transactional
	public void update(Points p) {
		Session session=sessionFactory.getCurrentSession();
		session.update(p);
		
	}

}
