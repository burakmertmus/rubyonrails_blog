App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $('#comments')

  connected: ->
  
  disconnected: ->

  

  received: (data) ->
    @collection().append(data['comment'])
    