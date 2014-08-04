# 「次のフェス結果へ」を上に持ってくる

return if location.href.indexOf('/fes/result/') < 0

closest = (e, name) ->
  name = name.toUpperCase()
  until e == null or e.nodeName == name
    e = e.parentNode
  e

a = document.querySelector('[href*="/fes/result/"]')
ul = closest(a, 'ul')
document.querySelector('.heading')
  .insertAdjacentElement('afterend', ul.cloneNode(true))
