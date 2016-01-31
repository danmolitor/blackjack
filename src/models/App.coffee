# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    console.count()
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'over', => @gameOver() # finally works, but why is syntax different?
    @trigger 'dealAgain', @
    return

  dealAgain: ->
    @set 'deck', deck = new Deck()
  stand: ->
    @get('dealerHand').reveal();
    while @get('dealerHand').minScore() < 17
      get( 'dealerHand').hit()
    @gameOver()
    return
      # how to rid the return statement below to only log who wins?
      # check winner should be separated to an independent logic shared between 'hit' and 'stand'
  gameOver: ->
    # saves result for view to render
    @set 'gameResult', if @get('dealerHand').minScore() > 21 then "Dealer busted, Player wins!"
    else if @get('playerHand').minScore() > 21 then "Player busted, Player loses"
    else if @get('playerHand').minScore() is 21 then "BLACKJACK, Player wins!"
    else if @get('playerHand').minScore() > @get('dealerHand').minScore() then "Player wins!"
    else "Player loses"
    @trigger 'gameOver', @ #tells view the game is over
    return

# check scores when stand is clicked
