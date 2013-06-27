App.UrlExtractionController = Ember.ObjectController.extend
  content: {}
  getUrlData: (url)->
    @set 'content', App.UrlExtraction.find(url)
