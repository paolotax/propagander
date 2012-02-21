class Propagander.Collections.Clienti extends Backbone.Collection
  url: '/api/clienti'
  model: Propagander.Models.Cliente

  filterBy: (field, term) ->
    @filter (data) ->
      return data if data.get(field) == term