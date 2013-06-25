App.User = DS.Model.extend
  session:          DS.belongsTo('App.Session')
  firstName:       DS.attr('string')
  lastName:        DS.attr('string')
  email:            DS.attr('string')
