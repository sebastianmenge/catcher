App.Context = DS.Model.extend
  name:       DS.attr('string')
  groups:     DS.hasMany('App.Group')
