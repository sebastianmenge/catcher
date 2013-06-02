App.ApplicationRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'links'
