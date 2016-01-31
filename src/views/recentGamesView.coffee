# class window.RecentView extends Backbone.View
#   className: 'recent'

#   template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>) $ <span class="stash"></span></h2>'

#   initialize: ->
#     @collection.on 'add remove change', => @render()
#     @render()
#     return

#   render: ->
#     @$el.children().detach()
#     @$el.html @template @collection
#     @$el.append @collection.map (card) ->
#       new CardView(model: card).$el
#     @$('.score').text @collection.scores()[0]