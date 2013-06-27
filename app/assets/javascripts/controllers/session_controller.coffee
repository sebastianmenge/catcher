App.SessionController = Ember.ObjectController.extend
  needs: ['currentUser']
  create: (fb, user)->
    @transaction = @get('store').transaction();

    record = @transaction.createRecord App.Session,
      first_name: user.first_name
      last_name: user.last_name
      facebook_uid: user.id
      email: user.email
      birthday: user.birthday
      locale: user.locale
      timezone: user.timezone

      oauth_token: fb.oauth_token
      token_expires_at: fb.oauth_token_expires_at
      signed_request: fb.signed_request

    @set('content', record)

    @transaction.commit()
    @transaction = null

    record.on 'didCreate', (e)=>
      @setUser(record)
      @set('created', true)

  setUser: (user)->
    ctrl = @get('controllers.currentUser')
    ctrl.set('content', user)
