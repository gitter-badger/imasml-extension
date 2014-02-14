defaultUserAgent = 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_2 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A4449d Safari/9537.53'
ruleId = 'spoofUserAgent'
updateRules = (userAgent) ->
  chrome.declarativeWebRequest.onRequest.removeRules([ruleId])
  chrome.declarativeWebRequest.onRequest.addRules [
    id: ruleId
    conditions: [
      new chrome.declarativeWebRequest.RequestMatcher
        url: {hostEquals: 'imas.gree-apps.net'}
    ]
    actions: [
      new chrome.declarativeWebRequest.SetRequestHeader
        name: 'User-Agent'
        value: userAgent
    ]
  ]

chrome.storage.sync.get 'userAgent', (items) ->
  userAgent = items.userAgent or defaultUserAgent
  updateRules(userAgent)

chrome.storage.onChanged.addListener (changes, areaName) ->
  return unless changes.userAgent
  return if changes.userAgent.newValue == changes.userAgent.oldValue
  updateRules(changes.userAgent.newValue)

return
chrome.webRequest.onBeforeSendHeaders.addListener(
  (details) ->
    for header in details.requestHeaders
      if header.name == 'User-Agent'
        header.value = 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_2 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A4449d Safari/9537.53'
    return requestHeaders: details.requestHeaders
  # filters
  , urls: ["http://imas.gree-apps.net/*"]
  # extraInfoSpec
  , ["requestHeaders", "blocking"]
)
