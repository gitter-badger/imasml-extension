# フェスリストを敵の最大HPでフィルター
return if location.href.indexOf('/fes/event_list') < 0

list = document.querySelector('.list-bg')
items = list.children
for fes, i in items
  m = fes.textContent.match(/HP\s+(\d+)\s*\/\s*(\d+)/)
  unless m
    console.log(fes, m)
    continue
  maxhp = m[2]|0
  # TODO: 入力できるようにする
  if maxhp < 6500000
    fes.style.height = '2em'
    fes.style.overflow = 'hidden'
  # ついでにアクセスキーを付ける
  button = fes.querySelector('[type=submit]')
  accesskey = String(i+1)
  button.setAttribute('accesskey', accesskey)
  if button.tagName == 'INPUT'
    button.value += ' '+accesskey
  else if button.tagName == 'BUTTON'
    button.innerHTML += ' '+accesskey
