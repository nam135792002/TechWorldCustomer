package r2s.com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import r2s.com.dto.CategoryDTO;
import r2s.com.dto.ListProductDTO;
import r2s.com.dto.ProductDTO;
import r2s.com.models.CategoryEntity;
import r2s.com.models.PhotoProductEntity;
import r2s.com.models.ProductEntity;
import r2s.com.service.CategoryService;
import r2s.com.service.CookieService;
import r2s.com.service.PhotoProductService;
import r2s.com.service.ProductService;
import r2s.com.util.Constant;

@Controller
public class TechWorldController {
	
//	private final static Logger logger = Logger.getLogger(TechWorldController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private PhotoProductService photoService;
	
	@Autowired
	CookieService cookieService;
	
	@RequestMapping(value={"/","home"})
	ModelAndView home() {
		ModelAndView mv = new ModelAndView("TechWorld");
		List<CategoryEntity> categoryList = categoryService.findAll();
		
		List<ListProductDTO> listOfList = new ArrayList<>();
		for (CategoryEntity category : categoryList) {
			List<ProductEntity> listproduct = new ArrayList<>();
			listproduct = productService.findProductByCategory(category.getIdCategory());
			if(!listproduct.isEmpty()) {
				ListProductDTO listOfListProduct = new ListProductDTO();
				List<ProductDTO> listProductDTO = new ArrayList<>();
				listOfListProduct.setNameCate(category.getNameCategory());
				for (ProductEntity product : listproduct) {
					List<PhotoProductEntity> listPhotoAvatar = new ArrayList<>();
					listPhotoAvatar = photoService.findPhotoAvatar(product.getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
					ProductDTO productDTO = new ProductDTO();
					productDTO = productDTO.convertProductDTO(product);
					PhotoProductEntity photoProductEntity = listPhotoAvatar.get(0);
					productDTO.setBase64Image(photoProductEntity.getImage());
					listProductDTO.add(productDTO);
				}
				listOfListProduct.setProductDTOList(listProductDTO);
				listOfList.add(listOfListProduct);
			}
		}
		mv.addObject("listOfList", listOfList);
		
		List<CategoryDTO> cateDTODetailList = new ArrayList<>();
		for (CategoryEntity categoryEntityDetail : categoryList) {
			CategoryDTO cateDetail = new CategoryDTO();
			cateDetail = cateDetail.convertCategoryDTO(categoryEntityDetail);
			int count = productService.countProductsByCategoryId(cateDetail.getIdCategory());
			cateDetail.setCountCategory(count);
			List<ProductEntity> listproduct = new ArrayList<>();
			listproduct = productService.findProductByCategory(cateDetail.getIdCategory());
			List<PhotoProductEntity> listPhotoAvatar = new ArrayList<>();
			listPhotoAvatar = photoService.findPhotoAvatar(listproduct.get(0).getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
			PhotoProductEntity photoProductEntity = listPhotoAvatar.get(0);
			cateDetail.setBase64Image(photoProductEntity.getImage());
			cateDTODetailList.add(cateDetail);
		}
		mv.addObject("cateDTODetailList", cateDTODetailList);
		return mv;
		
	}
	
	@RequestMapping("/home/category")
	ModelAndView showAllCategory(@RequestParam("idCategory") int idCategory) {
		ModelAndView mv = new ModelAndView("CategoryProduct");
		//in4 of many products 
		List<ListProductDTO> listOfList = new ArrayList<>();
		//search in4 category according to idCategory
		Optional<CategoryEntity> categoryOptional = categoryService.findById(idCategory);
		//search list product according to id category
		List<ProductEntity> listproduct = new ArrayList<>();
		listproduct = productService.findProductByCategory(categoryOptional.get().getIdCategory());
		//check list product is empty, isn't?
		if(!listproduct.isEmpty()) {
			//one element ListProductDTO object in listOfList
			ListProductDTO listOfListProduct = new ListProductDTO();
			//list many products
			List<ProductDTO> listProductDTO = new ArrayList<>();
			//set name category of listOfListProduct object
			listOfListProduct.setNameCate(categoryOptional.get().getNameCategory());
			//copy from ProductEntity to ProductDTO
			for (ProductEntity product : listproduct) {
				//convert entity -> DTO
				ProductDTO productDTO = new ProductDTO();
				productDTO = productDTO.convertProductDTO(product);
				//search avatar of product
				List<PhotoProductEntity> listPhotoAvatar = new ArrayList<>();
				listPhotoAvatar = photoService.findPhotoAvatar(product.getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
				PhotoProductEntity photoProductEntity = listPhotoAvatar.get(0);
				productDTO.setBase64Image(photoProductEntity.getImage());
				listProductDTO.add(productDTO);
			}
			listOfListProduct.setProductDTOList(listProductDTO);
			listOfList.add(listOfListProduct);
		}
		mv.addObject("listOfList", listOfList);
		
		List<CategoryEntity> categoryList = categoryService.findAll();
		List<CategoryDTO> cateDTODetailList = new ArrayList<>();
		for (CategoryEntity categoryEntityDetail : categoryList) {
			CategoryDTO cateDetail = new CategoryDTO();
			cateDetail = cateDetail.convertCategoryDTO(categoryEntityDetail);
			int count = productService.countProductsByCategoryId(cateDetail.getIdCategory());
			cateDetail.setCountCategory(count);
			List<ProductEntity> listproductTmp = new ArrayList<>();
			listproductTmp = productService.findProductByCategory(cateDetail.getIdCategory());
			List<PhotoProductEntity> listPhotoAvatar = new ArrayList<>();
			listPhotoAvatar = photoService.findPhotoAvatar(listproductTmp.get(0).getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
			PhotoProductEntity photoProductEntity = listPhotoAvatar.get(0);
			cateDetail.setBase64Image(photoProductEntity.getImage());
			cateDTODetailList.add(cateDetail);
		}
		mv.addObject("cateDTODetailList", cateDTODetailList);
		return mv;
	}
	
	@RequestMapping("/home/category/arrange")
	ModelAndView showAllCategoryArrange(@RequestParam("key") String key, @RequestParam("category") String category) {
		ModelAndView mv = new ModelAndView("CategoryProduct");
		//in4 of many products 
		List<ListProductDTO> listOfList = new ArrayList<>();
		//search list product according to id category
		List<ProductEntity> listproduct = new ArrayList<>();
		if(key.equals("up")) {
			listproduct = productService.findProductsByCategoryIdOrderByUnitPriceDesc(category);
		}
		else if(key.equals("down")) {
			listproduct = productService.findProductsByCategoryIdOrderByUnitPriceAsc(category);
		}
		//check list product is empty, isn't?
		if(!listproduct.isEmpty()) {
			//one element ListProductDTO object in listOfList
			ListProductDTO listOfListProduct = new ListProductDTO();
			//list many products
			List<ProductDTO> listProductDTO = new ArrayList<>();
			//set name category of listOfListProduct object
			listOfListProduct.setNameCate(category);
			//copy from ProductEntity to ProductDTO
			for (ProductEntity product : listproduct) {
				//convert entity -> DTO
				ProductDTO productDTO = new ProductDTO();
				productDTO = productDTO.convertProductDTO(product);
				//search avatar of product
				List<PhotoProductEntity> listPhotoAvatar = new ArrayList<>();
				listPhotoAvatar = photoService.findPhotoAvatar(product.getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
				PhotoProductEntity photoProductEntity = listPhotoAvatar.get(0);
				productDTO.setBase64Image(photoProductEntity.getImage());
				listProductDTO.add(productDTO);
			}
			listOfListProduct.setProductDTOList(listProductDTO);
			listOfList.add(listOfListProduct);
		}
		mv.addObject("listOfList", listOfList);
		
		List<CategoryEntity> categoryList = categoryService.findAll();
		List<CategoryDTO> cateDTODetailList = new ArrayList<>();
		for (CategoryEntity categoryEntityDetail : categoryList) {
			CategoryDTO cateDetail = new CategoryDTO();
			cateDetail = cateDetail.convertCategoryDTO(categoryEntityDetail);
			int count = productService.countProductsByCategoryId(cateDetail.getIdCategory());
			cateDetail.setCountCategory(count);
			List<ProductEntity> listproductTmp = new ArrayList<>();
			listproductTmp = productService.findProductByCategory(cateDetail.getIdCategory());
			List<PhotoProductEntity> listPhotoAvatar = new ArrayList<>();
			listPhotoAvatar = photoService.findPhotoAvatar(listproductTmp.get(0).getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
			PhotoProductEntity photoProductEntity = listPhotoAvatar.get(0);
			cateDetail.setBase64Image(photoProductEntity.getImage());
			cateDTODetailList.add(cateDetail);
		}
		mv.addObject("cateDTODetailList", cateDTODetailList);
		return mv;
	}
	
	@PostMapping("/search")
	ModelAndView searchProduct(@RequestParam("search") String search) {
		ModelAndView mv = new ModelAndView("TechWorld");
		List<ListProductDTO> listOfList = new ArrayList<>();
		ListProductDTO listProDuctDTODetail = new ListProductDTO();
		listProDuctDTODetail.setNameCate("Result Searching");
		
		List<ProductDTO> listProductdto = new ArrayList<>();
		List<ProductEntity> listProduct = productService.searchProductsByName(search);
		if(!listProduct.isEmpty()) {
			for (ProductEntity productEntity : listProduct) {
				ProductDTO productdto = new ProductDTO();
				productdto = productdto.convertProductDTO(productEntity);
				List<PhotoProductEntity> avatar = photoService.findPhotoAvatar(productEntity.getIdProduct(),Constant.TYPE_IMAGE_AVATAR);
				productdto.setBase64Image(avatar.get(0).getImage());
				listProductdto.add(productdto);
			}
			
			listProDuctDTODetail.setProductDTOList(listProductdto);
			listOfList.add(listProDuctDTODetail);
		}
		mv.addObject("listOfList", listOfList);
		List<CategoryEntity> categoryList = categoryService.findAll();
		List<CategoryDTO> cateDTODetailList = new ArrayList<>();
		for (CategoryEntity categoryEntityDetail : categoryList) {
			CategoryDTO cateDetail = new CategoryDTO();
			cateDetail = cateDetail.convertCategoryDTO(categoryEntityDetail);
			int count = productService.countProductsByCategoryId(cateDetail.getIdCategory());
			cateDetail.setCountCategory(count);
			List<ProductEntity> listproductTmp = new ArrayList<>();
			listproductTmp = productService.findProductByCategory(cateDetail.getIdCategory());
			List<PhotoProductEntity> listPhotoAvatar = new ArrayList<>();
			listPhotoAvatar = photoService.findPhotoAvatar(listproductTmp.get(0).getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
			PhotoProductEntity photoProductEntity = listPhotoAvatar.get(0);
			cateDetail.setBase64Image(photoProductEntity.getImage());
			cateDTODetailList.add(cateDetail);
		}
		mv.addObject("cateDTODetailList", cateDTODetailList);
		return mv;
	}
	
	@RequestMapping("home/productDetail")
	ModelAndView productDetail(@RequestParam("idProduct") int idProduct) {
		ModelAndView mv = new ModelAndView("ProductDetail");
		Optional<ProductEntity> productEntity = productService.findById(idProduct);
		ProductDTO productDTO = new ProductDTO();
		productDTO = productDTO.convertProductDTO(productEntity.get());
		List<PhotoProductEntity> avatar = photoService.findPhotoAvatar(idProduct, Constant.TYPE_IMAGE_AVATAR);
		productDTO.setBase64Image(avatar.get(0).getImage());
		List<PhotoProductEntity> relateImageList = photoService.findPhotoAvatar(idProduct, Constant.TYPE_IMAGE_RELATE);
		List<String> listImageRelate = new ArrayList<>();
		for (PhotoProductEntity photoProductEntity : relateImageList) {
			listImageRelate.add(photoProductEntity.getImage());
		}
		productDTO.setBase64ListImage(listImageRelate);
		mv.addObject("productDTO",productDTO);
		
		List<ProductEntity> listProductEntity = productService.findProductByCategory(productDTO.getCategoryDTO().getIdCategory());
		List<ProductDTO> listProdutDTO =  new ArrayList<>();
		for (ProductEntity productEntity2 : listProductEntity) {
			ProductDTO productDTOs = new ProductDTO();
			productDTOs = productDTOs.convertProductDTO(productEntity2);
			List<PhotoProductEntity> avatarProduct = photoService.findPhotoAvatar(productDTOs.getIdProduct(), Constant.TYPE_IMAGE_AVATAR);
			productDTOs.setBase64Image(avatarProduct.get(0).getImage());
			listProdutDTO.add(productDTOs);
		}
		mv.addObject("listProdutDTO", listProdutDTO);
		
		Cookie favoTmp = cookieService.read("favo");
	    int count = 0;
		if(favoTmp!=null) {
			String ids = favoTmp.getValue();
			String[] mangPhanTu = ids.split(",");
			count = mangPhanTu.length;
			System.out.println(count);
		}
		
		
		return mv;
	}
}
