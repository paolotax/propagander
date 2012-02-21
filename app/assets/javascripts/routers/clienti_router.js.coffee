class Propagander.Routers.Clienti extends Backbone.Router
  routes:
    'clienti':     'index'
    # 'clienti/:id': 'show'

  initialize: ->
    @clienti = new Propagander.Collections.Clienti()
    @clienti.reset($('#items').data('clienti'))


  index: ->
    view = new Propagander.Views.ClientiIndex(collection: @clienti)
    $('#items').html(view.render().el)

  # show: (id) ->
  #   cliente = @clienti.get(id)
  #   
  #   view = new Propagander.Views.ClienteShow(model: cliente)
  #   $('#show').html(view.render().el)

