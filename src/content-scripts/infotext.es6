import unsafeCall from './lib/unsafe-call';

unsafeCall(function() {
  if (typeof _root !== 'object') { return; }

  function setinfotext() {
    console.debug(
      [].filter.call(
        document.querySelectorAll('script'),
        e => e.textContent.indexOf('_root.next_url =') > 0)[0].textContent);
    console.debug(method);

    let text = null;
    switch (method) {
    case "bus_normal_c0_d0":
      text = 'エリア終了';
      break;
    case "bus_normal_c0_d1":
      // カード獲得
      text = _root.text.replace("\n", '');
      break;
    case "bus_normal_c0_d1":
      // コミュでバースト
      text = _root.dtalk.replace('\n', '');
      break;
    case "bus_normal_c1_d7":
      text = 'ハート増加'; // 通常営業？
      break;
    case "bus_normal_c2_d3":
    case "bus_normal_c3_d3":
      text = _root.bp_gain+'BP 回復';
      break;
    case "bus_normal_c2_d7":
      text = 'ハート増加'; // イベント営業？
      break;
    case 'bus_normal_c2_d4':
      // コミュ？
      text = _root.dtalk.replace('\n', '');
      break;
    case 'bus_normal_c3_d2':
      // 弱いフェス (イベントフェス？)
      text = '通常フェス開催';
      break;
    case 'bus_normal_c3_d4':
      // コミュ？
      text = _root.dtalk.replace('\n', '');
      break;
    case 'bus_normal_c5_d2':
      // 強いフェス (イベントフェス？)
      text = 'レアフェス開催';
      break;
    default:
      if (_root.is_rare) {
        let type = _root.is_rare === "0" ? '通常' : 'レア';
        text = type + 'フェス開催';
      }
      else if (_root.dtalk) {
        text = _root.dtalk.replace("\n", '');
      }
      else if (_root.text) {
        text = _root.text.replace("\n", '');
      }
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
