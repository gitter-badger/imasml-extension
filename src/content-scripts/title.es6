let path = location.pathname.replace(new RegExp('^/app/index.php/'), '');
let pathElements = path.split('/');

function findCaption() {
  console.log(pathElements);
  if (pathElements[0] === 'gasha') {
    return document.querySelector('.is-active').textContent + 'ガシャ';
  }
  else {
    // ドキュメントから取る
    let e = document.querySelector('.heading.cap-01, lounge-name');
    if (e) { return e.textContent; }
  }
  return null;
}

let caption = findCaption();
if (caption) {
  document.title = caption + ' - ' + document.title;
}
