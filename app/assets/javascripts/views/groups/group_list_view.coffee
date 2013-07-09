App.GroupListView = Ember.View.extend
  templateName: "groups/group_list_element"
  tagName: 'li'
  dragEnter: ->
    @.$().addClass('dragEnter')
  dragLeave: ->
    @.$().removeClass('dragEnter')

