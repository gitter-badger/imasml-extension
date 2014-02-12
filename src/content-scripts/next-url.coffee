# Control か Return を押したら次のページへ
execute ->
  handler = (e) ->
    return unless _root?.next_url
    if e.keyCode == 13 or e.ctrlKey
      location.href = _root.next_url
      document.removeEventListener('keydown', handler, false)
  document.addEventListener('keydown', handler, false)
