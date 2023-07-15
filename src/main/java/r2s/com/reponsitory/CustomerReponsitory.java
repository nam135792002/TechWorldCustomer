package r2s.com.reponsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import r2s.com.models.CustomerEntity;

@Repository
public interface CustomerReponsitory extends JpaRepository<CustomerEntity, Integer>{
	@Query(value = "SELECT uc FROM CustomerEntity uc WHERE uc.email = :email AND uc.password = :passWord")
	public List<CustomerEntity> findUseCaseByEmailAndPassword(@Param("email") String email, @Param("passWord") String passWord);
	
	@Query(value = "SELECT uc FROM CustomerEntity uc WHERE uc.email = :email")
	public List<CustomerEntity> findUseCaseByEmail(@Param("email") String email);
}
