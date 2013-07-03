App.Router.map (match)->
  @resource 'context', path: "/context/:context_id", ->
    @resource 'groups', path: '/groups/:group_id', ->
      @route 'links'
  @route 'login'
  @route 'landing_page'

