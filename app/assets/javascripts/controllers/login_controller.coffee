App.LoginController = Ember.ObjectController.extend
  needs: ['facebookSession', 'sessions']

  checkStatus: (->
    @continue() if App.Session.get('created')
    console.log App.Session.get('created')
  ).observes('controllers.session.created')

  continue: ->
    App.router.transitionTo('links')
