App.FbLoginButtonView = Ember.View.extend
  tagName: 'button'
  classNames: ['fb-login-btn']
  click: ->
    FB.login ((response)->), {scope: 'email, user_birthday' }
