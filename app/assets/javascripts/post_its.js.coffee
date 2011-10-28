# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  SyntaxHighlighter.all()

  ################################################
  # Code for index
  if $('#listing_post_it').length > 0

    #default value
    page = 1

    # get parameters from url
    getUrlVars = () ->
        vars = {}
        hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&')
        for value in hashes
            hash = value.split('=')
            vars[hash[0]] = hash[1];
        vars

    page = getUrlVars().page if getUrlVars().page != undefined
        


    update_listing = (display_notice = false) ->
      $('#listing_post_it .spinner').show()
      $.ajax(
        url: Routes.post_its_path({format: 'json'})
        dataType: 'json'
        data:
          page: page
        success: (values) ->
          if values
            content = $('#content')
            content.hide()
            dummy_post_it = $('#dummy_post_it')
            content.html('')

            for value in values
              post_it = dummy_post_it.clone()
              post_it.attr('id', '')
              post_it.find('a.title').text(value.title)
              post_it.find('.username').text(value.username)
              post_it.find('.updated_at').text(value.updated_at)
              post_it.find('a.title').attr('href', Routes.post_it_path(value.id))
              post_it.appendTo(content)
              post_it.show()

            content.show()
            $('#current_page').text(page)

            $('#notice_update').slideDown(
              200,
              () ->
                setTimeout('$(\'#notice_update\').slideUp(200)', 3000)
            ) if display_notice

        complete: () ->
          $('#listing_post_it .spinner').hide()
      )

    # used for detect if there is new post-it to show
    last_time = 0

    window.check_for_update = () ->
      $.ajax(
        url: Routes.last_updated_post_its_path({format: 'json'})
        dataType: 'json'
        success: (value) ->
          if value != null
            if new Date(value.updated_at).getTime() > last_time
              display_notice = (last_time != 0)
              update_listing(display_notice)
              last_time = new Date(value.updated_at).getTime()
      )
      setTimeout('window.check_for_update()', 10000)

    window.check_for_update()

    

    $('#previous_page').click (e) ->
      e.preventDefault()
      page -= 1
      update_listing()

    $('#next_page').click (e) ->
      e.preventDefault()
      page += 1
      update_listing()


  ################################################
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

    render_preview()
