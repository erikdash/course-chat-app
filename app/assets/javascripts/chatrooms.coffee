# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  $header = $('#header')
  $new_message_form = $('#new-message')
  $new_message_body = $new_message_form.find('#contents')

  if $messages.length > 0
    App.chat = App.cable.subscriptions.create {
      channel: "ChatChannel"
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        if data['message']
          $new_message_body.val('')
          $messages.append data['message']

      send_message: (message, current_room) ->
        @perform 'send_message', message: message, current_room: current_room

    $new_message_form.submit (e) ->
      $this = $(this)
      contents = $new_message_body.val()
      App.chat.send_message contents, $header.text()

      e.preventDefault()
      return false
