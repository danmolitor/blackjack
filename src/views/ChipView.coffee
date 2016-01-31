class window.ChipView extends Backbone.View
  className: 'chip'

  template: _.template '<%= total %> with <%= count %> of <%= value %>'

  initialize: -> 
    @render()
    # re-renders Hand when a card is added. Renders 4 cards on initialization
    # console.log "Card V: ",@

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes

  print: ->
    console.log "You've clicked ", @
