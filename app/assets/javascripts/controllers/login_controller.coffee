App.LoginController = Ember.ObjectController.extend
  needs: ['session']

  checkStatus: (->
    created = @get('controllers.session.content.created')
    @continue() if created
  ).observes('controllers.session.content.created')

  continue: ->
    @transitionToRoute('contexts')
