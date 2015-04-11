import unsafeCall from './lib/unsafe-call';

unsafeCall(function() {
  if (typeof _root !== 'object') { return; }

  function setinfotext() {
    let text = null;
    if (_root.bp_gain) {
      text = _root.bp_gain+'BP 回復';
    }
    else if (_root.is_rare) {
      let type = _root.is_rare == "0" ? '通常' : 'レア';
      text = type + 'フェス開催';
    }
    else if (_root.is_event == '1') {
      // TODO カード獲得もここにきてしまう
      text = 'ハート増加';
    }
    else if (_root.direc_type == '0') {
      text = 'エリア終了';
    }
    else if (_root.text) {
      text = _root.text.replace("\n", '');
    }

    if (text) {
      exportRoot.main_mc.infomation_mc.visible = true;
      exportRoot.main_mc.infomation_mc.infotext_mc.infotext.text = text;
    }
  }

  // exportRoot.main_mc が出来るまで待つ
  let timer = setInterval(() => {
    if (typeof exportRoot !== 'object') { return; }
    if (typeof exportRoot.main_mc !== 'object') { return; }
    clearInterval(timer);
    setinfotext();
  }, 100);
});
