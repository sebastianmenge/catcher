App.Router.map (match)->
  @resource 'projects', ->
    @resource 'projects.groups', path: "/:project_id/groups", ->
      @resource 'groups.links', path: ':group_id/links'
  @route 'login'
  @route 'landing_page'

