main = (document, location) ->
  currentUrl = location.pathname
  return if currentUrl.indexOf('/app/index.php/bazaar/') != 0
  pattern = new RegExp('/no/[0-9]+')

  container = document.createElement('ul')
  container.className = 'tab-flex tab-first-category'

  for n in [0..3]
    url = currentUrl.replace(/\/no\/[0-9]+|$/, '/no/'+n)
    li = document.createElement('li')
    container.appendChild(li)
    a = document.createElement('a')
    li.appendChild(a)
    li.className = 'tab-item'
    if url == currentUrl
      li.className += ' tab-base is-active'
    else
      a.className = 'tab-base'
      a.href = url
    a.appendChild(document.createTextNode(n))
  document.querySelector('.heading').insertAdjacentElement('beforebegin', container)

  container

main(document, location)
