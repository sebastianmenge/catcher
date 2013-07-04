App.ContextsRoute = Ember.Route.extend
  model: ->
    App.Context.find()

App.ContextsIndexRoute = Ember.Route.extend
  model: ->
    App.Context.find({})
  redirect: (model) ->
    context = model.get('firstObject')
    group = model.get('firstObject.groups.firstObject')
    @replaceWith('groups.links', context, group)
