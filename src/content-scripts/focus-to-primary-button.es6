import selectVisible from './lib/select-visible';

function focus() {
  var selector = [
    '.execute-lesson.useitem-none',
    '.MainBtn :link',
    'button.MainBtn',
  ].join(', ');

  setTimeout(() => {
    let e = selectVisible(selector);
    if (e) { e.focus(); }
  }, 0);
}

(function main () {
  focus();

  // esc を押したらダイアログを閉じるはずなので見えているボタンにフォーカスを移す
  document.addEventListener('keydown', (event) => {
    if (event.keyCode !== 0x1b) { return; }
    focus();
  });

  // フォームがひとつだけ
  if (document.forms.length === 1) {
    let e = selectVisible('[type=submit],button', document.forms);
    if (e) { e.focus(); }
  }
})();
