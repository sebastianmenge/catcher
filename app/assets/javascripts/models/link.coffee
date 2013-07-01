App.Link = DS.Model.extend
  url:            DS.attr('string')
  title:          DS.attr('string')
  image_url:          DS.attr('string')
  favicon_url:        DS.attr('string')
  description:    DS.attr('string')
  group:          DS.belongsTo('App.Group')
  rootUrl: (->
    url = @get('url')
    if url != undefined || null
      url.split("//").slice(1).join("")
    ).property('rootUrl', 'url')
