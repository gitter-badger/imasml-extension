defaultUserAgent = 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_2 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A4449d Safari/9537.53'

userAgent = defaultUserAgent

chrome.webRequest.onBeforeSendHeaders.addListener(
  (details) ->
    for header in details.requestHeaders
      if header.name == 'User-Agent'
        header.value = userAgent
    return {requestHeaders: details.requestHeaders}
  # filters
  , urls: ['http://imas.gree-apps.net/*', '*://*.gree.net/*']
  # extraInfoSpec
  , ['requestHeaders', 'blocking']
)

chrome.storage.sync.get userAgent: defaultUserAgent, (items) ->
  userAgent = items.userAgent

chrome.storage.onChanged.addListener (changes, areaName) ->
  return unless changes.userAgent
  userAgent = changes.userAgent.newValue

