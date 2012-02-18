Spine = require('spine')

Job = require('models/job')
JoblistitemController = require 'controllers/joblistitem'

class Joblist extends Spine.Controller
  className: 'joblist'

  elements:
    'tbody': 'joblist'

  constructor: ->
    super

    Job.fetch()

    @active @change

  change: (params) ->
    # TODO: this is NOT right, but how do I do this?
    # how do I clear a view?
    @joblist.html("")

    @addAll()

  addOne: (job) =>
    view = new JoblistitemController(item: job)
    view.render()
    @joblist.append view.el

  addAll: =>
    @html = ""
    Job.each(@addOne)

module.exports = Joblist
