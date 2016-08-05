$(document).ready(function() {
  $('.links-partial').on('click', '.clickable', function(event) {
    var windowUrl = window.location.href
    var targetId = $(this).attr('id')

    $.ajax({
      method: 'PUT',
      url: windowUrl,
      data: {id_to_update: targetId }
    }).done(function(response) {
      $(".links-partial").html('')
      $(".links-partial").append(response)
    })
  })
});
