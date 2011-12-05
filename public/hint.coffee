jQuery.fn.hint = (blurClass = 'blur') ->
  @.each ->
    $input = jQuery(this)
    title = $input.attr('title')
    $form = jQuery(this.form)
    $win = jQuery(window)
    remove = ->
      if ($input.val() is title) and $input.hasClass(blurClass)
        $input.val('').removeClass(blurClass)
    if title?
      $input.blur(->
        $input.val(title).addClass(blurClass) if this.value is ''
      ).focus(remove).blur()
      $form.submit(remove)
      $win.unload(remove)
