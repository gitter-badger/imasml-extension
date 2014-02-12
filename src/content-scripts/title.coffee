path = location.pathname.replace(new RegExp('^/app/index.php/'))
pathElements = path.split('/')

findCaption = ->
  if path[0] == 'gasha'
    document.querySelector('a.selected').textContent + 'ガシャ'
  else
    # ドキュメントから取る
    selector = '.heading.cap-01, lounge-name'
    document.querySelector(selector)?.textContent

if caption = findCaption()
  document.title = caption + ' - ' + document.title
