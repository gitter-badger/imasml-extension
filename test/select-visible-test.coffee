selectVisible = require '../src/content-scripts/lib/select-visible'
assert = chai.assert

describe 'selectVisible', ->
  it '見えるやつを返す', ->
    fixture = require('./fixtures/select-visible.html')
    document.getElementById('mocha').innerHTML = fixture

    assert.equal(
      selectVisible('button'),
      document.getElementById('visible-button'))
