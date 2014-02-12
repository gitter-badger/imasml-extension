# page action のアイコンを表示する

chrome.tabs.onUpdated.addListener (tabId) ->
  chrome.pageAction.show(tabId)
