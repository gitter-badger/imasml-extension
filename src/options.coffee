defaults =
  userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_2 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A4449d Safari/9537.53'

initialize = ->
  inputs = document.querySelectorAll('input')
  chrome.storage.sync.get (input.name for input in inputs), (items) ->
    console.log('items', items)
    for input in inputs
      key = input.name
      input.value = items[key] or defaults[key]

save = (callback) ->
  inputs = document.querySelectorAll('input')
  items = {}
  for input in inputs
    items[input.name] = input.value
  console.log('items', items)
  chrome.storage.sync.set items, ->
    callback?()

document.getElementById('save').addEventListener 'click', (e) ->
  save ->
    window.close()
, false

document.getElementById('cancel').addEventListener 'click', (e) ->
  window.close()
, false

document.getElementById('clear').addEventListener 'click', (e) ->
  chrome.storage.sync.clear()
, false

## 適用ボタン
applyButton = document.getElementById('apply')
applyButton.disabled = true
document.addEventListener 'change', ->
  applyButton.disabled = false
, false
applyButton.addEventListener 'click', (e) ->
  save ->
    applyButton.disabled = true
, false


initialize()
