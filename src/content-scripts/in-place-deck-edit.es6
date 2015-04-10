// デッキの並び換えでページ遷移しない

/// フォームの中身を XHR で送る
function submitXHR(form, callback) {
  let xhr = new XMLHttpRequest();
  xhr.open('POST', form.action);
  xhr.responseType = 'document';
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  xhr.addEventListener('load', () => callback(null, xhr));
  xhr.addEventListener('error', () => callback('error', null));

  let params = [];
  for (let input of form.elements) {
    if (!imput.name) { continue; }
    params.push(encodeURIComponent(input.name)+'='+
                encodeURIComponent(input.value));
  }
  xhr.send(params.join('&'));
}

(function main() {
  if (location.href.indexOf('/deck') < 0) { return; }

  // submit 時に xhr で取ってきて body を置き換える
  document.addEventListener('submit', (e) => {
    let form = e.target;
    if (form.action.indexOf('/execup/') < 0) { return; } // 「上に移動」のフォーム
    e.preventDefault();

    submitXHR(form, (err, xhr) => {
      if (err) {
        alert('error');
        console.error('error', err);
        return;
      }
      document.documentElement.replaceChild(
        document.importNode(xhr.response.body, true),
        document.body);
    });
  }, false);
})();
