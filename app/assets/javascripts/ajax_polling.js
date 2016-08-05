var refresh_page = setInterval(function(){
  var windowUrl = window.location.href
    $.ajax({ method: "PUT",
     url: windowUrl
     }).done(function(response){
      $(".links-partial").html('')
      $(".links-partial").append(response)
     })
}, 3000);
