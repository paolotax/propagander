class Propagander.Views.Alert extends Backbone.View
  
  template: JST['templates/alert']
  
  initialize: () ->
    @options = this.options
    @render()
  
  render: ->
    $(".alert").remove()
    $(@el).html(@template(options: @options))
    this
    