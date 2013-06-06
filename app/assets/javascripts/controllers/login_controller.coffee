App.LoginController = Ember.ObjectController.extend
  needs: ['facebookSession']
  checkStatus: (->
    @continue() if App.session.get('created') && App.User.current()?
    ).observes('controllers.facebookSession.session.created', 'controllers.facebookSession.session.user')

  continue: ->
    App.router.transitionTo('links')
