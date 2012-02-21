class Propagander.Views.ClientiIndex extends Backbone.View

  template: JST['templates/clienti/index']


  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendCliente, this)
  
  render: ->
    $(@el).html(@template())
    @collection.each(@appendCliente)
    this
  
  appendCliente: (cliente) =>
    console.log "cliente"
    view = new Propagander.Views.Cliente(model: cliente)
    @$('#items').append(view.render().el)


