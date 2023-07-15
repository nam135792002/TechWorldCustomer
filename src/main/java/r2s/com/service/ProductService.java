package r2s.com.service;

import java.util.List;
import java.util.Optional;

import r2s.com.models.ProductEntity;

public interface ProductService {
	ProductEntity save(ProductEntity product);
	List<ProductEntity> findAll();
	Long count();
	Optional<ProductEntity> findById(int id);
	void deleteById(int id);
	void deleteProductByCategory(int idCategory);
	List<ProductEntity> findProductByCategory(int idCategory);
	int countProductsByCategoryId(int categoryId);
	List<ProductEntity> searchProductsByName(String productName);
	List<ProductEntity> findProductsByCategoryIdOrderByUnitPriceDesc(String nameCategory);
	List<ProductEntity> findProductsByCategoryIdOrderByUnitPriceAsc(String nameCategory);
}
