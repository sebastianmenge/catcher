App.GroupsRoute = Ember.Route.extend
  model: ->
    App.Group.find()

App.GroupsLinksRoute = Ember.Route.extend
  model: (param) ->
    App.Group.find(param['group_id'])

  setupController: (controller, model) ->
    controller.set('content', model)
