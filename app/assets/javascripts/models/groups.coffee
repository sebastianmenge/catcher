App.Group = DS.Model.extend
  name:       DS.attr('string')
  isPublic:   DS.attr('boolean')

  context:    DS.belongsTo('App.Context')
  links:      DS.hasMany('App.Link')
