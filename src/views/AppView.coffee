class window.AppView extends Backbone.View
  # Added double and split button
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="dealAgain">Deal Again</button><button class="double-button">Double</button> <button class="split-button">Split</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="game-result"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.stand()
    # adding customized event listeners
    'click .dealAgain': -> @model.initialize()
    'click .split-button': ->@model.get('playerHand').split()
    'click .double-button': ->@model.get('playerHand').double()

    # 'click .player-hand-container': -> console.log 'clicked on player hand container'


  initialize: ->
    @render()
    # View listens to Model to render after shuffle
    @model.on 'dealAgain', @render, @
    @model.on 'gameOver', @restart



  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    # show hidden buttons
    $(".hit-button").show()
    $(".stand-button").show()
    $(".dealAgain").hide() # why doesnt this button hide on first run?
    $(".game-result").hide()
  restart: ->
    # hide all buttons besides dealAgain
    $(".dealAgain").show()
    $(".hit-button").hide()
    $(".stand-button").hide()
    $(".game-result").text(@get('gameResult')).show()


