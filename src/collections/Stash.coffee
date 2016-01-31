class window.Stash extends Backbone.Collection
  model: Chip

  initialize: ->
# build chips and pass in an array of chips to each player
    @fives = new Chip 
      value: 5
      count: 20
    # @tens = new Chip
    #   value: 10
    #   count: 10
    # @hundreds = new Chip
    #   value: 100
    #   count: 2
    @playerStash = {fives: @fives, isDealer : false}
    @dealerStash = {fives: @fives, isDealer : true}
    return
  # getTotal -> @reduce

