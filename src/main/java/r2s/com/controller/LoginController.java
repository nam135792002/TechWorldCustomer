package r2s.com.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import r2s.com.dto.ProductDTO;
import r2s.com.dto.UserDetailsDTO;
import r2s.com.models.CartItemEntity;
import r2s.com.models.CustomerEntity;
import r2s.com.models.ShoppingCartEntity;
import r2s.com.service.CartItemService;
import r2s.com.service.CartService;
import r2s.com.service.CustomerService;
import r2s.com.service.ShoppingCartService;

@Controller
public class LoginController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	CartItemService cartItemService;
	
	@RequestMapping("/login")
	String login(@RequestParam(value = "error",required = false) String error,HttpServletRequest request, HttpSession session) {
		String referer = request.getHeader("Referer");
	    session.setAttribute("redirectUrl", referer);
	    if (error != null) {
			request.setAttribute("status", "failed");
		}
		return "Login";
	}
	
	
	@RequestMapping("/loginSuccess")
	String loginSuccess(HttpServletRequest request, HttpSession session) {
		UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken) SecurityContextHolder
				.getContext().getAuthentication();

		CustomerEntity loggedInUser = ((UserDetailsDTO)authentication.getPrincipal()).getUser();
		session.setAttribute("customer", loggedInUser);
		String redirectUrl = (String) session.getAttribute("redirectUrl");
	    session.removeAttribute("redirectUrl");
	    
	    Collection<ProductDTO> ps = cartService.getItems();
	    List<ShoppingCartEntity> sc = shoppingCartService.findCartByCustomer(loggedInUser.getIdCustomer());
	    
	    if(!ps.isEmpty() && sc.isEmpty()) {
	    	ShoppingCartEntity cartEntity = new ShoppingCartEntity();
		    cartEntity.setCustomerEntity(loggedInUser);
		    cartEntity = shoppingCartService.save(cartEntity);
		    
		    for (ProductDTO productDTO : ps) {
		    	CartItemEntity cartItemEntity = new CartItemEntity();
		    	cartItemEntity.setShoppingCartEntity(cartEntity);
		    	cartItemEntity.setProductEntity(productDTO.convertProductEntity(productDTO));
		    	cartItemEntity.setQuantity(productDTO.getQuantity());
		    	cartItemService.save(cartItemEntity);
			}
	    }
	    if(ps.isEmpty() && !sc.isEmpty()) {
	    	List<CartItemEntity> listCart = cartItemService.findProductByCart(sc.get(0).getIdCartShopping());
	    	for (CartItemEntity cartItemEntity : listCart) {
				ProductDTO productDTOTmp = new ProductDTO();
				productDTOTmp = productDTOTmp.convertProductDTO(cartItemEntity.getProductEntity());
				productDTOTmp.setQuantity(cartItemEntity.getQuantity());
				cartService.addProduct(productDTOTmp);
			}
	    }
	    else if(!ps.isEmpty() && !sc.isEmpty()) {
	    	List<CartItemEntity> listCart = cartItemService.findProductByCart(sc.get(0).getIdCartShopping());
	    	for (CartItemEntity cartItemEntity : listCart) {
				ProductDTO productDTOTmp = new ProductDTO();
				productDTOTmp = productDTOTmp.convertProductDTO(cartItemEntity.getProductEntity());
				if(cartService.checkProductIsEmptyInMap(productDTOTmp.getIdProduct()))
				{
					productDTOTmp.setQuantity(cartItemEntity.getQuantity());
					cartService.addProduct(productDTOTmp);
				}
				else {
					cartService.add(productDTOTmp.getIdProduct());
				}
			}
	    	ShoppingCartEntity cartEntity = new ShoppingCartEntity();
	    	cartEntity.setIdCartShopping(sc.get(0).getIdCartShopping());
		    cartEntity.setCustomerEntity(loggedInUser);
		    shoppingCartService.save(cartEntity);
	    	Collection<ProductDTO> psTmp = cartService.getItems();
	    	cartItemService.deleteItemByCartid(sc.get(0).getIdCartShopping());
	    	for (ProductDTO productDTO : psTmp) {
		    	CartItemEntity cartItemEntity = new CartItemEntity();
		    	cartItemEntity.setShoppingCartEntity(sc.get(0));
		    	cartItemEntity.setProductEntity(productDTO.convertProductEntity(productDTO));
		    	cartItemEntity.setQuantity(productDTO.getQuantity());
		    	cartItemService.save(cartItemEntity);
			}
	    }
	    
	    if (redirectUrl != null && !redirectUrl.isEmpty()) {
	        return "redirect:" + redirectUrl;
	    } else {
	        return "redirect:/";
	    }
	}
}
