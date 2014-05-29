# 自動であめいっこ選ぶ
form = document.querySelector('form[action$="/battle/"]')
if form and form.bp.value == '0'
  document.getElementById('fit-win-open').click()
  itemButton = document.getElementById('item225') or document.getElementById('item8')
  itemButton.click()
