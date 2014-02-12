this.execute = (f) ->
  script = document.createElement('script')
  script.textContent = '('+f.toString()+')()'
  document.body.appendChild(script)
