class Propagander.Views.AppuntiShow extends Backbone.View

  template: JST['templates/appunti/show']
  
  events:
    "click .destroy": 'destroyAppunto'
    "click .edit":    'editAppunto'
      
  initialize: ->
    # @appunti.on('reset', @render, this)
    # @appunti.on('add', @appendAppunto, this)
    
  render: ->
    $(@el).html( @template(appunto: @model))
    this
  
  destroyAppunto: ->
    @model.destroy()
    this.remove()
    Backbone.history.navigate("/appunti", true)
    
    options =
      titolo: "Peccato!"
      messaggio: "Hai eliminato un appunto"
      tipo: "info"
    view = new Propagander.Views.Alert(options)
    $(".content-header").append(view.el)
    
  
  editAppunto: ->
    Backbone.history.navigate("/appunti/#{@model.id}/edit", true)
  
  
