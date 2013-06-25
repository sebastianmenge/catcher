window.fbAsyncInit = ()->
  App.__container__.lookup('controller:facebookSession').FBinit()

App.FacebookSessionController = Ember.ObjectController.extend
  needs: ['session']
  initialized: false
  isConnected: false
  initData:
    appId      : "156557441193251"
    channelUrl : "http://localhost:3000/channel.html",
    status     : true,
    cookie     : true,
    xfbml      : true
  authData: {}
  content: {}

  FBinit: ->
    router = App.__container__.lookup('router:main')
    _.delay((=> @rescue()), 1500)
    FB.init(@initData)
    @fastFetch = _.once(@setSession)
    @longFetch = _.once(@getUser)
    @getUserData()

  rescue: ->
    return if @isConnected
    FB.getLoginStatus (response)=>
      @appCenter() unless response.status == "connected"

  getUserData: ->
    FB.Event.subscribe 'auth.authResponseChange', (response)=>
      @isConnected = response.status == "connected"
      @authData = @parseResponse(response.authResponse)
      @longFetch()
      @refreshToken()

  parseResponse: (data)->
    signed_request:         data.signedRequest
    oauth_token:            data.accessToken
    oauth_token_expires_at: data.expiresIn
    oauth_token_expires_in: data.expiresIn
    uid:                    data.userID
    expiresIn:              data.expiresIn

  refreshToken: ->
    _.delay((=>FB.getLoginStatus()), @authData.expiresIn * 100)

  appCenter: ->
    router = App.__container__.lookup('router:main')
    router.transitionTo 'landing_page'

  getUser: ->
    FB.api '/me', (response) =>
      @user_details = response
      @setSession()

  setSession: ->
    ctrl = @get('controllers.session')
    ctrl.create(@authData, @user_details)
