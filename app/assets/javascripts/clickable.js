$(document).ready(function() {
  $('.clickable').on('click', function(event) {
    var windowUrl = window.location.href
    var targetId = $(this).attr('id')

    $.ajax({
      method: 'PUT',
      url: windowUrl,
      data: targetId
    }).done(function(response) {
      console.log(response)
    })
  })
});
