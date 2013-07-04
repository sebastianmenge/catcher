App.Router.map (match)->
  @resource 'contexts', ->
    @resource 'contexts.groups', path: "/:context_id/groups", ->
      @resource 'groups.links', path: ':group_id/links'
  @route 'login'
  @route 'landing_page'

