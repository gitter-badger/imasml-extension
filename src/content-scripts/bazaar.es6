// バザーの世界を切り替える
(function main() {
  let currentUrl = location.pathname;
  if (currentUrl.indexOf('/app/index.php/bazaar/') != 0) { return; }

  let container = document.createElement('ul');
  container.className = 'tab-flex tab-first-category';
  document.querySelector('.heading').insertAdjacentElement('beforebegin', container);

  for (let n = 0; n <= 3; ++n) {
    let url = currentUrl.replace(/\/no\/[0-9]+|$/, '/no/'+n);
    let li = document.createElement('li');
    container.appendChild(li);
    let a = document.createElement('a');
    li.appendChild(a);
    li.className = 'tab-item';
    if (url === currentUrl) {
      // TODO classList
      li.className += ' tab-base is-active';
    }
    else {
      a.className = 'tab-base';
      a.href = url;
    }
    a.appendChild(document.createTextNode(String(n)));
  }
})();
