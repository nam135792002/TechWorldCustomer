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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<title>Cart Badge</title>
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/SpringMVCEmployee/URLToReachResourcesFolder/js/ajax.js"></script>

<style type="text/css">

	.dropdown-toggle-nam ion-icon {
	  font-size: 37px;
	}
	
	.dropdown-ri {
	  position: relative;
	  display: inline-block;
	}
	
	.dropdown-toggle-nam {
	  background: none;
	  border: none;
	  cursor: pointer;
	}
	
	.dropdown-menu-icon {
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
	
	.dropdown-menu-icon a {
	  display: block;
	  padding: 8px;
	  text-decoration: none;
	  color: #333;
	}
	
	.dropdown-ri:hover .dropdown-menu-icon {
	  display: block;
	}
	.cart{
	margin: 20px 0;
	background-color: #F6F5FA;;
	padding: 60px 0;
}
.total-price{
	padding-bottom: 15px;
}
.cart-item{
	background-color: #fff;
	border-radius: 10px;
	padding: 15px 20px;
	margin-bottom: 20px;
}
.center-item{
    display: flex;
    align-items: center;
    justify-content: flex-start;
}
.cart-item img{
	width: 115px;
}
.cart-item h5{
    padding: 0 45px;
}
.cart-item .remove-item{
	width: 25px!important;
}
.btn-default{
	background-color: #fff;
}
.cart-item .form-control{
	background-color: #F6F5FA;
	border: none;
    width: 65px;
    border-radius: 10px!important;
    font-weight: 700;
    font-size: 20px;
}
.input-group{
	width: unset;
	flex-wrap: nowrap;
}
.status{
	text-align: right;
}
.check-out{
    float: right;
    padding: 10px 30px;
	font-size: 19px;
	background-color: #2FBE70;
	border: none;
}
a{
	text-decoration: none;
}
.tech-world{
	display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
</style>
</head>
<body>
	<input type="hidden" id="status" value="${status}">
	 <!--
    - HEADER
  -->

  <header>

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

        <a href="<%=request.getContextPath()%>/home" class="header-logo">
          <h2 class="tech-world">Tech World</h2>
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
			    <div class="dropdown-ri">
			      <button class="dropdown-toggle-nam">
			        <ion-icon name="person-outline"></ion-icon>
			      </button>
			      <div class="dropdown-menu-icon">
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

    <section>
      <div class="container">
         <h2 class="px-5 p-2">My shopping cart</h2>
         <div class="cart">
            <div class="col-md-12 col-lg-10 mx-auto">
              <c:forEach var="item" items="${sessionScope['scopedTarget.cartService'].items}">
              	<div class="cart-item" data-id="${item.idProduct}" data-price="${item.unitPrice}">
                  <div class="row">
                     <div class="col-md-7 center-item">
                        <img src="data:image/jpeg;base64,${item.base64Image}"/>
                        <h5>${item.nameProduct} (<fmt:formatNumber value="${item.unitPrice}" pattern="###,###,###"/>VND)</h5>
                     </div>

                     <div class="col-md-5 center-item ">
                        <div class="input-group number-spinner">
                           <input id="phone-number" type="number" min="1" max="3" class="form-control text-center" value="${item.quantity}">
                        </div>
                        <h5><span id="phone-total" class="amount-item"><fmt:formatNumber value="${item.unitPrice * item.quantity}" pattern="###,###,###"/>VND</span> </h5>
                        <button class="btn-cart-remove">
                        	<i class="fa-solid fa-trash" style="color: #a61111; font-size: 30px"></i>
                        </button>
                        
                     </div>
                  </div>
               </div>
              </c:forEach>
               <div class="cart-item">
                  <div class="row g-2">

                     <div class="col-6">
                        <h5>Total:</h5>
                     </div>

                     <div class="col-6 status">
                        <h5><span id="cart-my-total">
                        		<c:if test="${empty cart.amount}">0VND</c:if>
             					<c:if test="${not empty cart.amount}">
									<fmt:formatNumber value="${cart.amount}" pattern="###,###,###"/>VND
								</c:if>
							</span></h5>
                     </div>
                     
                  </div>
               </div>
               <div class="col-md-12 pt-4 pb-4">
               	  
               	  <c:if test="${not empty sessionScope.customer}">
               	  	<button type="button" class="btn btn-success check-out" onclick="window.location.href='<%=request.getContextPath()%>/order';">Continue</button>
               	  </c:if>
               	  <c:if test="${empty sessionScope.customer}">
               	  	<button id="add-login-btn-register" type="button" class="btn btn-success check-out" >Continue</button>
               	  </c:if>
               	  <button type="button" class="btn btn-danger btn-cart-clear">Clear</button>
               	  <button type="button" class="btn btn-info" onclick="window.location.href='<%=request.getContextPath()%>/home';">Continue shopping</button>
               </div>
            </div>
         </div>
      </div>
   </section>

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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript">
	var status = document.getElementById("status").value;
    if (status === "failed") {
		swal("Sorry", "Login failed", "error");
	}
  </script>
  
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript">
	var status = document.getElementById("status").value;
    if (status === "empty") {
		swal("Sorry", "My shopping cart is empty. Please, select my favourite product!", "error");
	}
  </script>
	<div class="overlay-login" id="overlay-login">
        <div class="popup">
            <span class="delete-icon" id="delete-icon">
                <i class="fas fa-times"></i>
            </span>
            <div class="btn-login-regiter">
            	<p style="font-weight: 300;">Please login your account for a better shopping experience</p>
            	<button class="button1">
            		<a href="<%=request.getContextPath()%>/register" style="color: inherit; text-decoration: none;">
            		Sign-up </a>
            	</button>
				<button class="button1 button2">
					<a href="<%=request.getContextPath()%>/login" style="color: inherit; text-decoration: none;">
            		Sign-in </a>
				</button>
            </div>
        </div>
    </div>
    <script>
        const addCategoryBtn = document.getElementById("add-login-btn");
    	const addLogin = document.getElementById("add-login-btn-register");
        const overlay = document.getElementById("overlay-login");
        const deleteIcon = document.getElementById("delete-icon");

        addCategoryBtn.addEventListener("click", () => {
            overlay.style.display = "block";
        });
        addLogin.addEventListener("click", () => {
            overlay.style.display = "block";
        });

        deleteIcon.addEventListener("click", () => {
            overlay.style.display = "none";
        });
    </script>
</body>
</html>