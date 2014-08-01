# フェスイベント用の雑なリンクを作る
mainMenu = document.querySelector('.main-menu')
return unless mainMenu

mainMenu.insertAdjacentHTML(
 'beforeend',
 """
 <div>
  <a href=/app/index.php/fes/event_list accesskey=0>一覧(<u>0</u>)</a>
  <a href=/app/index.php/item/use_review/id/246 accesskey=9>棒(<u>9</u>)</a>
 </div>
 """)
