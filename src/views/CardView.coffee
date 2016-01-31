class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> 
    @render()
    # re-renders Hand when a card is added. Renders 4 cards on initialization
    # console.log "Card V: ",@
  events:
    # Added customized event
    'click': 'print'

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

  print: ->
    console.log "You've clicked ", @
