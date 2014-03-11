execute ->
  return unless _root?

  setinfotext = ->
    #return unless exportRoot.main_mc.infomation_mc?
    exportRoot.main_mc.infomation_mc.visible = true

    text = null
    if _root.bp_gain
      text = _root.bp_gain+'BP 回復';
    else if _root.is_rare?
      type = if _root.is_rare == "0" then '通常' else 'レア'
      text = type + 'フェス開催'
    else if _root.is_event == '1'
      text = 'ハート増加'
    else if _root.direc_type == '0'
      text = 'エリア終了'
    else if _root.text?
      text = _root.text.replace("\n", '')
    else
      text = '実際安い'

    if text?
      exportRoot.main_mc.infomation_mc.infotext_mc.infotext.text = text

  x = setInterval ->
    if exportRoot?.main_mc?
      clearInterval(x)
      setinfotext()
  , 100
