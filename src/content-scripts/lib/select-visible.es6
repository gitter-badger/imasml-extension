// 祖先を辿って可視であるかどうか
function visible(element) {
  let v = (e) => {
    let s = getComputedStyle(e);
    return s.display !== 'none' &&
      s.visibility !== 'hidden' &&
      (s.opacity === '' || parseFloat(s.opacity) > 0);
  };
  for (let e = element; e && e.nodeType === Node.ELEMENT_NODE; e = e.parentNode) {
    if (!v(e)) { return false; }
  }
  return true;
}

// 見える要素を返すk
export default function selectVisible(selector, root=document) {
  return [].filter.call(root.querySelectorAll(selector), visible)[0];
}
