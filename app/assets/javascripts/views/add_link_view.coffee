App.AddSearchLinkView = Ember.View.extend
  classNames: ['add-search-link']
  templateName: 'groups/add_search_link_field'

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
