class Propagander.Views.Appunto extends Backbone.View
  
  template: JST['templates/appunti/appunto']
  
  events:
    'click': 'showEntry'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('highlight', @highlightWinner, this)
    
  showEntry: ->
    Backbone.history.navigate("appunti/#{@model.get('id')}", true)
    @highlight()
    
  highlight: ->
    $(".selected", $(@el).parent()).removeClass('selected')
    $(@el).addClass('selected')

  render: ->
    $(@el).html(@template(appunto: @model))
    this.$('time.timeago').timeago()
    this