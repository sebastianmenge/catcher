App.AddLinkView = Ember.View.extend
  classNames: ['add-link']
  templateName: 'groups/add_link_field'

App.AddLinkFieldView = Ember.TextField.extend
  didInsertElement: ->
    @.$().bind 'paste', (e)->
      setTimeout ->
        url = e.target.value.split(".").join(" ")
        url = encodeURIComponent(url)
        if e.type == 'paste'
          ctrl = App.__container__.lookup('controller:urlExtraction')
          ctrl.getUrlData(url)
        else
          # do something here
      ,0
  focusIn: ->
    # do something here
