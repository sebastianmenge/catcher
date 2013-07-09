App.LinkView = Ember.View.extend
  didInsertElement: ->
    @.$().hide().fadeIn(400)
  templateName: "links/link"
  classNames: ['link-element']
  attributeBindings: ['draggable']
  draggable: "true"

  dragStart: ->
    @.$().addClass('dragStart')

  dragEnd: ->
    @.$().removeClass('dragStart')
