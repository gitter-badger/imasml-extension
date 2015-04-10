// フェスリストを敵の最大HPでフィルター

(function main() {
  if (!new RegExp('/fes/event(_multi)?_list').test(location.href)) { return; }

  let list = document.querySelector('.list-bg');
  let items = list.children;

  for (let i = 0; i < items.length; ++i) {
    let fes = items[i];
    let m = fes.textContent.match(/HP\s+(\d+)\s*\/\s*(\d+)/);
    if (!m) { continue; }
    let maxhp = m[2]|0;
    // TODO: 入力できるようにする
    if (maxhp < 9000000) {
      fes.style.opacity = '0.6';
    }
    // ついでにアクセスキーを付ける
    let button = fes.querySelector('[type=submit]');
    let accesskey = String(i+1);
    button.setAttribute('accesskey', accesskey);
    if (button.tagName === 'INPUT') {
      button.value += ' '+accesskey;
    }
    else if (button.tagName === 'BUTTON') {
      button.innerHTML += ' '+accesskey;
    }
  }
})();
