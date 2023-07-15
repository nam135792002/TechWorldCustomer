<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/style-prefix.css">
<link rel="stylesheet" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/Login.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<title>Login</title>
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

    <div id="body-login">
        <div class="container-login">
            <div class="cover">
              <div class="front">
                <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/Login.jpg" alt="">
                <div class="text">
                  <span class="text-1">Every new friend is a <br> new adventure</span>
                  <span class="text-2">Let's get connected</span>
                </div>
              </div>
            </div>
            <div class="forms">
                <div class="form-content">
                  <div class="login-form">
                    <div class="title">Login</div>
                  <form action="save_login" method="post">
                    <div class="input-boxes">
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="email" placeholder="Enter your email" id="username" name="username" required value="${param.email}">
                      </div>
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Enter your password" id="password" name="password" required value="${param.password}">
                      </div>
                      <div class="text"><a href="#">Forgot password?</a></div>
                      <div class="button input-box">
                        <input type="submit" value="Sumbit">
                      </div>
                      <div class="text sign-up-text">Don't have an account? <a href="<%=request.getContextPath()%>/register"> Sign Up</a></div>
                    </div>
                </form>
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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		  <script type="text/javascript">
		  var status = document.getElementById("status").value;
		  if (status === "failed") {
		  	swal("Sorry", "Login failed", "error");
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
        const overlay = document.getElementById("overlay-login");
        const deleteIcon = document.getElementById("delete-icon");

        addCategoryBtn.addEventListener("click", () => {
            overlay.style.display = "block";
        });

        deleteIcon.addEventListener("click", () => {
            overlay.style.display = "none";
        });
    </script>
</body>
</html>