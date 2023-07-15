<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/style-prefix.css">
<link rel="stylesheet" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/Order.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<title>Order</title>
<style type="text/css">
	.dropdown-toggle ion-icon {
	  font-size: 37px;
	}
	
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	.dropdown-toggle {
	  background: none;
	  border: none;
	  cursor: pointer;
	}
	
	.dropdown-menu {
	  position: absolute;
	  top: 100%;
	  left: 0;
	  display: none;
	  background-color: #f9f9f9;
	  min-width: 160px;
	  padding: 8px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-menu a {
	  display: block;
	  padding: 8px;
	  text-decoration: none;
	  color: #333;
	}
	
	.dropdown:hover .dropdown-menu {
	  display: block;
	}
</style>
</head>
<body>
	<div id="header">
      <!-- top navbar -->
      <div class="top-navbar">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/apple.png" alt="">
        <img class="top-navbar-samsung" src="/SpringMVCEmployee/URLToReachResourcesFolder/img/samsung.png" alt="">
        <img class="top-navbar-samsung" src="/SpringMVCEmployee/URLToReachResourcesFolder/img/oppo.png" alt="">
        <img class="top-navbar-samsung" src="/SpringMVCEmployee/URLToReachResourcesFolder/img/nokia.jpg" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/xiaomi.png" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/vivo.png" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/realme.png" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/asus.png" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/acer.png" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/tecno.png" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/lenovo.jpg" alt="">
        <img class="top-navbar-samsung" src="/SpringMVCEmployee/URLToReachResourcesFolder/img/huawei.png" alt="">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/dell.png" alt="">
    </div>

    <div class="header-main">

      <div class="container">

        <a href="#" class="header-logo">
          <h2>Tech World</h2>
        </a>

        <div class="header-search-container">
          <form action="<%=request.getContextPath()%>/search" method="post">
            <input value="${param.search}" type="search" name="search" class="search-field" placeholder="Enter your product name...">

            <button class="search-btn">
              <ion-icon name="search-outline"></ion-icon>
            </button>
          </form>

        </div>

        <div class="header-user-actions">

          <c:if test="${not empty sessionScope.customer}">
			    <div class="dropdown">
			      <button class="dropdown-toggle">
			        <ion-icon name="person-outline"></ion-icon>
			      </button>
			      <div class="dropdown-menu">
			        <a>Hi, ${sessionScope.customer.nameCustomer}</a>
			        <a href="#">Personal</a>
			        <a href="<%=request.getContextPath()%>/logout">Logout</a>
			      </div>
			    </div>
			  </c:if>
			  <c:if test="${empty sessionScope.customer}">
			    <button id="add-login-btn" class="button-3" role="button">Login</button>
			  </c:if>

          <button class="action-btn">
            <ion-icon name="heart-outline"></ion-icon>
            <span class="count">0</span>
          </button>

          <button class="action-btn">
            <a href="<%=request.getContextPath()%>/api/cart/list" style="color: inherit; text-decoration: none;">
		  		<ion-icon name="bag-handle-outline"></ion-icon>
		  	</a>
            <span class="count" id="cart-count">
            	<c:if test="${empty cart.count}">0</c:if>
             	<c:if test="${not empty cart.count}">${cart.count}</c:if>
            </span>
          </button>

        </div>

      </div>

    </div>

  </header>

  <!--
    - MAIN
  -->

  <main>

    <!--
      - BANNER
    -->

    <div class="main-order">
      <div class="main-order-left">
        <div class="main-order-form">
          <form action="order/pay" method="post">
          	<input type="text" name="idCustomer" id="fname"  value="${sessionScope.customer.idCustomer}" style="display: none;">
            <input type="text" name="codeCustomer" id="fname"  value="${sessionScope.customer.codeCustomer}" style="display: none;">
            <label for="fname">Full Name</label>
            <input type="text" name="nameCustomer" id="fname"  value="${sessionScope.customer.nameCustomer}" readonly="readonly">
        	<label for="email">Email</label>
            <input type="text" id="email" name="email" placeholder="Your email.." value="${sessionScope.customer.email}" >
            <label for="phoneNumber">Phone number</label>
            <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Your phone number.." value="${sessionScope.customer.phoneNumber}">
            <label for="address">Address</label>
            <input type="text" id="address"  name="address" placeholder="Your address.." value="${sessionScope.customer.addressCustomer}">
        
            <label for="description">Description</label>
            <input type="text" id="description" name="description" placeholder="Your description..">
            <input type="submit" value="Payment">
          </form>
        </div>
      </div>
      <div class="main-order-right">
        <table id="customers">
          <tr>
            <th>Product Name</th>
            <th>Unit Price</th>
            <th>Quantity</th>
          </tr>
          <c:forEach var="item" items="${sessionScope['scopedTarget.cartService'].items}">
          	<tr>
              <td>${item.nameProduct}</td>
              <td><fmt:formatNumber value="${item.unitPrice}" pattern="###,###,###"/></td>
              <td>${item.quantity}</td>
          	</tr>
          </c:forEach>
          
        </table>
        <div style="margin-top: 20px; font-weight: 500px; font-size: 20px; ">
        	<label for="total">Total: <fmt:formatNumber value="${sessionScope['scopedTarget.cartService'].amount}" pattern="###,###,###"/>VND</label>
        </div>
        
      </div>
    </div>

  </main>

  <!--
    - FOOTER
  -->

  <footer>

    <div class="footer-nav">

      <div class="container">

        <ul class="footer-nav-list">

          <li class="footer-nav-item">
            <h2 class="nav-title">Popular Categories</h2>
          </li>

          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Laptop</a>
          </li>

          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Smartphone</a>
          </li>

          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Smartwatch</a>
          </li>

          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Tablet</a>
          </li>

          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Headphone</a>
          </li>

        </ul>

        <ul class="footer-nav-list">
        
          <li class="footer-nav-item">
            <h2 class="nav-title">Products</h2>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Prices drop</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">New products</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Best sales</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Contact us</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Sitemap</a>
          </li>
        
        </ul>

        <ul class="footer-nav-list">
        
          <li class="footer-nav-item">
            <h2 class="nav-title">Our Company</h2>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Delivery</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Legal Notice</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Terms and conditions</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">About us</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Secure payment</a>
          </li>
        
        </ul>

        <ul class="footer-nav-list">
        
          <li class="footer-nav-item">
            <h2 class="nav-title">Services</h2>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Prices drop</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">New products</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Best sales</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Contact us</a>
          </li>
        
          <li class="footer-nav-item">
            <a href="#" class="footer-nav-link">Sitemap</a>
          </li>
        
        </ul>

        <ul class="footer-nav-list">

          <li class="footer-nav-item">
            <h2 class="nav-title">Contact</h2>
          </li>

          <li class="footer-nav-item flex">
            <div class="icon-box">
              <ion-icon name="location-outline"></ion-icon>
            </div>

            <address class="content">
              36/44/06, Nguyen Gia Tri St, 25 Ward
              Binh Thanh District, Ho Chi Minh City
            </address>
          </li>

          <li class="footer-nav-item flex">
            <div class="icon-box">
              <ion-icon name="call-outline"></ion-icon>
            </div>

            <a href="tel:+607936-8058" class="footer-nav-link">0334069054</a>
          </li>

          <li class="footer-nav-item flex">
            <div class="icon-box">
              <ion-icon name="mail-outline"></ion-icon>
            </div>

            <a href="mailto:example@gmail.com" class="footer-nav-link" style="text-transform: lowercase;">phuongnama32112002@gmail.com</a>
          </li>

        </ul>

        <ul class="footer-nav-list">

          <li class="footer-nav-item">
            <h2 class="nav-title">Follow Us</h2>
          </li>

          <li>
            <ul class="social-link">

              <li class="footer-nav-item">
                <a href="#" class="footer-nav-link">
                  <ion-icon name="logo-facebook"></ion-icon>
                </a>
              </li>

              <li class="footer-nav-item">
                <a href="#" class="footer-nav-link">
                  <ion-icon name="logo-twitter"></ion-icon>
                </a>
              </li>

              <li class="footer-nav-item">
                <a href="#" class="footer-nav-link">
                  <ion-icon name="logo-linkedin"></ion-icon>
                </a>
              </li>

              <li class="footer-nav-item">
                <a href="#" class="footer-nav-link">
                  <ion-icon name="logo-instagram"></ion-icon>
                </a>
              </li>

            </ul>
          </li>

        </ul>

      </div>

    </div>

    <div class="footer-bottom">

      <div class="container">

        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/payment.png" alt="payment method" class="payment-img">

        <p class="copyright">
          Copyright &copy; <a href="#">Tech World</a> all rights reserved.
        </p>

      </div>

    </div>

  </footer>

  <!--
    - custom js link
  -->
  <script src="/SpringMVCEmployee/URLToReachResourcesFolder/js/script.js"></script>

  <!--
    - ionicon link
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>