App.ProjectsGroupsIndexController = Ember.ObjectController.extend()

App.GroupsLinksController = Ember.ObjectController.extend
  links: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin, Ember.ControllerMixin,
      sortProperties: ['created']
      sortAscending: false
      content: @get('content.links')
  ).property('content.links')



