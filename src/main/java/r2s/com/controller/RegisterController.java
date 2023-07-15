package r2s.com.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import r2s.com.dto.CustomerDTO;
import r2s.com.dto.ProductDTO;
import r2s.com.models.CartItemEntity;
import r2s.com.models.CustomerEntity;
import r2s.com.models.ShoppingCartEntity;
import r2s.com.service.CartItemService;
import r2s.com.service.CartService;
import r2s.com.service.CustomerService;
import r2s.com.service.ShoppingCartService;

@Controller
public class RegisterController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	CartItemService cartItemService;
	
	@RequestMapping("/register")
	String register(HttpServletRequest request, HttpSession session) {
		String referer = request.getHeader("Referer");
	    session.setAttribute("redirectUrl", referer);
		return "Register";
	}
	
	@PostMapping("/register/save")
	String saveRegister(@ModelAttribute("newCustomer") CustomerDTO customerDTO,Authentication authentication,HttpSession session) {
		CustomerEntity customerEntity = new CustomerEntity();
		CustomerDTO customerDTO2 = new CustomerDTO();
		customerEntity = customerDTO2.convertCustomerEntity(customerDTO);
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
    	String encryptedPwd = bcrypt.encode(customerEntity.getPassword());
    	customerEntity.setPassword(encryptedPwd);
		customerEntity = customerService.save(customerEntity);
		session.setAttribute("customer", customerEntity);
		
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(customerEntity.getEmail(), customerEntity.getPassword(), null);
	    SecurityContextHolder.getContext().setAuthentication(auth);
	    
	    Collection<ProductDTO> ps = cartService.getItems();
	    ShoppingCartEntity cartEntity = new ShoppingCartEntity();
	    cartEntity.setCustomerEntity(customerEntity);
	    cartEntity = shoppingCartService.save(cartEntity);
	    for (ProductDTO productDTO : ps) {
	    	CartItemEntity cartItemEntity = new CartItemEntity();
	    	cartItemEntity.setShoppingCartEntity(cartEntity);
	    	cartItemEntity.setProductEntity(productDTO.convertProductEntity(productDTO));
	    	cartItemEntity.setQuantity(productDTO.getQuantity());
	    	cartItemService.save(cartItemEntity);
		}
	    
	    
	    String redirectUrl = (String) session.getAttribute("redirectUrl");
	    session.removeAttribute("redirectUrl");
	    if (redirectUrl != null && !redirectUrl.isEmpty()) {
	        return "redirect:" + redirectUrl;
	    } else {
	        return "redirect:/";
	    }
	}
}
