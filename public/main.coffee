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
        div = $("<div></div>").attr(class: "note#{n++ % 4 + 1} tile")
        span = $("<span class='text'></span>").text(x.text)
        div.append(span)
        div.append($("<br />"))
        div.append($("<div class='space'>"))
        span = $("<span class='screen_name'></span>")
        img = $("<img />").attr(src: x["user"]["profile_image_url"])
        span.append(img)
        span.append("<br />")
        link = $("<a></a>").attr(href: x["user"]["screen_name"]).text("@#{x['user']['screen_name']}")
        span.append(link)
        div.append(span)
        $(".ib-main-wrapper")
          .append(div)
      $(".tile").tile().autolink()
      $(".tile").attr(target : "_blank")
