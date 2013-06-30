App.Group = DS.Model.extend
  name:       DS.attr('string')
  isPublic:   DS.attr('boolean')
  links:      DS.hasMany('App.Link')
