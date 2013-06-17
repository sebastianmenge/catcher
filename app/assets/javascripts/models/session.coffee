App.Session = DS.Model.extend
  user: DS.belongsTo('App.CurrentUser')
  first_name:       DS.attr('string')
  last_name:        DS.attr('string')
  facebook_uid:     DS.attr('number')
  email:            DS.attr('string')
  birthday:         DS.attr('string')
  locale:           DS.attr('string')
  timezone:         DS.attr('number')

  oauth_token:      DS.attr('string')
  token_expires_at: DS.attr('number')
  signed_request:   DS.attr('string')

  didLoad:->
    alert "jsdkfhkhh"
    @set 'created', true
