define (require, exports, module) ->
  Backbone = require 'backbone'
  _ = require 'underscore'
  $ = require 'jquery'
  ich = require 'ich'

  class JobView extends Backbone.View
    tagName: 'li'

    initialize: ->
      _.bindAll @

      @template = ich.job

      @model.bind 'change', @render
      @model.bind 'remove', @unrender

    render: ->
      $(@el).html @template(@model.toJSON())

      @

    unrender: ->
      $(@el).remove()

    remove: -> @model.destroy()

    open: ->
      app.navigate('team/' + @model.id, true)

    events:
      'click .delete': 'remove'
      'click .view': 'open'
