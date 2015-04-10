/// フェスイベント用の雑なリンクを作る

let mainMenu = document.querySelector('.main-menu')
if (mainMenu) {
  mainMenu.insertAdjacentHTML(
    'beforeend',
    '<div>'+
    ' <a href=/app/index.php/fes/event_list accesskey=0>一覧(<u>0</u>)</a>'+
    ' <a href=/app/index.php/item/use_review/id/459 accesskey=9>棒(<u>9</u>)</a>'+
    '</div>');
}
