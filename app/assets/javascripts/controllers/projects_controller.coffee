App.ProjectsIndexController = Ember.ObjectController.extend()

App.ProjectsGroupsController = Ember.ObjectController.extend
  groups: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      sortProperties: ['created']
      sortAscending: true
      content: @get('content.groups')
  ).property('content.groups')

  createGroup: ->
    name = @getProperties 'groupname'
    if name.groupname == undefined || null || ""
      alert "Whoops! Please enter a name"
    else
      @save(name)

  save: (name)->
    data =
      project_id: @get('controllers.projectsGroups.content.id')
      name: name.groupname

    @transaction = @get('store').transaction();
    group = @transaction.createRecord App.Group,
      data

    @get("groups").addObject(group)
    @transaction.commit()
    @transaction = null

    group.on 'didCreate', (e)=>
      console.log e
      @resetField()
      project = @get('content')
      @replaceRoute('groups.links', project, e)

    group.on 'becameInvalid', (e)=>
      alert "Something went wrong here."

    group.on 'becameError', (e)=>
      alert "Something went wrong here."

  resetField: ->
    @setProperties({groupname: ""})
