class Propagander.Views.AppuntiEdit extends Backbone.View

  template: JST['templates/appunti/edit']

  events :
    "submit #edit_appunto" : "update"

  render: ->
    $(@el).html( @template(appunto: @model))
    this.$("form").backboneLink(@model)
    this
  
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.save(null,
      success : (appunto) =>
        @model = appunto
        Backbone.history.navigate("/appunti/#{@model.id}", true)
    )

