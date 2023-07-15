package r2s.com.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import r2s.com.models.CartItemEntity;
import r2s.com.models.CustomerEntity;
import r2s.com.models.ProductEntity;
import r2s.com.models.ShoppingCartEntity;
import r2s.com.service.CartItemService;
import r2s.com.service.CartService;
import r2s.com.service.CookieService;
import r2s.com.service.CustomerService;
import r2s.com.service.ProductService;
import r2s.com.service.ShoppingCartService;

@Controller
@RequestMapping("api/cart/")
public class ShoppingCartController {
	
	@Autowired
	CartService cartService;
	@Autowired
	CustomerService customerService;
	@Autowired
	ShoppingCartService shoppingCartService;
	@Autowired
	CartItemService cartItemService;
	@Autowired
	ProductService productService;
	@Autowired
	CookieService cookieService;
	
	
	@RequestMapping(value = "add", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Integer add(@RequestParam("id") Integer id, HttpServletRequest request) {
		cartService.add(id);
		int count = cartService.getCount();
		HttpSession session = request.getSession();
		CustomerEntity customer = (CustomerEntity) session.getAttribute("customer");
		if(customer != null) {
			List<ShoppingCartEntity> listCart = shoppingCartService.findCartByCustomer(customer.getIdCustomer());
			ShoppingCartEntity cartEntity = new ShoppingCartEntity();
			CartItemEntity cartItemEntity = new CartItemEntity();
	    	
			if(listCart.isEmpty()) {
				cartEntity.setCustomerEntity(customer);
				cartEntity = shoppingCartService.save(cartEntity);
				cartItemEntity.setShoppingCartEntity(cartEntity);
			}
			else {
				cartItemEntity.setShoppingCartEntity(listCart.get(0));
			}
			List<CartItemEntity> cartListEntity = cartItemService.findItemByProductAndCart(cartItemEntity.getShoppingCartEntity().getIdCartShopping(), id);
			Optional<ProductEntity> productOptional = productService.findById(id);
	    	cartItemEntity.setProductEntity(productOptional.get());
			if(cartListEntity.isEmpty()) {
		    	cartItemEntity.setQuantity(1);
		    	cartItemService.save(cartItemEntity);
	    	}
	    	else if(!cartListEntity.isEmpty() && cartListEntity.get(0).getQuantity() < 3) {
	    		cartItemEntity.setIdCartItem(cartListEntity.get(0).getIdCartItem());
	    		cartItemEntity.setQuantity(cartListEntity.get(0).getQuantity() + 1);
	    		cartItemService.save(cartItemEntity);
	    	}
			
		}
		return count;
	}
	
	@RequestMapping("list")
	String cartList(HttpServletRequest request) {
		String status = request.getParameter("status");
	    request.setAttribute("status", status);
		return "CartItems";
	}
	
	@RequestMapping("clear")
	@ResponseBody
	public void clear(HttpServletRequest request) {
		cartService.clear();
		HttpSession session = request.getSession();
		CustomerEntity customer = (CustomerEntity) session.getAttribute("customer");
		if(customer != null) {
			List<ShoppingCartEntity> listCart = shoppingCartService.findCartByCustomer(customer.getIdCustomer());
			if(!listCart.isEmpty()) {
				cartItemService.deleteItemByCartid(listCart.get(0).getIdCartShopping());
				shoppingCartService.deleteCartById(listCart.get(0).getIdCartShopping());
			}
		}
	}
	
	@RequestMapping(value = "buy")
	public String buy(@RequestParam("id") Integer id, HttpServletRequest request) {
		cartService.add(id);
		HttpSession session = request.getSession();
		CustomerEntity customer = (CustomerEntity) session.getAttribute("customer");
		if(customer != null) {
			List<ShoppingCartEntity> listCart = shoppingCartService.findCartByCustomer(customer.getIdCustomer());
			ShoppingCartEntity cartEntity = new ShoppingCartEntity();
			CartItemEntity cartItemEntity = new CartItemEntity();
	    	
			if(listCart.isEmpty()) {
				cartEntity.setCustomerEntity(customer);
				cartEntity = shoppingCartService.save(cartEntity);
				cartItemEntity.setShoppingCartEntity(cartEntity);
			}
			else {
				cartItemEntity.setShoppingCartEntity(listCart.get(0));
			}
			List<CartItemEntity> cartListEntity = cartItemService.findItemByProductAndCart(cartItemEntity.getShoppingCartEntity().getIdCartShopping(), id);
			Optional<ProductEntity> productOptional = productService.findById(id);
	    	cartItemEntity.setProductEntity(productOptional.get());
			if(cartListEntity.isEmpty()) {
		    	cartItemEntity.setQuantity(1);
		    	cartItemService.save(cartItemEntity);
	    	}
	    	else if(!cartListEntity.isEmpty() && cartListEntity.get(0).getQuantity() < 3) {
	    		cartItemEntity.setIdCartItem(cartListEntity.get(0).getIdCartItem());
	    		cartItemEntity.setQuantity(cartListEntity.get(0).getQuantity() + 1);
	    		cartItemService.save(cartItemEntity);
	    	}
			
		}
		return "redirect:/api/cart/list";
	}
	
	@RequestMapping(value = "remove", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Object[] remove(@RequestParam("id") Integer id, HttpServletRequest request) {
		cartService.remove(id);
		int count = cartService.getCount();
		int amount = cartService.getAmount();
		Object[] info = {count,amount};
		HttpSession session = request.getSession();
		CustomerEntity customer = (CustomerEntity) session.getAttribute("customer");
		if(customer != null) {
			List<ShoppingCartEntity> listCart = shoppingCartService.findCartByCustomer(customer.getIdCustomer());
			
			cartItemService.deleteItemByIdCartAndIdProduct(listCart.get(0).getIdCartShopping(), id);
		}
		return info;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Object[] update(@RequestParam("id") Integer id,
							@RequestParam("quantity") int quantity, HttpServletRequest request) {
		cartService.update(id, quantity);
		int count = cartService.getCount();
		int amount = cartService.getAmount();
		Object[] info = {count,amount};
		HttpSession session = request.getSession();
		CustomerEntity customer = (CustomerEntity) session.getAttribute("customer");
		if(customer != null) {
			List<ShoppingCartEntity> listCart = shoppingCartService.findCartByCustomer(customer.getIdCustomer());
			ShoppingCartEntity cart = new ShoppingCartEntity();
			cart = listCart.get(0);
			shoppingCartService.save(cart);
			List<CartItemEntity> listItem = cartItemService.findItemByProductAndCart(cart.getIdCartShopping(), id);
			CartItemEntity item = listItem.get(0);
			item.setQuantity(quantity);
			cartItemService.save(item);
		}
		return info;
	}
	
	@RequestMapping("favo")
	@ResponseBody
	public int addToFavo(Model model, @RequestParam("id") int id) {
	    Cookie favo = cookieService.read("favo");
	    String value = Integer.toString(id);
	    if (favo != null) {
	        value = favo.getValue();
	        if (!value.contains(Integer.toString(id))) {
	            value += "," + Integer.toString(id);
	        }
	    }
	    cookieService.create("favo", value, 30);
	    String[] ids = value.split(",");
	    int quantity = ids.length;
	    return quantity;
	}




}
