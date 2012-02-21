class Propagander.Collections.Appunti extends Backbone.Collection
  url: '/api/appunti'
  model: Propagander.Models.Appunto

  
  filterBy: (field, term) ->
    @filter (data) ->
      return data if data.get(field) == term
  
  sum: ->
    @reduce (data) ->
      console.log data
  
  search: (term) ->
    return this if term is ""
    
    pattern = new RegExp(term,"gi");
    return @filter (data) ->
      return pattern.test(data.get("note"))

  
  # var evens = _.filter([1, 2, 3, 4, 5, 6], function(num){ return num % 2 == 0; });
  
  # localStorage: new Store "Appunti"
