# Control か Return かまんなかクリックで次のページへ
execute ->
  return unless _root?.next_url

  onkeydown = (e) ->
    if e.keyCode == 13 or e.ctrlKey
      go()

  onmousedown = (e) ->
    if e.button == 1
      go()

  go = ->
    location.href = _root.next_url
    document.removeEventListener('keydown', onkeydown, false)
    document.removeEventListener('mousedown', onmousedown, false)

  document.addEventListener('keydown', onkeydown, false)
  document.addEventListener('mousedown', onmousedown, false)
