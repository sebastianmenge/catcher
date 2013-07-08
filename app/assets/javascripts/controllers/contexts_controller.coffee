App.ContextsIndexController = Ember.ObjectController.extend()

App.ContextsGroupsController = Ember.ObjectController.extend
  groups: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      sortProperties: ['created']
      sortAscending: true
      content: @get('content.groups')
  ).property('content.groups')

