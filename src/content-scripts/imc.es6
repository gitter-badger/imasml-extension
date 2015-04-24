// アイドルマスターズカップ

import selectVisible from './lib/select-visible';

(function main() {
  let form = document.getElementById('send-attack');
  if (!form) { return; }

  function eatCandy() {
    let buttons = form.querySelectorAll('.item-panel [data-is-usable="1"].choice');
    let button = buttons[buttons.length - 1];
    if (button) {
      button.click();
    }
  }
  // 1～5を押したらそのBPになるまで飴を押す
  // FIXME: 5 -> 1 -> 5 とか押すとおかしくなる
  document.addEventListener('keypress', (e) => {
    let n = e.keyCode - 0x30; // 0-9
    let button = form.querySelector(`.bp-button [data-value="${n}"]`);
    if (!button) { return; }
    // 飴使用をリセット
    for (let input of Array.from(form.querySelectorAll('.use-item-count'))) {
      input.value = "0";
    }
    // 足りなければ飴を使う
    for (let i = Number(form.max_bp.value); i < n; ++i) {
      eatCandy();
    }
    // 押す
    button.click();
    let submitButton = selectVisible('[type=submit]', form);
    submitButton.focus();
  }, false);
})();
