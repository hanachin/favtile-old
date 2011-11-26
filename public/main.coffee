$ ->
  $("#fav").click ->
    location.href = "/#{$('#username').val()}"
