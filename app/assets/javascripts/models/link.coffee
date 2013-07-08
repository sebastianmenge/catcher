App.Link = DS.Model.extend
  url:            DS.attr('string')
  title:          DS.attr('string')
  image_url:      DS.attr('string')
  favicon_url:    DS.attr('string')
  description:    DS.attr('string')
  group:          DS.belongsTo('App.Group')
  context_id:     DS.attr('string')
  created_at:     DS.attr('date')
  updated_at:     DS.attr('date')

  created: (->
    Date.parse(@get('created_at'))
  ).property('created_at')

  updated: (->
    Date.parse(@get('updated_at'))
  ).property('updated_at')

  rootUrl: (->
    url = @get('url')
    if url != undefined || null
      url.split("//").slice(1).join("")
    ).property('rootUrl', 'url')

  shortDescription: (->
    desc = @get('description')
    if desc != undefined || null
      "#{desc.substring(0, 130)}..."
    ).property('description')
