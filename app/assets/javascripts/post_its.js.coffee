# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  SyntaxHighlighter.all()

  # Code for form
  if $('#new_post_it').length > 0

    render_preview = ->
      # SyntaxHighlighter.highlight() convert <pre> to <div>.
      # For making preview, we must reinsert <pre>, remove <div>,
      # and re-execute SyntaxHighlighter.highlight()
      language = $('#post_it_language').val().toLowerCase()
      if language == ''
        language = 'plain'

      preview = $('#preview')
      preview.after('<pre id="preview" class="brush: ' + language + ';"></pre>')
      preview.remove()
      $('#preview').html($('#post_it_content').val())
      SyntaxHighlighter.highlight()

    $('#post_it_content').keyup (e) ->
      render_preview()

    $('#post_it_language').change (e) ->
      render_preview()
