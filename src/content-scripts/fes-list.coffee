# フェスリストを敵の最大HPでフィルター
return unless new RegExp('/fes/event(_multi)?_list').test(location.href)

list = document.querySelector('.list-bg')
items = list.children
for fes, i in items
  m = fes.textContent.match(/HP\s+(\d+)\s*\/\s*(\d+)/)
  unless m
    continue
  maxhp = m[2]|0
  # TODO: 入力できるようにする
  if maxhp < 6500000
    fes.style.opacity = '0.6'
  # ついでにアクセスキーを付ける
  button = fes.querySelector('[type=submit]')
  accesskey = String(i+1)
  button.setAttribute('accesskey', accesskey)
  if button.tagName == 'INPUT'
    button.value += ' '+accesskey
  else if button.tagName == 'BUTTON'
    button.innerHTML += ' '+accesskey
