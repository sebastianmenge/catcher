App.ProjectRoute = Ember.Route.extend
  model: ->
    App.Project.find()

App.ProjectsIndexRoute = Ember.Route.extend
  model: ->
    App.Project.find({})
  redirect: (model) ->
    project = model.get('firstObject')
    group = model.get('firstObject.groups.firstObject')
    @replaceWith('groups.links', project, group)
