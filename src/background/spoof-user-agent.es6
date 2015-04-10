/* global chrome */

const defaultUserAgent = 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_2 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A4449d Safari/9537.53';

var userAgent = defaultUserAgent;

chrome.webRequest.onBeforeSendHeaders.addListener(
  (details) => {
    for (let header of details.requestHeaders) {
      if (header.name === 'User-Agent') {
        header.value = userAgent;
      }
    }
    return {requestHeaders: details.requestHeaders};
  },
  // filters
  {urls: ['http://imas.gree-apps.net/*', '*://*.gree.net/*']},
  // extraInfoSpec
  ['requestHeaders', 'blocking']
);

chrome.storage.sync.get({userAgent: defaultUserAgent}, (items) => {
  userAgent = items.userAgent;
});

chrome.storage.onChanged.addListener((changes, areaName) => {
  if (!changes.userAgent) { return; }
  userAgent = changes.userAgent.newValue;
});
