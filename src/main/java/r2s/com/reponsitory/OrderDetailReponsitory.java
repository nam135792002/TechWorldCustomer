package r2s.com.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import r2s.com.models.OrderDetailEntity;

@Repository
public interface OrderDetailReponsitory extends JpaRepository<OrderDetailEntity, Integer>{

}
