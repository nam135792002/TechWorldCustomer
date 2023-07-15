package r2s.com.dto;

import r2s.com.models.CategoryEntity;

public class CategoryDTO {
	private int idCategory;
	private String codeCategory;
	private String nameCategory;
	private String base64Image;
	private int countCategory;
	
	public CategoryDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}

	public String getCodeCategory() {
		return codeCategory;
	}

	public void setCodeCategory(String codeCategory) {
		this.codeCategory = codeCategory;
	}

	public String getNameCategory() {
		return nameCategory;
	}

	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}
	
	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	public int getCountCategory() {
		return countCategory;
	}

	public void setCountCategory(int countCategory) {
		this.countCategory = countCategory;
	}

	@Override
	public String toString() {
		return "CategoryDTO [idCategory=" + idCategory + ", codeCategory=" + codeCategory + ", nameCategory="
				+ nameCategory + "]";
	}
	
	public CategoryDTO convertCategoryDTO(CategoryEntity categoryEntity) {
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setIdCategory(categoryEntity.getIdCategory());
	    categoryDTO.setCodeCategory(categoryEntity.getCodeCategory());
	    categoryDTO.setNameCategory(categoryEntity.getNameCategory());
	    return categoryDTO;
	}
	
	public CategoryEntity convertCategoryEntity(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = new CategoryEntity();
		categoryEntity.setIdCategory(categoryDTO.getIdCategory());
		categoryEntity.setCodeCategory(categoryDTO.getCodeCategory());
		categoryEntity.setNameCategory(categoryDTO.getNameCategory());
		return categoryEntity;
	}
	
}
