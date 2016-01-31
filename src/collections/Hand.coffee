class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    lastCard = @deck.pop()
    @add(lastCard)
    @bust()
    @blackJack()
    lastCard
  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0
  # signal bust to View if Score > 21

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]
    # view renders the score

  bust: ->
    # should trigger an event for View to render otherwise bust overlaps with App Model
    # if @minScore()>21 then @trigger('bust',@)
    if @minScore()>21  
      @trigger 'over'
      return

  blackJack: ->
    if @minScore() == 21 then @trigger 'over'

  reveal: ->
    # is @.models the 'proper' way?
    _.each(@models, (card)->
      card.set 'revealed' ,true
      )
  split: ->
    if @models[0].get('value') == @models[1].get('value') then console.log 'Allowed to split' else console.log 'Not allowed to split'
    return
  double: ->
    console.log 'doubling'
    return



