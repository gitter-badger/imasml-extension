// 「次のフェス結果へ」を上に持ってくる

function closest(e, name) {
  name = name.toUpperCase();
  while (e = e.parentNode) {
    if (e.nodeName === name) { return e; }
  }
  return null;
}

(function main() {
  if (location.href.indexOf('/fes/result/') < 0) { return; }

  let a = document.querySelector('[href*="/fes/result/"]');
  if (!a) { return }
  let ul = closest(a, 'ul');
  document.querySelector('.heading')
    .insertAdjacentElement('afterend', ul.cloneNode(true));
})();
