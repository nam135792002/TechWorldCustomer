package r2s.com.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import r2s.com.dto.ProductDTO;
import r2s.com.models.PhotoProductEntity;
import r2s.com.models.ProductEntity;
import r2s.com.util.Constant;

@SessionScope // scopedTarget.cartService
@Service
public class CartService {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	PhotoProductService photoProductService;
	
	Map<Integer, ProductDTO> map = new HashMap<>();
	
	public void add(Integer id) {
		ProductDTO p = new ProductDTO();
		p = map.get(id);
		if(p == null) {
			Optional<ProductEntity> productOptional = productService.findById(id);
			ProductDTO pdto = new ProductDTO();
			p = pdto.convertProductDTO(productOptional.get());
			List<PhotoProductEntity> photo = photoProductService.findPhotoAvatar(p.getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
			p.setBase64Image(photo.get(0).getImage());
			p.setQuantity(1);
			map.put(id, p);
		}
		else if(p != null && p.getQuantity() < 3) {
			p.setQuantity(p.getQuantity()+1);
		}
	}
	
	public void addProduct(ProductDTO product) {
		List<PhotoProductEntity> photo = photoProductService.findPhotoAvatar(product.getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
		product.setBase64Image(photo.get(0).getImage());
		map.put(product.getIdProduct(), product);
	}
	
	public boolean checkProductIsEmptyInMap(Integer id) {
		ProductDTO p = new ProductDTO();
		p = map.get(id);
		if(p == null) return true;
		return false;
	}
	
	public void remove(Integer id) {
		map.remove(id);
	}
	
	public void update(Integer id, int quantity) {
		ProductDTO p = map.get(id);
		p.setQuantity(quantity);
	}
	
	public void clear() {
		map.clear();
	}
	
	public Integer getCount() {
		Collection<ProductDTO> ps = this.getItems();
		Integer count = ps.size();
		return count;
	}
	
	public Integer getAmount() {
		Collection<ProductDTO> ps = this.getItems();
		Integer amount = 0;
		for (ProductDTO productDTO : ps) {
			amount += (productDTO.getQuantity()*productDTO.getUnitPrice());
		}
		return amount;
	}
	
	public Collection<ProductDTO> getItems(){
		return map.values();
	}
}
