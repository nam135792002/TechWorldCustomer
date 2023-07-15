<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>
<!DOCTYPE html>
<html>
<head>
	<title>Invoice</title>
	<link rel="stylesheet" type="text/css" href="/SpringMVCEmployee/URLToReachResourcesFolder/css/Invoice.css">
</head>
<body>
<input type="hidden" id="status" value="${status}">
<section>
  <div class="invoice">
    <div class="invoice_info">
      <div class="i_row">
        <div class="i_logo">
          <h1>Tech World</h1>
        </div>
        <div class="title">
          <h1>INVOICE</h1>
        </div>
      </div>
      <div class="i_row">

        <div class="i_to">
          <div class="main_title">
            <p>Invoice To</p>
          </div>
          <div class="p_title">
            <p>${orderDTO.customerDTO.nameCustomer}</p>
            <p>${orderDTO.customerDTO.phoneNumber}</p>
          </div>
          <div class="p_title">
            <p>${orderDTO.customerDTO.email}</p>
            <p>${orderDTO.customerDTO.address}</p>
          </div>
        </div>
        <div class="i_details text_right">
          <div class="main_title">
            <p>Invoice details</p>
          </div>
          <div class="p_title">
            <p>Invoice No:</p>
            <span>${orderDTO.codeOrder}</span>
          </div>
          <div class="p_title">
            <p>Invoice Date:</p>
            <span>${orderDTO.dateOrder}</span>
          </div>
        </div>
      </div>
      <div class="i_row">
        <div class="i_payment">
          <div class="main_title">
            <p>Info Connect</p>
          </div>
          <div class="p_title">
            <p>Email:</p>
            <span>phuongnama32112002@gmail.com</span>
          </div>
          <div class="p_title">
            <p>Phone number:</p>
            <span>0334069054</span>
          </div>
        </div>
        <div class="i_duetotal text_right">
          <div class="main_title">
            <p>Total Due</p>
          </div>
          <div class="p_title">
            <p>Amount In VND:</p>
            <span><fmt:formatNumber value="${orderDTO.total}" pattern="###,###,###"/>VND</span>
          </div>
        </div>
      </div>
    </div>
    <div class="invoice_table">
      <div class="i_table">
        <div class="i_table_head">
          <div class="i_row">
            <div class="i_col w_55">
              <p class="p_title">DESCRIPTION</p>
            </div>
            <div class="i_col w_15 text_center">
              <p class="p_title">QTY</p>
            </div>
            <div class="i_col w_15 text_center">
              <p class="p_title">PRICE</p>
            </div>
            <div class="i_col w_15 text_right">
              <p class="p_title">TOTAL</p>
            </div>
          </div>
        </div>
        <div class="i_table_body">
          <c:forEach var="product" items="${orderDTO.listProduct}">
          	<div class="i_row">
	            <div class="i_col w_55">
	              <span>${product.nameProduct}</span>
	            </div>
	            <div class="i_col w_15 text_center">
	              <p>${product.quantity}</p>
	            </div>
	            <div class="i_col w_15 text_center">
	              <p><fmt:formatNumber value="${product.unitPrice}" pattern="###,###,###"/>VND</p>
	            </div>
	            <div class="i_col w_15 text_right">
	              <p><fmt:formatNumber value="${product.unitPrice*product.quantity}" pattern="###,###,###"/>VND</p>
	            </div>
	          </div>
          </c:forEach>
        </div>
        <div class="i_table_foot">
          <div class="i_row grand_total_wrap">
            <div class="i_col w_50">
              <p>GRAND TOTAL:</p>
            </div>
            <div class="i_col w_50 text_right">
              <p><fmt:formatNumber value="${orderDTO.total}" pattern="###,###,###"/>VND</p>
            </div>
          </div>
        </div>
      </div>

    </div>
    <div class="invoice_terms">
      <div class="main_title">
        <p>Description</p>
      </div>
      <p>${orderDTO.customerDTO.description}</p>
    </div>
  </div>
  <div class="btn-finish">
    <button onclick="window.location.href='<%=request.getContextPath()%>/order/finish';">Finish</button>
  </div>
</section>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status === "success") {
			swal("Congrats", "Your order created Successfully", "success");
		}
	</script>
</body>
</html>