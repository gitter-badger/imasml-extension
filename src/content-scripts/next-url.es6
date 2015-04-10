// Control か Return かまんなかクリックで次のページへ

import unsafeCall from './lib/unsafe-call';

unsafeCall(function() {
  if (typeof _root !== 'object') { return; }
  if (!_root.next_url) { return; }

  let onkeydown = (e) => {
    if (e.keyCode === 13 || e.ctrlKey) { go(); }
  }

  let onmousedown = (e) => {
    if (e.button === 1) { go(); }
  }

  function go() {
    location.href = _root.next_url;
    document.removeEventListener('keydown', onkeydown, false);
    document.removeEventListener('mousedown', onmousedown, false);
  }

  document.addEventListener('keydown', onkeydown, false);
  document.addEventListener('mousedown', onmousedown, false);
});
