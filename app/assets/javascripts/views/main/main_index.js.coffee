class Propagander.Views.MainIndex extends Backbone.View

  template: JST['templates/main']
  
  events:
    "click  .clienti":     'navigateClienti'
    "click  .appunti":     'navigateAppunti'
    
  initialize: ->
    # @collection.on('reset', @render, this)
    # @collection.on('add', @appendAppunto, this)
    
    
    
  
  render: ->
    $(@el).html(@template())
    this


  navigateClienti: ->
    Backbone.history.navigate("clienti", true)
  
  navigateAppunti: ->
    Backbone.history.navigate("appunti", true)
    
  
  
