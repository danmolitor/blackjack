class window.Chip extends Backbone.Model
  initialize: (params) ->
    @set
      value: params.value
      count: params.count
      total: params.value * params.count
    return
  # events:
  #   'click':'print'


