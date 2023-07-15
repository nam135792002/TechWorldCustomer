package r2s.com.dto;

import java.util.List;

public class ListProductDTO {
	private List<ProductDTO> productDTOList;
	private String nameCate;
	public ListProductDTO() {
		
	}
	public List<ProductDTO> getProductDTOList() {
		return productDTOList;
	}
	public void setProductDTOList(List<ProductDTO> productDTOList) {
		this.productDTOList = productDTOList;
	}
	public String getNameCate() {
		return nameCate;
	}
	public void setNameCate(String nameCate) {
		this.nameCate = nameCate;
	}
	
}
