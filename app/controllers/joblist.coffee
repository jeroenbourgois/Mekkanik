Spine = require('spine')

Job = require('models/job')
JoblistitemController = require 'controllers/joblistitem'

class Joblist extends Spine.Controller
  className: 'joblist'

  elements:
    'tbody': 'joblist'

  events:
    'click .deleteJobs': 'delete'

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

  delete: (e) ->
    e.preventDefault()

    if confirm('Alle geselecteerde jobs verwijderen?')
      $('input[type=checkbox]:checked').each ->
        job = Job.find($(this).attr('data-job-id'))
        job.destroy()
      @change()

module.exports = Joblist
