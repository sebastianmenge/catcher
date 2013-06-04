App.AddEntryView = Ember.View.extend
  classNames: ['add-entry']
  templateName: 'links/add_entry_field'

App.AddEntryFieldView = Ember.TextField.extend
  didInsertElement: ->
    @.$().bind 'paste', (e)->
      setTimeout ->
        url = e.target.value
        if e.type == 'paste'
          data =
            url: url
          $.ajax
            type: "POST"
            url: '/api/url_data.json'
            data: data
            dataType: "JSON"
        else
          # do something here
      ,0
  focusIn: ->
    # do something here
