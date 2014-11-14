# エスケープを押すとダイアログが閉じる
document.addEventListener 'keydown', (e) ->
  return if e.keyCode != 0x1b
  selector = [
    '#fit-win-close',
    '#dialog-close',
    '.close-btn',
  ].join(', ')
  button = document.querySelector(selector)
  if button
    button.click()
    e.preventDefault()
, false
