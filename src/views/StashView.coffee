class window.StashView extends Backbone.View
  className: 'stash'

  template: _.template '<h2 class="Stash">$ <%=fives%></h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    return

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (chip) ->
      new CardView(model: chip).$el
