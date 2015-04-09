visible = (element) ->
  v = (e) ->
    s = getComputedStyle(e)
    s.display != 'none' and
      s.visibility != 'hidden' and
      parseFloat(s.opacity) > 0

  e = element
  while e and e.nodeType == Node.ELEMENT_NODE
    return false unless v(e)
    e = e.parentNode
  return true

selectVisible = (selector, root=document) ->
  result = [].filter.call(root.querySelectorAll(selector), visible)[0]
  console.log('selectVisible', result, visible(result))
  result

selector = [
  '.execute-lesson.useitem-none',
  '.MainBtn :link',
  'button.MainBtn',
].join(', ')

setTimeout ->
  selectVisible(selector)?.focus()
, 0

# esc を押したら見えているボタンにフォカス
document.addEventListener 'keydown', (e) ->
  return if e.keyCode != 0x1b
  console.log(30, selectVisible(selector))
  setTimeout ->
    console.log(32, selectVisible(selector))
    selectVisible(selector)?.focus()
  , 0

# フォームがひとつだけ
if document.forms.length == 1
  button = document.forms[0].querySelector('[type=submit],button')
  button.focus() if button and visible(button)
