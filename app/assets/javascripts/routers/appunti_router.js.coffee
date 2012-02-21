class Propagander.Routers.Appunti extends Backbone.Router
  routes:
    'appunti/new':      'new'
    'appunti':          'index'
    'appunti/:id/edit': 'edit'
    'appunti/:id':      'show'


  initialize: ->
    @appunti = new Propagander.Collections.Appunti()
    @appunti.reset($('#items').data('appunti'))
    
  index: ->
    view = new Propagander.Views.AppuntiIndex(collection: @appunti)
    form = new Propagander.Views.AppuntiNew(collection: @appunti)
    
    console.log form
    
    $('#list').html(view.render().el)
    $('#form').html(form.render().el)
    
  show: (id) ->
    appunto = @appunti.get(id)
    view = new Propagander.Views.AppuntiShow(model: appunto)
    $('#show').html(view.render().el)

  edit: (id) ->
    appunto = @appunti.get(id)
    console.log appunto
    view = new Propagander.Views.AppuntiEdit(model: appunto)
    $('#show').html(view.render().el)
    
  new: (id) ->
    view = new Propagander.Views.AppuntiForm(model: appunto)
    $('#form').html(view.render().el)
    