# App.GroupsIndexRoute = Ember.Route.extend
#   model: ->
#     App.Group.find({})
#   redirect: (model)->
#     firstItem = model.get('firstObject')
#     @replaceWith('groups.links', firstItem)

# App.GroupsLinksRoute = Ember.Route.extend
#   model: (param) ->
#     App.Group.find(param['group_id'])

#   setupController: (controller, model) ->
#     controller.set('content', model)
