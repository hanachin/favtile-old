$ ->
  $(".tile").tile().autolink()
  $(".tile a").attr(target : "_blank")
  $(".tile").mouseenter ->
    $(this).fadeTo("fast", 0.8, => $(this).fadeTo("fast", 1))

  $("#fav").click ->
    location.href = "/#{$('#username').val()}"
    false
  username = $('#username').val()
  return unless username

  page = location.href.match /\/([0-9]+)$/
  page = 2 unless page?
  window["doInTheBottom"] = ->
    console.log "bottom"
    $.getJSON "/#{username}/#{page++}", (data) ->
      n = 0
      for x in data
        $(".ib-main-wrapper").append($("<div></div>").attr(class: "note#{n++ % 4 + 1} tile").text(x.text))
      $(".tile").tile().autolink()
      $(".tile").attr(target : "_blank")
