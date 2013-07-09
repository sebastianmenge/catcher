App.Group = DS.Model.extend
  name:       DS.attr('string')
  isPublic:   DS.attr('boolean')
  created_at: DS.attr('date')
  updated_at: DS.attr('date')

  project:    DS.belongsTo('App.Project')
  links:      DS.hasMany('App.Link')

  created: (->
    Date.parse(@get('created_at'))
  ).property('created_at')

  updated: (->
    Date.parse(@get('updated_at'))
  ).property('updated_at')
