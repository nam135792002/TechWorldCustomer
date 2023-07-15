package r2s.com.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import r2s.com.dto.CustomerDTO;
import r2s.com.dto.OrderDTO;
import r2s.com.dto.ProductDTO;
import r2s.com.models.CustomerEntity;
import r2s.com.models.OrderDetailEntity;
import r2s.com.models.OrderEntity;
import r2s.com.models.OrderStatusEntity;
import r2s.com.models.ProductEntity;
import r2s.com.models.ShoppingCartEntity;
import r2s.com.service.CartItemService;
import r2s.com.service.CartService;
import r2s.com.service.CustomerService;
import r2s.com.service.OrderDetailService;
import r2s.com.service.OrderService;
import r2s.com.service.OrderStatusService;
import r2s.com.service.ShoppingCartService;

@Controller
public class OrderController {
	@Autowired
	OrderStatusService orderStatusService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	@Autowired
	CustomerService customerService;
	@Autowired
	CartService cartService;
	@Autowired
	CartItemService cartItemService;
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@GetMapping("/order")
	String orderPage(HttpServletRequest request) {
		if(cartService.getItems().isEmpty()) {
			request.setAttribute("status", "empty");
			return "redirect:/api/cart/list?status=" + request.getAttribute("status");
		}
		return "Order";
	}
	
	@PostMapping(value="/order/pay")
	ModelAndView paymentPage(HttpServletRequest request, @ModelAttribute("customer") CustomerDTO customerDTO) {
		HttpSession session = request.getSession();
		CustomerEntity customer = (CustomerEntity) session.getAttribute("customer");
		OrderEntity orderEntity = new OrderEntity();
		orderEntity.setCustomerEntity(customer);
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		orderEntity.setOrderDate(currentTime);
		orderEntity.setAddressOrder(customerDTO.getAddress());
		orderEntity.setEmail(customerDTO.getEmail());
		orderEntity.setPhoneNumber(customerDTO.getPhoneNumber());
		orderEntity.setDescription(customerDTO.getDescription());
		orderEntity.setTotal(cartService.getAmount());
		Optional<OrderStatusEntity> orderStatusOptional = orderStatusService.findById(1);
		orderEntity.setOrderStatusEntity(orderStatusOptional.get());
		orderEntity = orderService.save(orderEntity);
		Collection<ProductDTO> collectionProduct = cartService.getItems();
		List<ProductDTO> productList = new ArrayList<>();
		for (ProductDTO productDTO : collectionProduct) {
			ProductEntity productEntity = new ProductEntity();
			productEntity = productDTO.convertProductEntity(productDTO);
			OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
			orderDetailEntity.setOrderEntity(orderEntity);
			orderDetailEntity.setProducEntity(productEntity);
			orderDetailEntity.setQuantity(productEntity.getQuantity());
			orderDetailService.save(orderDetailEntity);
			productList.add(productDTO);
		}
		request.setAttribute("status", "success");
		OrderDTO orderDTO = new OrderDTO();
		orderDTO = orderDTO.convertOrderDTO(orderEntity);
		orderDTO.setCustomerDTO(customerDTO);
		orderDTO.setListProduct(productList);
		orderDTO.setTotal(cartService.getAmount());
		Optional<OrderEntity> orderOptional = orderService.findById(orderEntity.getIdOrder());
		orderDTO.setCodeOrder(orderOptional.get().getCodeOrder());
		ModelAndView mv = new ModelAndView("Invoice");
		mv.addObject("orderDTO", orderDTO);
		cartService.clear();
		List<ShoppingCartEntity> listCart = shoppingCartService.findCartByCustomer(customer.getIdCustomer());
		if(!listCart.isEmpty()) {
			cartItemService.deleteItemByCartid(listCart.get(0).getIdCartShopping());
			shoppingCartService.deleteCartById(listCart.get(0).getIdCartShopping());
		}
		System.out.println(orderEntity.getIdOrder());
		System.out.println(orderEntity.getCodeOrder());
		return mv;
	}
	
	@GetMapping(value = "/order/finish")
	String finish() {
		return "redirect:/";
	}
}
