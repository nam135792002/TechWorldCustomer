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
  <meta name="context-path" content="<%=request.getContextPath()%>">
  <title>Tech World</title>

  <!--
    - custom css link
  -->
  <link rel="stylesheet" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/style-prefix.css">

  <!--
    - google font link
  -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
<script src="/SpringMVCEmployee/URLToReachResourcesFolder/js/ajax.js"></script>
</head>

<body>


  <div class="overlay" data-overlay></div>

  <!--
    - MODAL
  -->

  <div class="modal" data-modal>

    <div class="modal-close-overlay" data-modal-overlay></div>

    <div class="modal-content">

      <button class="modal-close-btn" data-modal-close>
        <ion-icon name="close-outline"></ion-icon>
      </button>

      <div class="newsletter-img">
        <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/newsletter_01.png" alt="subscribe newsletter" width="400" height="400">
      </div>

      <div class="newsletter">

        <form action="#" method="post">

          <div class="newsletter-header">

            <h3 class="newsletter-title">Subscribe Newsletter.</h3>

            <p class="newsletter-desc">
              Subscribe the <b>Tech World</b> to get latest products and discount update.
            </p>

          </div>

          <input type="email" name="email" class="email-field" placeholder="Email Address" required>

          <button type="submit" class="btn-newsletter">Subscribe</button>

        </form>

      </div>

    </div>

  </div>

  <!--
    - NOTIFICATION TOAST
  -->

  <div class="notification-toast" data-toast>

    <button class="toast-close-btn" data-toast-close>
      <ion-icon name="close-outline"></ion-icon>
    </button>

    <div class="toast-banner">
      <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/IphoneXS.png" alt="IphoneXS" width="80" height="70">
    </div>

    <div class="toast-detail">

      <p class="toast-message">
        Someone in new just bought
      </p>

      <p class="toast-title">
        IphoneXS
      </p>

      <p class="toast-meta">
        <time datetime="PT2M">2 Minutes</time> ago
      </p>

    </div>

  </div>

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
			        <a href="<%=request.getContextPath()%>/personal/home">Personal</a>
			        <a href="<%=request.getContextPath()%>/logout">Logout</a>
			      </div>
			    </div>
			  </c:if>
			  <c:if test="${empty sessionScope.customer}">
			    <button id="add-login-btn" class="button-3" role="button">Login</button>
			  </c:if>

          <button class="action-btn">
            <ion-icon name="heart-outline"></ion-icon>
            <span class="count" id="cart-fav-count">0</span>
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

    <div class="banner">

      <div class="container">

        <div class="slider-container has-scrollbar">

          <div class="slider-item">

            <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BannerTablet_02.jpg" alt="laptop's latest sale" class="banner-img">

            <div class="banner-content">

              <p class="banner-subtitle">Genuine VN/A</p>

              <h2 class="banner-title">iPad Air 5 2022 64GB</h2>

              <p class="banner-text">
                starting at <b>13</b>.990.000VND
              </p>

              <a href="#" class="banner-btn">Shop now</a>

            </div>

          </div>

          <div class="slider-item">

            <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BannerSmartPhone.jpg" alt="smartphone's latest sale" class="banner-img">

            <div class="banner-content">

              <p class="banner-subtitle">Genuine VN/A</p>

              <h2 class="banner-title">iPhone 14 Pro Max 128GB</h2>

              <p class="banner-text">
                starting at <b>26</b>.890.000VND
              </p>

              <a href="#" class="banner-btn">Shop now</a>

            </div>

          </div>

          <div class="slider-item">

            <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BannerHeadPhone.jpg" alt="headphone's latest salee" class="banner-img">

            <div class="banner-content">

              <p class="banner-subtitle">Genuine VN/A</p>

              <h2 class="banner-title">Headphone Gaming Havit HV-H2232D</h2>

              <p class="banner-text">
                starting at <b>340</b>.000VND
              </p>

              <a href="#" class="banner-btn">Shop now</a>

            </div>

          </div>

        </div>

      </div>

    </div>

    <!--
      - CATEGORY
    -->

    <div class="category">

      <div class="container">

        <div class="category-item-container has-scrollbar">
		  <c:forEach var="categoryDetail" items="${cateDTODetailList}">
		    <div class="category-item">

	            <div class="category-img-box">
	              <img src="data:image/jpeg;base64,${categoryDetail.base64Image}" width="30"/>
	            </div>
	
	            <div class="category-content-box">
	
	              <div class="category-content-flex">
	                <h3 class="category-item-title">${categoryDetail.nameCategory}</h3>
	
	                <p class="category-item-amount">(${categoryDetail.countCategory})</p>
	              </div>
	
	              <a href="<%=request.getContextPath()%>/home/category?idCategory=${categoryDetail.idCategory}" class="category-btn">Show all</a>
	
	            </div>
	
	          </div>
		  </c:forEach>
        </div>

      </div>

    </div>

    <!--
      - PRODUCT
    -->

    <div class="product-container">

      <div class="container">

        <!--
          - SIDEBAR
        -->

        <div class="sidebar  has-scrollbar" data-mobile-menu>

          <div class="sidebar-category">

            <div class="sidebar-top">
              <h2 class="sidebar-title">Category</h2>

              <button class="sidebar-close-btn" data-mobile-menu-close-btn>
                <ion-icon name="close-outline"></ion-icon>
              </button>
            </div>

            <ul class="sidebar-menu-category-list">
			  <c:forEach var="categoryDetail" items="${cateDTODetailList}">
			  	<li class="sidebar-menu-category">

	                <button class="sidebar-accordion-menu" data-accordion-btn>
	
	                  <div class="menu-title-flex">
	                  	<img src="data:image/jpeg;base64,${categoryDetail.base64Image}" width="20" height="20" class="menu-title-img"/>
	                    
	                    <a href="<%=request.getContextPath()%>/home/category?idCategory=${categoryDetail.idCategory}"><p class="menu-title">${categoryDetail.nameCategory}</p></a>
	                    
	                  </div>
	
	                </button>
	
	              </li>
			  </c:forEach>

            </ul>

          </div>

          <div class="product-showcase">

            <h3 class="showcase-heading">best sellers</h3>

            <div class="showcase-wrapper">

              <div class="showcase-container">

                <div class="showcase">

                  <a href="#" class="showcase-img-box">
                    <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BestSellerIphone13.png" alt="baby fabric shoes" width="75" height="75"
                      class="showcase-img">
                  </a>

                  <div class="showcase-content">

                    <a href="#">
                      <h4 class="showcase-title">iPhone 13 128GB</h4>
                    </a>

                    <div class="showcase-rating">
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                    </div>

                    <div class="price-box">
                      <del>18.990.000</del>
                      <p class="price">16.890.000</p>
                    </div>

                  </div>

                </div>

                <div class="showcase">

                  <a href="#" class="showcase-img-box">
                    <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BestSellerIpad.png" alt="men's hoodies t-shirt" class="showcase-img"
                      width="75" height="75">
                  </a>

                  <div class="showcase-content">

                    <a href="#">
                      <h4 class="showcase-title">iPad Pro 11 2021 M1 WiFi</h4>
                    </a>
                    <div class="showcase-rating">
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star-half-outline"></ion-icon>
                    </div>

                    <div class="price-box">
                      <del>23.990.000</del>
                      <p class="price">18.990.000</p>
                    </div>

                  </div>

                </div>

                <div class="showcase">

                  <a href="#" class="showcase-img-box">
                    <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BestSellerHeadphone.jpg" alt="girls t-shirt" class="showcase-img" width="75"
                      height="75">
                  </a>

                  <div class="showcase-content">

                    <a href="#">
                      <h4 class="showcase-title">JBL JR310BT Kids Wireless On-Ear Headphones</h4>
                    </a>
                    <div class="showcase-rating">
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star-half-outline"></ion-icon>
                    </div>

                    <div class="price-box">
                      <del>600.000</del>
                      <p class="price">540.000</p>
                    </div>

                  </div>

                </div>

                <div class="showcase">

                  <a href="#" class="showcase-img-box">
                    <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BestSellerSmartwatch.png" alt="woolen hat for men" class="showcase-img" width="75"
                      height="75">
                  </a>

                  <div class="showcase-content">

                    <a href="#">
                      <h4 class="showcase-title">Garmin Venu 2 series</h4>
                    </a>
                    <div class="showcase-rating">
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                    </div>

                    <div class="price-box">
                      <del>10.000.000</del>
                      <p class="price">9.900.000</p>
                    </div>

                  </div>

                </div>

              </div>

            </div>

          </div>

        </div>

        <div class="product-box">
          <!--
            - PRODUCT FEATURED
          -->

          <div class="product-featured">

            <h2 class="title">Deal of the day</h2>

            <div class="showcase-wrapper has-scrollbar">

              <div class="showcase-container">

                <div class="showcase">
                  
                  <div class="showcase-banner">
                    <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/HotDealIp7.png" alt="shampoo, conditioner & facewash packs" class="showcase-img">
                  </div>

                  <div class="showcase-content">
                    
                    <div class="showcase-rating">
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star-outline"></ion-icon>
                      <ion-icon name="star-outline"></ion-icon>
                    </div>

                    <a href="#">
                      <h3 class="showcase-title">Apple iPhone 7 Plus 128GB</h3>
                    </a>

                    <p class="showcase-desc">
                      ~Water protection
                      ~Home button
                      ~Headphone plug removal
                      ~1,960 mAh battery
                    </p>

                    <div class="price-box">
                      <p class="price">3.890.000</p>

                      <del>9.990.000</del>
                    </div>

                    <button class="add-cart-btn">add to cart</button>

                    <div class="showcase-status">
                      <div class="wrapper">
                        <p>
                          already sold: <b>20</b>
                        </p>

                        <p>
                          available: <b>40</b>
                        </p>
                      </div>

                      <div class="showcase-status-bar"></div>
                    </div>

                    <div class="countdown-box">

                      <p class="countdown-desc">
                        Hurry Up! Offer ends in:
                      </p>

                      <div class="countdown">

                        <div class="countdown-content">

                          <p class="display-number">1</p>

                          <p class="display-text">Day</p>

                        </div>

                        <div class="countdown-content">
                          <p class="display-number">12</p>
                          <p class="display-text">Hours</p>
                        </div>

                        <div class="countdown-content">
                          <p class="display-number">27</p>
                          <p class="display-text">Min</p>
                        </div>

                        <div class="countdown-content">
                          <p class="display-number">00</p>
                          <p class="display-text">Sec</p>
                        </div>

                      </div>

                    </div>

                  </div>

                </div>

              </div>

              <div class="showcase-container">
              
                <div class="showcase">
              
                  <div class="showcase-banner">
                    <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/HotDealIpad.png" alt="Rose Gold diamonds Earring" class="showcase-img">
                  </div>
              
                  <div class="showcase-content">
              
                    <div class="showcase-rating">
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star"></ion-icon>
                      <ion-icon name="star-outline"></ion-icon>
                    </div>
              
                    <h3 class="showcase-title">
                      <a href="#" class="showcase-title">iPad Air 4 (2020) 4G 256GB</a>
                    </h3>
              
                    <p class="showcase-desc" style="text-align: justify;">
                      A sleek and powerful tablet with a 10.9-inch display. 
                      It features the A14 Bionic chip, supports cellular connectivity, and offers ample storage. 
                      With its compatibility for the Apple Pencil and Magic Keyboard, it provides a versatile and productive user experience.
                    </p>
              
                    <div class="price-box">
                      <p class="price">17.390.000</p>
                      <del>23.990.000</del>
                    </div>
              
                    <button class="add-cart-btn">add to cart</button>
              
                    <div class="showcase-status">
                      <div class="wrapper">
                        <p> already sold: <b>15</b> </p>
              
                        <p> available: <b>40</b> </p>
                      </div>
              
                      <div class="showcase-status-bar"></div>
                    </div>
              
                    <div class="countdown-box">
              
                      <p class="countdown-desc">Hurry Up! Offer ends in:</p>
              
                      <div class="countdown">
                        <div class="countdown-content">
                          <p class="display-number">0</p>
                          <p class="display-text">Day</p>
                        </div>
              
                        <div class="countdown-content">
                          <p class="display-number">3</p>
                          <p class="display-text">Hours</p>
                        </div>
              
                        <div class="countdown-content">
                          <p class="display-number">50</p>
                          <p class="display-text">Min</p>
                        </div>
              
                        <div class="countdown-content">
                          <p class="display-number">00</p>
                          <p class="display-text">Sec</p>
                        </div>
                      </div>
              
                    </div>
              
                  </div>
              
                </div>
              
              </div>

            </div>

          </div>



          <!--
            - PRODUCT GRID
          -->
          <c:if test="${empty listOfList}">
          	<div class="product-main" style="text-align: center;">
	            <h2 class="title">Not products found</h2>
          	</div>
          </c:if>
          
		  <c:if test="${not empty listOfList}">
		  	<c:forEach var="productList" items="${listOfList}">
	          <div class="product-main">
	
	            <h2 class="title">${productList.nameCate}</h2>
				
	            <div class="product-grid">
				  <c:forEach var="productDetail" items="${productList.productDTOList}">
				  	<div class="showcase">
	              
	                <div class="showcase-banner">
	                  <img src="data:image/jpeg;base64,${productDetail.base64Image}" class="product-img default" width="300"/>
	                  <img src="data:image/jpeg;base64,${productDetail.base64Image}" class="product-img hover" width="300"/>
	              
	                  <div class="showcase-actions" data-id="${productDetail.idProduct}">
	                    <button class="btn-action btn-star-heart">
	                      <ion-icon name="heart-outline"></ion-icon>
	                    </button>
	              
	                    <button class="btn-action">
	                       <a href="<%=request.getContextPath()%>/home/productDetail?idProduct=${productDetail.idProduct}" style="color: inherit;
	  text-decoration: none;">
	                       	<ion-icon name="eye-outline"></ion-icon>
	                       </a>
	                    </button>
	              
	                    <button class="btn-action btn-add-to-cart btn-bag-add">
	                      <ion-icon name="bag-add-outline"></ion-icon>
	                    </button>
	                  </div>
	                </div>
	              	
	                <div class="showcase-content">
	              
	                  <h3>
	                    <a href="#" class="showcase-title">${productDetail.nameProduct}</a>
	                  </h3>
	              
	                  <div class="showcase-rating">
	                    <ion-icon name="star"></ion-icon>
	                    <ion-icon name="star"></ion-icon>
	                    <ion-icon name="star"></ion-icon>
	                    <ion-icon name="star-outline"></ion-icon>
	                    <ion-icon name="star-outline"></ion-icon>
	                  </div>
	              
	                  <div class="price-box">
	                    <p class="price"><fmt:formatNumber value="${productDetail.unitPrice}" pattern="###,###,###"/></p>
	                  </div>
	              
	                </div>
	              
	              </div>
				  </c:forEach>
	              
	
	            </div>
	
	          </div>
	          </c:forEach>
		  </c:if>
          
        </div>

      </div>

    </div>

    <!--
      - TESTIMONIALS, CTA & SERVICE
    -->

    <div>

      <div class="container">

        <div class="testimonials-box">

          <!--
            - TESTIMONIALS
          -->

          <div class="testimonial">

            <h2 class="title">testimonial</h2>

            <div class="testimonial-card">

              <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/testimonial-1.jpg" alt="alan doe" class="testimonial-banner" width="80" height="80">

              <p class="testimonial-name">Alan Doe</p>

              <p class="testimonial-title">CEO & Founder Tech World</p>

              <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/icons/quotes.svg" alt="quotation" class="quotation-img" width="26">

              <p class="testimonial-desc">
                Discover our cutting-edge Tech World store, 
                offering the latest technology for all your digital needs
              </p>

            </div>

          </div>



          <!--
            - CTA
          -->

          <div class="cta-container">

            <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/CTA.jpg" alt="summer collection" class="cta-banner">

            <a href="#" class="cta-content">

              <p class="discount">15% Discount</p>

              <h2 class="cta-title">Summer semester for student</h2>

              <p class="cta-text">Starting 7.000.000</p>

              <button class="cta-btn">Shop now</button>

            </a>

          </div>



          <!--
            - SERVICE
          -->

          <div class="service">

            <h2 class="title">Our Services</h2>

            <div class="service-container">

              <a href="#" class="service-item">

                <div class="service-icon">
                  <ion-icon name="boat-outline"></ion-icon>
                </div>

                <div class="service-content">

                  <h3 class="service-title">Worldwide Delivery</h3>
                  <p class="service-desc">For Order Over $100</p>

                </div>

              </a>

              <a href="#" class="service-item">
              
                <div class="service-icon">
                  <ion-icon name="rocket-outline"></ion-icon>
                </div>
              
                <div class="service-content">
              
                  <h3 class="service-title">Next Day delivery</h3>
                  <p class="service-desc">UK Orders Only</p>
              
                </div>
              
              </a>

              <a href="#" class="service-item">
              
                <div class="service-icon">
                  <ion-icon name="call-outline"></ion-icon>
                </div>
              
                <div class="service-content">
              
                  <h3 class="service-title">Best Online Support</h3>
                  <p class="service-desc">Hours: 8AM - 11PM</p>
              
                </div>
              
              </a>

              <a href="#" class="service-item">
              
                <div class="service-icon">
                  <ion-icon name="arrow-undo-outline"></ion-icon>
                </div>
              
                <div class="service-content">
              
                  <h3 class="service-title">Return Policy</h3>
                  <p class="service-desc">Easy & Free Return</p>
              
                </div>
              
              </a>

              <a href="#" class="service-item">
              
                <div class="service-icon">
                  <ion-icon name="ticket-outline"></ion-icon>
                </div>
              
                <div class="service-content">
              
                  <h3 class="service-title">30% money back</h3>
                  <p class="service-desc">For Order Over $100</p>
              
                </div>
              
              </a>

            </div>

          </div>

        </div>

      </div>

    </div>





    <!--
      - BLOG
    -->

    <div class="blog">

      <div class="container">

        <div class="blog-container has-scrollbar">

          <div class="blog-card">

            <a href="#">
              <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BlogerBitcoin.jpg" alt="Clothes Retail KPIs 2021 Guide for Clothes Executives" width="300" class="blog-banner">
            </a>

            <div class="blog-content">

              <a href="#" class="blog-category">Future of money</a>

              <a href="https://www.reuters.com/technology/bitcoin-hits-1-year-high-amid-blackrock-etf-excitement-2023-06-23/">
                <h3 class="blog-title">Bitcoin hits more than 1-year high amid BlackRock ETF excitement</h3>
              </a>

              <p class="blog-meta">
                By <cite>Ri Nguyen</cite> / <time datetime="2023-06-30">2023-06-30</time>
              </p>

            </div>

          </div>

          <div class="blog-card">
          
            <a href="#">
              <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BlogerIBM.jpg" alt="Curbside fashion Trends: How to Win the Pickup Battle."
                class="blog-banner" width="300">
            </a>
          
            <div class="blog-content">
          
              <a href="#" class="blog-category">Technology</a>
          
              <h3>
                <a href="https://m.economictimes.com/tech/technology/ibm-nears-5-billion-deal-for-software-provider-apptio-report/articleshow/101250838.cms#:~:text=IBM%20is%20nearing%20a%20deal,the%20purchase%20price%20includes%20debt." class="blog-title">IBM nears $5 billion deal for software provider Apptio - WSJ</a>
              </h3>
          
              <p class="blog-meta">
                By <cite>Mr Ri Nguyen</cite> / <time datetime="2023-06-29">2023-06-29</time>
              </p>
          
            </div>
          
          </div>

          <div class="blog-card">
          
            <a href="#">
              <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BlogerYoutube.jpg" alt="EBT vendors: Claim Your Share of SNAP Online Revenue."
                class="blog-banner" width="300">
            </a>
          
            <div class="blog-content">
          
              <a href="#" class="blog-category">Technology</a>
          
              <h3>
                <a href="https://www.wsj.com/articles/googles-youtube-is-testing-an-online-games-offering-16d1e772" class="blog-title">YouTube is testing an online-games offering - WSJ</a>
              </h3>
          
              <p class="blog-meta">
                By <cite>Mr ThanhKing</cite> / <time datetime="2023-06-27">2023-06-27</time>
              </p>
          
            </div>
          
          </div>

          <div class="blog-card">
          
            <a href="#">
              <img src="/SpringMVCEmployee/URLToReachResourcesFolder/img/BlogerFacebook.jpg" alt="Curbside fashion Trends: How to Win the Pickup Battle."
                class="blog-banner" width="300">
            </a>
          
            <div class="blog-content">
          
              <a href="#" class="blog-category">Technology</a>
          
              <h3>
                <a href="https://www.cnn.com/2023/06/22/media/facebook-meta-canada-news-access/index.html#:~:text=Meta%20Platforms%20Inc%20plans%20to,the%20company%20said%20on%20Thursday." class="blog-title">Facebook to end news access in Canada over incoming law on paying publishers</a>
              </h3>
          
              <p class="blog-meta">
                By <cite>Mr ChatVan</cite> / <time datetime="2023-06-29">2023-06-29</time>
              </p>
          
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