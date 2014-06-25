# 自動であめいっこ選ぶ
form = document.querySelector('form[action$="/battle/"]')
if form and form.bp.value == '0'
  document.getElementById('fit-win').style.display = 'block'
  itemButton = document.querySelector('.item-panel [data-is-usable="1"]:last-child')
  itemButton.click()
