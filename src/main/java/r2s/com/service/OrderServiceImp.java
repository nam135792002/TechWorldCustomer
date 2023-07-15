package r2s.com.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import r2s.com.models.OrderEntity;
import r2s.com.reponsitory.OrderReponsitory;

@Service
public class OrderServiceImp implements OrderService{

	@Autowired
	OrderReponsitory orderReponsitory;

	@Override
	public OrderEntity save(OrderEntity orderEntity) {
		return orderReponsitory.save(orderEntity);
	}

	@Override
	public Optional<OrderEntity> findById(int id) {
		return orderReponsitory.findById(id);
	}
	
	
}
