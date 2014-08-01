# デッキの並び換えでページ遷移しない

return if location.href.indexOf('/deck') < 0

# xhr で取ってきて body を置き換える

replaceBody = (html) ->
  parser = new DOMParser()
  doc = parser.parseFromString(html, 'text/html')
  body = document.importNode(doc.body, true)
  document.documentElement.replaceChild(body, document.body)

document.addEventListener 'submit', (e) ->
  form = e.target
  return if form.action.indexOf('/execup/') < 0 # 「上に移動」のフォーム
  e.preventDefault()

  req = new XMLHttpRequest()
  req.open('POST', form.action)
  req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')

  req.addEventListener 'load', ->
    replaceBody(req.responseText)

  req.addEventListener 'error', ->
    alert('error')
    console.error('error', req)

  params = []
  for input in form.elements
    continue unless input.name
    params.push(encodeURIComponent(input.name)+'='+
                encodeURIComponent(input.value))
  req.send(params.join('&'))
