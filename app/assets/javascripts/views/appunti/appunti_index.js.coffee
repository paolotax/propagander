class Propagander.Views.AppuntiIndex extends Backbone.View

  template: JST['templates/appunti/index']
  
  events:
    "click  .clienti":     'navigateClienti'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendAppunto, this)
  
  render: ->
    $(@el).html(@template())
    @collection.each(@appendAppunto)
    this

  appendAppunto: (appunto) =>
    view = new Propagander.Views.Appunto(model: appunto)
    @$('#items').prepend(view.render().el)
    view.highlight()



  navigateClienti: ->
    console.log 'clienti'
    Backbone.history.navigate("clienti", true)
