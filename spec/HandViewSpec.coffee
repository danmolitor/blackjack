assert = chai.assert

describe 'HandView', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    return


  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
      return
    return
  describe 'stand', ->
    it 'should not do anything', ->
      assert.strictEqual(3, 1+1+1);
      return

  describe 'relationship', ->
    it 'hand should be an instance of deck', ->
      assert.strictEqual(hand).to.be.an.instanceOf(deck)
      return
    return

