package r2s.com.service;

import java.util.Optional;

import r2s.com.models.OrderEntity;

public interface OrderService {
	OrderEntity save(OrderEntity orderEntity);
	Optional<OrderEntity> findById(int id);
}
