<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tech World</title>

  <!--
    - custom css link
  -->
  <link rel="stylesheet" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/style-prefix.css">
  <link rel="stylesheet" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/ProductDetail.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <!--
    - google font link
  -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="/SpringMVCEmployee/URLToReachResourcesFolder/js/ajax.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    .description-container {
      margin-top: 20px;
    }
    .description-load-more-less{
      max-height: 100px;
      overflow: hidden;
      transition: max-height 0.5s ease;
    }
    .btn-more-less{
      display: flex;
      text-align: center;
      justify-content: center;
    }
    .load-more-btn {
      display: block;
      background: #7f2a4b;
      color: #fff;
      cursor: pointer;
      text-align: center;
      font-weight: 900;
      width: 180px;
      line-height: 50px;
      margin: 30px auto 0;
      border-radius: 50px;
    }
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
    <div class = "main-wrapper">
      <div class = "container">
          <div class = "product-div">
              <div class = "product-div-left">
                  <div class = "img-container">
                  	  <img src="data:image/jpeg;base64,${productDTO.base64Image}"/>
                  </div>
                  <div class = "hover-container">
                  	  <div><img src="data:image/jpeg;base64,${productDTO.base64Image}"/></div>
                  	  <c:forEach var="photoRelate" items="${productDTO.base64ListImage}">
                  	  	<div><img src="data:image/jpeg;base64,${photoRelate}"/></div>
                  	  </c:forEach>
                  </div>
              </div>
              <div class = "product-div-right">
                  <span class = "product-name">${productDTO.nameProduct}</span>
                  <span class = "product-price"><fmt:formatNumber value="${productDTO.unitPrice}" pattern="###,###,###"/>VND</span>
                  <div class = "product-rating">
                      <span><i class = "fas fa-star"></i></span>
                      <span><i class = "fas fa-star"></i></span>
                      <span><i class = "fas fa-star"></i></span>
                      <span><i class = "fas fa-star"></i></span>
                      <span><i class = "fas fa-star-half-alt"></i></span>
                      <span>(350 ratings)</span>
                  </div>
                  <p class = "product-description" style="font-size: 20px; font-weight: 500;">Category: ${productDTO.categoryDTO.nameCategory}</p>
                  <p class = "product-description" style="font-size: 20px; font-weight: 500;">Quantity: ${productDTO.quantity}</p>
                  <div class = "btn-groups" data-id="${productDTO.idProduct}">
                  	<button type="button" class="add-cart-btn btn-add-to-cart" data-id="product_id"><i class="fas fa-shopping-cart"></i>add to cart</button>
                    <button type = "button" class = "buy-now-btn" onclick="window.location.href='<%=request.getContextPath()%>/api/cart/buy?id=${productDTO.idProduct}';"><i class = "fas fa-wallet"></i>buy now</button>
                     
                  </div>
              </div>
          </div>
          <div class="description-container">
            <h3 >Description:</h3>
            <p class = "product-description description-load-more-less" style="text-align: justify;">${productDTO.discription}</p>
              <div class="btn-more-less">
                <button type="button" class="load-more-btn" onclick="toggleDescription()">Load More</button>
              </div>
          </div>
        </div>
  </div>

  <div class="product-main" style="margin: 50px 50px;">

    <h1 class="title">Relate Products</h1>

    <div class="product-grid">
      <c:forEach var="product" items="${listProdutDTO}">
      	<div class="showcase">
      
	        <div class="showcase-banner">
	          <img src="data:image/jpeg;base64,${product.base64Image}" class="product-img default" width="300"/>
              <img src="data:image/jpeg;base64,${product.base64Image}" class="product-img hover" width="300"/>
              
	      
	          <div class="showcase-actions" data-id="${product.idProduct}">
	            <button class="btn-action">
	              <ion-icon name="heart-outline"></ion-icon>
	            </button>
	      
	            <button class="btn-action">
                       <a href="<%=request.getContextPath()%>/home/productDetail?idProduct=${product.idProduct}" style="color: inherit;
  text-decoration: none;">
                       	<ion-icon name="eye-outline"></ion-icon>
                       </a>
                    </button>
	      
	            <button class="btn-action">
	              <ion-icon name="repeat-outline"></ion-icon>
	            </button>
	      
	            <button class="btn-action btn-add-to-cart">
	              <ion-icon name="bag-add-outline"></ion-icon>
	            </button>
	          </div>
	        </div>
	      
	        <div class="showcase-content">
	      
	          <h3>
                    <a href="#" class="showcase-title">${product.nameProduct}</a>
                  </h3>
              
                  <div class="showcase-rating">
                    <ion-icon name="star"></ion-icon>
                    <ion-icon name="star"></ion-icon>
                    <ion-icon name="star"></ion-icon>
                    <ion-icon name="star-outline"></ion-icon>
                    <ion-icon name="star-outline"></ion-icon>
                  </div>
              
                  <div class="price-box">
                    <p class="price"><fmt:formatNumber value="${product.unitPrice}" pattern="###,###,###"/></p>
                  </div>
              
	      
	        </div>
	      
	      </div>
      </c:forEach>
      
    </div>

  </div>

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
  <script src="/SpringMVCEmployee/URLToReachResourcesFolder/js/ProductDetail.js"></script>
  <!--
    - custom js link
  -->
  <script src="/SpringMVCEmployee/URLToReachResourcesFolder/js/script.js"></script>

  <!--
    - ionicon link
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
  <script>
    function toggleDescription() {
    var description = document.querySelector('.description-load-more-less');
    var btn = document.querySelector('.load-more-btn');

    if (description.style.maxHeight) {
      description.style.maxHeight = null;
      btn.textContent = 'Load More';
    } else {
      description.style.maxHeight = description.scrollHeight + 'px';
      btn.textContent = 'Load Less';
    }
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
    <div class="toast">
	    <div class="toast-content">
	        <i class="fas fa-solid fa-check check"></i>
	
	        <div class="message">
	            <span class="text text-1">Success</span>
	            <span class="text text-2">Successfully added to your cart</span>
	        </div>
	    </div>
	    <i class="fa-solid fa-xmark close"></i>
	
	    <div class="progress"></div>
	</div>
	<script type="text/javascript">
	const buttons = document.querySelectorAll(".btn-add-to-cart");
	const toast = document.querySelector(".toast");
	const closeIcon = document.querySelector(".close");
	const progress = document.querySelector(".progress");

	let timer1, timer2;

	buttons.forEach((button) => {
	  button.addEventListener("click", () => {
	    const id = button.closest("div").getAttribute("data-id");
	    
	    $.ajax({
	      url: "http://localhost:8080/SpringMVCEmployee/api/cart/add?id=" + id,
	      success: function(response) {
	    	  $("#cart-count").html(response);
	        toast.classList.add("active");
	        progress.classList.add("active");

	        clearTimeout(timer1);
	        clearTimeout(timer2);

	        timer1 = setTimeout(() => {
	          toast.classList.remove("active");
	        }, 2000);

	        timer2 = setTimeout(() => {
	          progress.classList.remove("active");
	        }, 5300);
	      }
	    });
	  });
	});

	closeIcon.addEventListener("click", () => {
	  toast.classList.remove("active");
	  setTimeout(() => {
	    progress.classList.remove("active");
	  }, 300);

	  clearTimeout(timer1);
	  clearTimeout(timer2);
	});

	</script>
</body>

</html>