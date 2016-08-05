var refresh_page = function() {
  setInterval(function(){
  var windowUrl = window.location.href
    $.ajax({ method: "PUT",
     url: windowUrl
     }).done(function(response){
      console.log(response)
      $(".links-partial").html('')
      $(".links-partial").append(response)
     })
}, 3000)};
