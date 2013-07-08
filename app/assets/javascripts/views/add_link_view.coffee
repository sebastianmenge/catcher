App.AddLinkFieldView = Ember.TextField.extend
  didInsertElement: ->
    @.$().bind 'paste', (e)=>
      setTimeout =>
        url = e.target.value
        safeUrl = url.split(".").join(" ")
        encodedUrl = encodeURIComponent(safeUrl)
        if e.type == 'paste'
          regex = new RegExp("/((http|https):\/\/(\w+:{0,1}\w*@)?(\S+)|)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/")
          test = regex.test(url)
          ctrl = @get('controller')
          if test
            ctrl.getUrlData(encodedUrl)
            ctrl.set('isPasted', true)
          else
            alert "Whoops! Seems not be a Url"
            ctrl.set('isPasted', false) if ctrl.get('isPasted') == true
        else
          # do something here
      ,0
  focusIn: ->
    # do something here
