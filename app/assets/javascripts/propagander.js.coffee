window.Propagander =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Propagander.Routers.Main()
    new Propagander.Routers.Appunti()
    new Propagander.Routers.Clienti()
    Backbone.history.start(pushState: true)
    

$(document).ready ->
  Propagander.init()
