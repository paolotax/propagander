class Propagander.Views.Cliente extends Backbone.View
  
  template: JST['templates/clienti/cliente']
  
  tagName: 'li'
  
  events:
    'click': 'showEntry'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('highlight', @highlightWinner, this)
    
  showEntry: ->
    Backbone.history.navigate("clienti/#{@model.get('id')}", true)
    @highlight()
    
  highlight: ->
    $(".selected", $(@el).parent()).removeClass('selected')
    $(@el).addClass('selected')

  render: ->
    $(@el).html(@template(cliente: @model))
    this