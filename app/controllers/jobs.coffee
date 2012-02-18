Spine = require('spine')
Job = require('models/job')

class Edit extends Spine.Controller
  className: 'job-edit'

  elements:
    'form': 'form'

  events:
    'click #submit': 'submit'
    'click #delete': 'destroy'

  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/job-edit')(@item)

  change: (params) ->
    @item = Job.find(params.id)
    @render()

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate '/jobs'

  destroy: (e) ->
    e.preventDefault()
    @item.destroy() if confirm('Wil je deze job verwijderen?')
    @navigate '/jobs'

class Show extends Spine.Controller
  className: 'job-show'

  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/job-show')(@item)

  change: (params) ->
    @item = Job.find(params.id)
    @render()

  show: (job) ->
    @item = job
    @render()

class Row extends Spine.Controller
  className: 'job-row'

  tag: 'tr'

  constructor: ->
    super

  render: (job) ->
    @html require('views/job-row')(job)

class JobController extends Spine.Stack
  className: 'jobcontroller stack'
    
  controllers:
    show: Show
    row: Row
    edit: Edit
    
module.exports = JobController
