App.LinkView = Ember.View.extend
  didInsertElement: ->
    @.$().hide().fadeIn(600)
  templateName: "links/link"
  classNames: ['link-element']
  attributeBindings: ['draggable']
  draggable: "true"
