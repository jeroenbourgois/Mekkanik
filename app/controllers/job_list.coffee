define (require, exports, module) ->
  Backbone = require 'backbone'
  _ = require 'underscore'
  $ = require 'jquery'
  ich = require 'ich'

  Job = require 'cs!models/job'
  JobView = require 'cs!controllers/job'

  class JobListView extends Backbone.View
    initialize: ->
      _.bindAll @

      @template = ich.job_list
      
      @collection.bind 'add', @appendItem
      @collection.bind 'change', @render
      @collection.bind 'reset', @render

    render: ->
      $(@el).html @template
      
      _.each @collection.models, (team) =>
        @appendItem(team)
      , @

      @

    unrender: ->
      console.log('undelegateEvents')

    changeCollection: ->
      @render()

    addItem: ->
      job = new Job
      job.set name: "A-team"
      
      @collection.add job

    appendItem: (job) ->
      job_view = new JobView model: job

      $(@el).find(' ul').append job_view.render().el

    events: 'click button': 'addItem'
