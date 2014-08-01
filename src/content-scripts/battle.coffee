# 自動であめいっこ選ぶ
form = document.querySelector('form[action$="/battle/"]')
return unless form

buttons = form.querySelectorAll('.item-panel [data-is-usable="1"]')
itemButton = buttons[buttons.length-1]
submitButton = form.querySelector('[type=submit]')

# 現在のBPが0だったらダイアログを表示してあめいっこ選ぶ
if form.bp.value == '0'
  document.getElementById('fit-win').style.display = 'block'
  itemButton.click()

# 3を押したらBP3になるまで飴を押す
document.addEventListener 'keypress', (e) ->
  if e.keyCode == 0x33 # 3
    for i in [(form.bp|0)..3]
      itemButton.click()
    submitButton.focus()
, false
