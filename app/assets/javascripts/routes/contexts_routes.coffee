App.ContextsRoute = Ember.Route.extend
  model: ->
    App.Context.find({})
  redirect: (model)->
    firstItem = model.get('firstObject')
    @replaceWith('context', firstItem)

App.ContextIndexRoute = Ember.Route.extend()
  model: ->
      App.Group.find({})
  redirect: (model)->
    firstItem = model.get('firstObject')
    @replaceWith('context', firstItem)

# App.ContextsGroupsRoute = Ember.Route.extend
#   model: (param) ->
#     App.Context.find(param['context_id'])

#   setupController: (controller, model) ->
#     controller.set('content', model)

# App.ContextsGroupsIndexRoute = Ember.Route.extend
#   model: ->
#     App.Group.find()
#   redirect: (model)->
#     firstItem = model.get('firstObject')
#     @replaceWith('groups.links', firstItem)

# App.ContextsGroupsLinksRoute = Ember.Route.extend
#   model: (param) ->
#     App.Group.find(param['group_id'])

#   setupController: (controller, model) ->
#     controller.set('content', model)
