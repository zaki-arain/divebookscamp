$(document).ready(function () {

  $(".tabs .tab-links a").on('click', function(event) {
  	var currentAttrValue = $(this).attr('href');

  	// show/hide tabs
  	$(this).parent('li').addClass('active').siblings().removeClass('active');

  	$(".tab-content").css("display", "none");
  	$(currentAttrValue).css("display", "block");
  	event.preventDefault();
  });
});