Spine = require('spine')
Job = require('models/job')

class Edit extends Spine.Controller
  className: 'job-edit'

  elements:
    'form': 'form'

  events:
    'click .submit': 'submit'

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
    @navigate '/'

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


class JobController extends Spine.Stack
  className: 'jobcontroller stack'
    
  controllers:
    show: Show
    edit: Edit
    
module.exports = JobController
