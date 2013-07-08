App.UrlExtractionController = Ember.ObjectController.extend
  needs: ['contextsGroups', 'groupsLinks']
  isPasted: false
  dataReturned: false
  getUrlData: (url)->
    record = App.UrlExtraction.find(url)
    content = @set 'content', record
    record.on 'didLoad', =>
      @set 'dataReturned', true

  resetPreview: ->
    @set 'isPasted', false
    _.delay((=>
      @set('content', {})
      $('.add-link input').val("")
    ), 700)

  save: ->
    contextId =
      context_id: @get('controllers.contextsGroups.content.id')
    urlDetails = @get('content._data.attributes')
    result = $.extend({}, contextId, urlDetails);

    @transaction = @get('store').transaction();
    link = @transaction.createRecord App.Link,
      result

    group = @get('controllers.groupsLinks.content')
    group.get("links").addObject(link)

    @transaction.commit()
    @transaction = null

    link.on 'didCreate', (e)=>
      _.delay((=>@resetPreview()), 1100)
