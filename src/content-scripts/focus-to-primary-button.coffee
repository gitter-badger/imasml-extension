selector = '.execute-lesson.useitem-none, .MainBtn :link, .MainBtn';
button = document.querySelector(selector)
if button
  button.focus();
  return

# フォームがひとつだけ
if document.forms.length == 1
  button = document.forms[0].querySelector('[type=submit],button')
  button.focus() if button
