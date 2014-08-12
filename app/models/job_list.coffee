define (require, exports, module) ->
  Backbone = require 'backbone'

  Job = require 'cs!models/job'

  class JobList extends Backbone.Collection
    model: Job
    url: '/jobs'
