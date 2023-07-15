package r2s.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import r2s.com.models.OrderDetailEntity;
import r2s.com.reponsitory.OrderDetailReponsitory;

@Service
public class OrderDetailServiceImp implements OrderDetailService{
	
	@Autowired
	OrderDetailReponsitory orderDetailReponsitory;

	@Override
	public OrderDetailEntity save(OrderDetailEntity orderDetailEntity) {
		return orderDetailReponsitory.save(orderDetailEntity);
	}
	
	
}
