App.ApplicationRoute = Ember.Route.extend()

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'login'
