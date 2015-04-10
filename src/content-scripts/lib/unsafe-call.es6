/// contentWindow で関数を実行する
export default function unsafeCall(f) {
  let script = document.createElement('script');
  script.textContent = '(' + f.toString() + ')()';
  document.body.appendChild(script);
}
