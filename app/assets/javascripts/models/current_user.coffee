App.CurrentUser = DS.Model.extend
  session: DS.belongsTo('App.Session')
  first_name:       DS.attr('string')
  last_name:        DS.attr('string')
  email:            DS.attr('string')
