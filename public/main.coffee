$ ->
  $(".tile").tile()
  $("#fav").click ->
    location.href = "/#{$('#username').val()}"
