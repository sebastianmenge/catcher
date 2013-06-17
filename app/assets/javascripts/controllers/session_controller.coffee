App.SessionsController = Ember.ObjectController.extend
  createSession: (fb, user)->
    App.Session.createRecord
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

    @get('store').commit()
