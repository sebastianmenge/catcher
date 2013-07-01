# App.Adapter = DS.RESTAdapter.extend
#   serializer: DS.RESTSerializer.extend
#     primaryKey: (type) ->
#       return '_id';

App.Store = DS.Store.extend
  adapter: DS.RESTAdapter

DS.RESTAdapter.reopen
  namespace: 'api'
