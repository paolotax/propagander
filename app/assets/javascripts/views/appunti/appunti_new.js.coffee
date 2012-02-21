class Propagander.Views.AppuntiNew extends Backbone.View

  template: JST['templates/appunti/new']

  events:
    "submit #new_appunto": 'createAppunto'
    # "blur   #new_appunto_cliente_titolo": 'getClienteId'

  render: ->
    $(@el).html( @template(appunto: @model))
    
    this.$("#new_appunto_cliente_titolo").typeahead
      source: Propagander.clienti.pluck("titolo")
      items: 8

    this

  getClienteId: ->
    console.log 'get'
    item = Propagander.clienti.filterBy("titolo", $("#new_appunto_cliente_titolo").val())
    console.log item.length
    if item.length is 1 
      item[0].get('id') 
    else
      console.log 'noooo'
      options =
        titolo: 'Oooops!'
        tipo: 'error'
        messaggio: 'Impossibile salvare questo appunto!'
        errors: "errors"
        
      view = new Propagander.Views.Alert(options)
      $(".content-header").append(view.el)
      console.log view

  createAppunto: (e) ->
    e.preventDefault()
    cliente_id = @getClienteId()
    
    attributes = 
      note:           $('#new_appunto_note').val()
      cliente_id:     cliente_id
      cliente_titolo: $('#new_appunto_cliente_titolo').val()
      user_id:        1
      stato:          ""
      destinatario:   $('#new_appunto_destinatario').val()
      data:           new Date().toISOString();


    @collection.create attributes,
      wait: true
      success: (@model) -> 
        $('#new_appunto')[0].reset()
        this.$('#new_appunto_cliente_titolo').focus()
        Backbone.history.navigate("appunti/#{@model.get('id')}", true)
        
        options =
          titolo: 'Bravo!'
          tipo: 'success'
          messaggio: 'Hai inserito un appunto'
        
        view = new Propagander.Views.Alert(options)
        this.$(".content-header").append(view.el)
        console.log view
        
      error: @handleError

  handleError: (appunto, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      
      options =
        titolo: 'Oooops!'
        tipo: 'error'
        messaggio: 'Impossibile salvare questo appunto!'
        errors: errors
        
      view = new Propagander.Views.Alert(options)
      this.$(".content-header").append(view.el)
      console.log view
        
        
        
        