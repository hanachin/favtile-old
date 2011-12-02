$ ->
  $(".tile").tile().autolink()
  $(".tile").mouseenter ->
    $(this).fadeTo("fast", 0.8, => $(this).fadeTo("fast", 1))
  $("#fav").click ->
    location.href = "/#{$('#username').val()}"
    false
