'use strict'
jQuery(document).ready ($) ->
  makeId = ->
    str = ""
    opt = "abcdefghijklmnopqrstuvwxyz"
    i = 1
    while i < 16
      str += opt.charAt(Math.floor(Math.random() * opt.length))
      i++
    'editor-' + str

  makeContainer = ($el) ->
    id = makeId()
    $nu = $('<div id="' + id + '"></div>')
    $el.after($nu)
    $nu

  match = ($textarea, $editor, editor) ->
    id = $editor.attr('id')
    height = editor.getSession().getScreenLength() * editor.renderer.lineHeight
    $textarea.val(editor.getValue())
    $('#' + id).css height: height
    $('#' + id + '-section').css height: height
    editor.resize()
    return

  init = (options) ->
    $textarea = options.textarea
    $textarea.css display: 'none'
    $container = makeContainer($textarea)
    id = $container.attr('id')
    editor = ace.edit(id)
    $editor = $('#' + id)
    $editor.css
      'margin-bottom': 30
      'max-width': 800
    editor.setTheme(options.theme)
    editor.getSession().setUseWrapMode(true)
    editor.getSession().setMode(options.mode)
    editor.setFontSize(16)
    editor.setValue($textarea.val(), -1)

    editor.on 'change', ->
      match($textarea, $editor, editor)

    match($textarea, $editor, editor)
    $('body').click

    editor

  $.fn.asAceEditor = (params) ->
    $t = $(this).eq(0)
    if $t.prop("tagName") != "TEXTAREA"
      return false

    defaults =
      textarea: $t
      theme: 'ace/theme/clouds'
      mode: 'ace/mode/markdown'
    options = $.extend(defaults, params)
    $t.data("ace-editor", init(options))
    return this

