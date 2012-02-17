Spine = require('spine')

Job = require('models/job')

class Joblist extends Spine.Controller
  className: 'joblist'

  events:
    'click .edit': 'edit'

  elements:
    'tbody': 'list'

  constructor: ->
    super
    @active @change

  render: =>
    @html require('views/jobs')(jobs: @jobs)

  change: (params) =>
    @jobs = Job.all()
    @render()

  addOne: (job) ->

  addAll: =>
    Job.each(@addOne)

  edit: (e) ->
    console.log(e)
    console.log(e.target)
    element = $(e.target)
    item = element.data('item')
    console.log item

module.exports = Joblist
