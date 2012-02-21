class Propagander.Routers.Main extends Backbone.Router
  routes:
    '':     'index'

  initialize: ->
    Propagander.appunti = new Propagander.Collections.Appunti()
    Propagander.appunti.reset($('#items').data('appunti'))
    Propagander.clienti = new Propagander.Collections.Clienti()
    Propagander.clienti.reset($('#items').data('clienti'))
    # console.log @clienti
    # console.log @appunti
    
  index: ->
    view = new Propagander.Views.MainIndex()
    $('#container').html(view.render().el)
    Backbone.history.navigate("appunti", true)
    

  show: (id) ->
    appunto = Propagander.appunti.get(id)
  
    view = new Propagander.Views.AppuntiShow(model: appunto)
    $('#show').html(view.render().el)
