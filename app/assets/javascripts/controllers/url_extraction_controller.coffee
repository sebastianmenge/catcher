App.UrlExtractionController = Ember.ObjectController.extend
  getUrlData: (url)->
    @set 'content', App.UrlExtraction.find(url)
