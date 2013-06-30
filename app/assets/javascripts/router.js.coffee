App.Router.map (match)->
  @resource 'groups', ->
    @resource 'groups.links', path: ':group_id/links'
  @route 'login'
  @route 'landing_page'

