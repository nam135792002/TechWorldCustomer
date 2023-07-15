$(document).ready(function(){
 $(".cart-item[data-id] input").on("input", function() {
    var id = $(this).closest(".cart-item").attr("data-id");
    var price = $(this).closest(".cart-item").attr("data-price");
    var quantity = $(this).val();
    $.ajax({
        url: "http://localhost:8080/SpringMVCEmployee/api/cart/update?id=" + id + "&quantity=" + quantity,
        success: function(response) {
            $("#cart-count").html(response[0]);
             var amount = response[1]; // Get the updated amount
	        var formattedTotal = (amount === 0) ? '0VND' : new Intl.NumberFormat('vi-VN').format(amount) + 'VND'; // Format the total
	        $("#cart-my-total").html(formattedTotal);
        }
    });
    var amount = quantity * price;
    var formattedAmount = amount.toLocaleString('vi-VN') + ' VND';
    $(this).closest(".cart-item").find(".amount-item").html(formattedAmount);
});


  $(".btn-cart-remove").click(function(){
    var id = $(this).closest(".cart-item").attr("data-id");
    $.ajax({
      url: "http://localhost:8080/SpringMVCEmployee/api/cart/remove?id="+id,
      success: function(response){
        $("#cart-count").html(response[0]);
             var amount = response[1]; // Get the updated amount
	        var formattedTotal = (amount === 0) ? '0VND' : new Intl.NumberFormat('vi-VN').format(amount) + 'VND'; // Format the total
	        $("#cart-my-total").html(formattedTotal);
      }
      });
      $(this).closest(".cart-item").remove();
  });
  $(".btn-cart-clear").click(function(){
	  $.ajax({
	      url: "http://localhost:8080/SpringMVCEmployee/api/cart/clear",
	      success: function(response){
	        $("#cart-count").html(0);
	        $(".cart-item").html("");
	      }
      });
  });
  $(".btn-star-heart").click(function(){
	var id = $(this).closest("div").attr("data-id");
	$.ajax({
		url:"http://localhost:8080/SpringMVCEmployee/api/cart/favo?id="+id,
		success: function(response){
			$("#cart-fav-count").html(response);
		}
	});
  });
});
